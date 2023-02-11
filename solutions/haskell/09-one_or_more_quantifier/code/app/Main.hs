module Main (main) where

import System.IO
import System.Environment
import System.Exit
import Data.Maybe
import Parser
import RegEx

grep :: M Char -> IO [(Bool, String)]
grep pattern = do
  done <- isEOF
  if done
    then return []
    else do
      input_line <- getLine
      let r = isMatching pattern input_line
      rs <- grep pattern
      return $ (r, input_line) : rs


main :: IO ()
main = do
  args <- getArgs
  let pattern = parse $ args !! 1

  if isNothing pattern
    then do
      putStrLn "Invalid pattern"
      exitFailure
    else do
      if head args /= "-E"
      then do
        putStrLn "Expected first argument to be '-E'"
        exitFailure
      else do
        bs <- grep $ astToMatcher $ fromJust pattern
        if any ((==True) . fst) bs
          then do
            mapM_ (putStrLn . snd) $ filter ((==True) . fst) bs
            exitSuccess
          else do
            exitFailure
