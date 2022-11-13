module Main (main) where

import System.Environment
import System.Exit
import Parser (parse)
import RegEx (matching)

main :: IO ()
main = do
  args <- getArgs
  let pat = args !! 1
  input_line <- getLine

  if head args /= "-E"
    then do
      putStrLn "Expected first argument to be '-E'"
      exitFailure
    else do
      let s = matching (parse pat) input_line
      if null s
        then exitFailure
        else do
          exitSuccess
