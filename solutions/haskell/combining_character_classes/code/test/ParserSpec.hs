{-# LANGUAGE ScopedTypeVariables #-}


module ParserSpec where

import Test.Hspec
import Data.Char (isDigit, isAlphaNum)
import Parser

spec :: Spec
spec = do
  describe "unit tests" $ do
    it "\\d should match 123" $
      parse "\\d" "123" `shouldBe` ["23"]
    it "\\d should not match apple" $
      parse "\\d" "apple" `shouldBe` []
    it "\\w should match word" $
      parse "\\w" "word" `shouldBe` ["ord"]
    it "\\w should not match $!?" $
      parse "\\w" "$!?" `shouldBe` []
    it "[abcd] should match a" $
      parse "[abcd]" "a" `shouldBe` [""]
    it "[abcd] should not match efgh" $
      parse "[abcd]" "efgh" `shouldBe` []
    it "[^xyz] should match apple" $
      parse "[^xyz]" "apple" `shouldBe` ["pple", "pple", "pple", "pple"]
    it "[^anb] should not match banana" $
      parse "[^anb]" "banana" `shouldBe` []
    it "[^\\w] should not match banana" $
      parse "[^\\w]" "banana" `shouldBe` []
    it "[^\\d] should not match 1" $
      parse "[^\\d]" "1" `shouldBe` []
    it "\\d apple should match 3 apples" $
      parse "\\d apple" "3 apple" `shouldBe` [""]
    it "\\d apple should not match 1 orange" $
      parse "\\d apple" "3 orange" `shouldBe` []
    it "\\d\\d\\d apples should match 124 apples" $
      parse "\\d\\d\\d apples" "123 apples" `shouldBe` [""]
    it "\\d\\d\\d apples should not match 12 apples" $
      parse "\\d\\d\\d apples" "12 apples" `shouldBe` []
      
    it "\\d \\w\\w\\ws should match 3 dogs" $
      parse "\\d \\w\\w\\ws" "3 dogs" `shouldBe` [""]
    it "\\d \\w\\w\\ws should match 4 dogs" $
      parse "\\d \\w\\w\\ws" "3 dogs" `shouldBe` [""]
    it "\\d \\w\\w\\ws should not match 1 dog" $
      parse "\\d \\w\\w\\ws" "1 dog" `shouldBe` []
