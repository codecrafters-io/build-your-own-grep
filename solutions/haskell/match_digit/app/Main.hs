module Main where

import System.Environment
import System.Exit
import Data.Char

matchPattern :: String -> String -> Bool
matchPattern pat input = do if pat == "\\d"
                               then any isDigit input
                               else if length pat == 1
                                    then head pat `elem` input
                                    else error $ "Unhandled pattern: " ++ pat


main :: IO ()
main = do args <- getArgs
          let pat = args !! 1
          input_line <- getLine

          if head args /= "-E"
            then do putStrLn "Expected first argument to be '-E'"
                    exitFailure
            else do putStrLn "Logs from your program will appear here!"
                    if matchPattern pat input_line
                      then exitSuccess
                      else exitFailure
