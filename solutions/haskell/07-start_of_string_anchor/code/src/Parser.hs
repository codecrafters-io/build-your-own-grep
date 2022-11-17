module Parser (parse) where


import qualified Text.Megaparsec as M
import Text.Megaparsec.Char (char)
import Data.Void
import RegEx

type MParser = M.Parsec Void String
data MathingType = Pos | Neg deriving (Eq)

notChar :: Char -> MParser Char
notChar c = M.satisfy (/=c)

anyNotUsed :: String -> MParser Char
anyNotUsed s = M.satisfy $ not . (`elem` s)

-- The regex parser starts here
-- https://github.com/kean/Regex/blob/master/grammar.ebnf
-- I had to adjust the rule CharacterGroup
-- CharacterGroup         ::= PositiveCharacterGroup | NegativeCharacterGroup
-- PositiveCharacterGroup ::= "[" CharacterGroupItem+ "]"
-- CharacterGroup         ::= "[" CharacterGroupNegativeModifier CharacterGroupItem+ "]"

pRegEx :: MParser (M Char)
pRegEx = do
  s <- pStartOfString
  e <- pExpression
  return $ concatM [s, e]

pStartOfString :: MParser (M Char)
pStartOfString = do
  s <- M.optional $ char '^'
  return $ case s of
    Nothing -> concatM [kleeneStarM anyCharM]
    Just _ -> noOpM

pExpression :: MParser (M Char)
pExpression = pSubExpression

pSubExpression :: MParser (M Char)
pSubExpression = do
  subExp <- M.some $ M.try pMatch 
  return $ concatM subExp

pMatch :: MParser (M Char)
pMatch = pMatchItem

pMatchItem :: MParser (M Char)
pMatchItem = do
  M.try pMatchCharacterClass M.<|> M.try pMatchCharacter

pMatchCharacterClass :: MParser (M Char)
pMatchCharacterClass = M.try pCharacterGroup M.<|> fmap (\g -> g Pos ) (M.try pCharacterClass)

pMatchCharacter :: MParser (M Char)
pMatchCharacter = do
  -- TODO: Update to only consume non special characters like letters or digits etc.
  c <- anyNotUsed "|()$"
  return $ posLit c

pCharacterGroup :: MParser (M Char)
pCharacterGroup = M.try pPositiveCharacterGroup M.<|> M.try pNegativeCharacterGroup

pPositiveCharacterGroup :: MParser (M Char)
pPositiveCharacterGroup = do
  _ <- char '['
  c <- anyNotUsed "^]"
  cs <- M.many $ pCharacterGroupItem posLit Pos
  let cs' = posLit c : cs
  _ <- char ']'
  return $ altM cs'

pNegativeCharacterGroup :: MParser (M Char)
pNegativeCharacterGroup = do
  _ <- char '['
  _ <- char '^'
  ms <- M.some $ pCharacterGroupItem negLit Neg
  _ <- char ']'
  return $ andM ms

pCharacterGroupItem :: (Char -> M Char) -> MathingType -> MParser (M Char)
pCharacterGroupItem f b = fmap (\g -> g b) (M.try pCharacterClass) M.<|> fmap f (M.try pChar)


pCharacterClass :: MParser (MathingType -> M Char)
pCharacterClass = M.try pCharacterClassAnyWord M.<|> M.try pCharacterClassAnyDecimal

pCharacterClassAnyWord :: MParser (MathingType -> M Char)
pCharacterClassAnyWord = do
  _ <- char '\\'
  _ <- char 'w'
  return $ \b -> if b == Pos then alphaNumM else alphaNumInverseM


pCharacterClassAnyDecimal :: MParser (MathingType -> M Char)
pCharacterClassAnyDecimal = do
  _ <- char '\\'
  _ <- char 'd'
  return $ \b -> if b == Pos then digitM else digitInverseM

pChar :: MParser Char
pChar = notChar ']'

parse :: String -> M Char
parse s = case M.parse pRegEx "Error" s of
                 Left e -> error $ M.errorBundlePretty e
                 Right x -> x
