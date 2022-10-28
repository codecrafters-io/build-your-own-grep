module Main where

import Data.Char
import Data.List
import Data.Maybe
import System.Environment
import System.Exit

getAllowedCharacters :: String -> String
getAllowedCharacters s = take (length s - 2) $ tail s

getNotAllowedCharacters :: String -> String
getNotAllowedCharacters s = take (length s - 3) $ tail $ tail s

matchPattern :: String -> String -> Bool
matchPattern pat input = do
  if pat == "\\d"
    then any isDigit input
    else
      if pat == "\\w"
        then any (\c -> isAlphaNum c || c == '_') input
        else
          if take 2 pat == "[^"
            then elem False $ fmap (`elem` input) (getNotAllowedCharacters pat)
            else
              if head pat == '['
                then or $ fmap (`elem` input) (getAllowedCharacters pat)
                else
                  if length pat == 1
                    then head pat `elem` input
                    else error $ "Unhandled pattern: " ++ pat

main :: IO ()
main = do
  args <- getArgs
  let pat = args !! 1
  input_line <- getLine

  if head args /= "-E"
    then do
      putStrLn "Expected first argument to be '-E'"
      exitFailure
    else
      if matchPattern pat input_line
        then exitSuccess
        else exitFailure
