module Main where

import System.Environment
import System.Exit

matchPattern :: String -> String -> Bool
matchPattern pat input = do
  if length pat == 1
    then head pat `elem` input
    else error $ "Unhandled pattern: " ++ pat

main :: IO ()
main = do
  args <- getArgs
  let pat = args !! 1
  input_line <- getLine

  -- You can use print statements as follows for debugging, they'll be visible when running tests.
  putStrLn "Logs from your program will appear here"

  -- Uncomment this block to pass stage 1
  -- if head args /= "-E"
  --   then do
  --     putStrLn "Expected first argument to be '-E'"
  --     exitFailure
  --   else do if matchPattern pat input_line
  --             then exitSuccess
  --             else exitFailure
