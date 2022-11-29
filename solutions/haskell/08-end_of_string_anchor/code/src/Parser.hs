module Parser (parse, astToMatcher, AST(..)) where

import qualified Text.Megaparsec as M
import Text.Megaparsec.Char (char, digitChar)
import Data.Void (Void)
import Data.Maybe (fromMaybe, isNothing)
import RegEx (M, posLit, negLit, emptyStrM, digitM, digitInverseM, alphaNumM, alphaNumInverseM, anyCharM, orM, andM, concatM, kleeneStarM, kleenePlusM)

type MParser = M.Parsec Void String

data AST a = PosLit a
           | NegLit a
           | DigitM
           | DigitInverseM
           | AlphaNumM
           | AlphaNumInverseM
           | AnyCharM
           | OrM [AST a]
           | AndM [AST a]
           | ConcatM [AST a]
           | KleeneStarM (AST a)
           | KleenePlusM (AST a)
           | EmptyStrM
           deriving (Eq, Show)


astToMatcher :: AST Char -> M Char
astToMatcher (PosLit a)       = posLit a
astToMatcher (NegLit a)       = negLit a
astToMatcher DigitM           = digitM
astToMatcher DigitInverseM    = digitInverseM
astToMatcher AlphaNumM        = alphaNumM
astToMatcher AlphaNumInverseM = alphaNumInverseM
astToMatcher AnyCharM         = anyCharM
astToMatcher (OrM ms)         = orM $ fmap astToMatcher ms
astToMatcher (AndM ms)        = andM $ fmap astToMatcher ms
astToMatcher (ConcatM ms)     = concatM $ fmap astToMatcher ms
astToMatcher (KleeneStarM m)  = kleeneStarM $ astToMatcher m
astToMatcher (KleenePlusM m)  = kleenePlusM $ astToMatcher m
astToMatcher EmptyStrM        = emptyStrM


notChar :: Char -> MParser Char
notChar c = M.satisfy (/=c)

anyNotUsed :: String -> MParser Char
anyNotUsed s = M.satisfy $ not . (`elem` s)

-- | Inverts an AST Char
neg :: AST Char -> AST Char
neg DigitM     = DigitInverseM
neg AlphaNumM  = AlphaNumInverseM
neg (PosLit c) = NegLit c
neg _          = error "Unsupported input string"


-- The regex parser starts here
-- https://github.com/kean/Regex/blob/master/grammar.ebnf
-- I had to adjust a few rules to support better parsing 

pRegEx :: MParser (AST Char)
pRegEx = do
  s <- pStartOfString
  expression <- pExpression
  e <- pEndOfString
  return $ ConcatM [s, expression, e]

pStartOfString :: MParser (AST Char)
pStartOfString = do
  s <- M.optional $ char '^'
  return $ if isNothing s then  KleeneStarM AnyCharM else EmptyStrM

pEndOfString :: MParser (AST Char)
pEndOfString = do
  s <- M.optional $ char '$'
  return $ if isNothing s then KleeneStarM AnyCharM else EmptyStrM

pExpression :: MParser (AST Char)
pExpression = pSubExpression

pSubExpression :: MParser (AST Char)
pSubExpression = do
  subExp <- M.some $ M.try pMatch
  return $ ConcatM subExp

pMatch :: MParser (AST Char)
pMatch = pMatchItem

pMatchItem :: MParser (AST Char)
pMatchItem = M.try pMatchCharacterClass M.<|> M.try pMatchCharacter

pMatchCharacterClass :: MParser (AST Char)
pMatchCharacterClass = M.try pCharacterGroup M.<|> M.try pCharacterClass

pMatchCharacter :: MParser (AST Char)
pMatchCharacter = do
  c <- anyNotUsed "|()$"
  return $ PosLit c

pCharacterGroup :: MParser (AST Char)
pCharacterGroup = M.try pPositiveCharacterGroup M.<|> M.try pNegativeCharacterGroup

pPositiveCharacterGroup :: MParser (AST Char)
pPositiveCharacterGroup = do
  _ <- char '['
  c <- anyNotUsed "^]"
  cs <- M.many pCharacterGroupItem
  let cs' = PosLit c : cs
  _ <- char ']'
  return $ OrM cs'

pNegativeCharacterGroup :: MParser (AST Char)
pNegativeCharacterGroup = do
  _ <- char '['
  _ <- char '^'
  ms <- M.some pCharacterGroupItem
  _ <- char ']'
  return $ AndM $ fmap neg ms

pCharacterGroupItem :: MParser (AST Char)
pCharacterGroupItem = M.try pCharacterClass M.<|> M.try pChar


pCharacterClass :: MParser (AST Char)
pCharacterClass = M.try pCharacterClassAnyWord M.<|> M.try pCharacterClassAnyDecimal

pCharacterClassAnyWord :: MParser (AST a)
pCharacterClassAnyWord = do
  _ <- char '\\'
  _ <- char 'w'
  return AlphaNumM

pCharacterClassAnyDecimal :: MParser (AST Char)
pCharacterClassAnyDecimal = do
  _ <- char '\\'
  _ <- char 'd'
  return DigitM

pChar :: MParser (AST Char)
pChar = do
  c <- notChar ']'
  return $ PosLit c

parse :: String -> Maybe (AST Char)
parse = M.parseMaybe pRegEx
