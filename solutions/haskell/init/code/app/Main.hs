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
  putStrLn "Logs from your program will appear here"
