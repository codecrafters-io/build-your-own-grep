module Main where

import System.Environment
import System.Exit

matchPattern :: String -> String -> Bool
matchPattern pattern input = do
  if length pattern == 1
    then head pattern `elem` input
    else error $ "Unhandled pattern: " ++ pattern

main :: IO ()
main = do
  args <- getArgs
  let pattern = args !! 1
  input_line <- getLine

  -- You can use print statements as follows for debugging, they'll be visible when running tests.
  putStrLn "Logs from your program will appear here"

  -- Uncomment this block to pass stage 1
  -- if head args /= "-E"
  --   then do
  --     putStrLn "Expected first argument to be '-E'"
  --     exitFailure
  --   else do if matchPattern pattern input_line
  --             then exitSuccess
  --             else exitFailure
