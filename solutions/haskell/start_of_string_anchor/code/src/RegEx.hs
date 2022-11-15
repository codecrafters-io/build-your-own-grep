module RegEx
  where

import Data.Char (isDigit, isAlphaNum)

type M a = [a] -> [[a]]

singleM :: (a -> Bool) -> M a
singleM _ [] = []
singleM p (c:cs) = if p c then [cs] else []

posLit :: Eq a => a -> M a
posLit c = singleM (== c)

negLit :: Eq a => a -> M a
negLit c = singleM (/= c)

digitM :: M Char
digitM = singleM isDigit

digitInverseM :: M Char
digitInverseM = singleM (not . isDigit)

alphaNumM :: M Char
alphaNumM = singleM (\c -> isAlphaNum c || c == '_')

alphaNumInverseM :: M Char
alphaNumInverseM = singleM (\c -> not (isAlphaNum c) && c /= '_')

anyCharM :: M a
anyCharM = singleM (const True)

failM :: M a
failM _ = []

noOpM :: M a
noOpM s = [s]

altM :: [M a] -> M a
altM [] = failM
altM (m:ms) = \s -> m s ++ altM ms s

concatM :: [M a] -> M a
concatM [] = noOpM
concatM (m:ms) = \s -> concatMap (concatM ms) (m s)

andM :: [M a] -> M a
andM [] = \s -> if null s then [[]] else [tail s]
andM (m:ms) = \s -> let xs = m s
                        ys = andM ms s
                        in if null xs || null ys then [] else xs ++ ys

kleeneStarM :: M a -> M a
kleeneStarM m = altM [noOpM, kleenePlusM m]

kleenePlusM :: M a -> M a
kleenePlusM m = concatM [m, kleeneStarM m]

matching :: M a -> [a] -> [a]
matching m s = take (length s - l) s
  where xs = m s
        l  = if null xs then length s else minimum $ map length xs