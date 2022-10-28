module Main where

import Data.Char
import System.Environment
import System.Exit

matchPattern :: String -> String -> Bool
matchPattern pat input = do
  if pat == "\\d"
    then any isDigit input
    else
      if pat == "\\w"
        then any (\c -> isAlphaNum c || c == '_') input
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
