{-# LANGUAGE ScopedTypeVariables #-}


module RegExSpec where

import Test.Hspec
import Data.Char (isDigit, isAlphaNum)
import RegEx

spec :: Spec
spec = do
  describe "unit tests" $ do
    it "\\d should match 123" $
      digitM "123" `shouldBe` ["23"]
    it "\\d should not match apple" $
      digitM "apple" `shouldBe` []
    it "\\w should match word" $
      alphaNumM "word" `shouldBe` ["ord"]
    it "\\w should not match $!?" $
      alphaNumM "$!?" `shouldBe` []
    it "[abcd] should match a" $
      altM (fmap posLit "abcd") "a" `shouldBe` [""]
    it "[abcd] should not match efgh" $
      altM (fmap posLit "abcd") "efgh" `shouldBe` []
    it "[^xyz] should match apple" $
      andM (fmap negLit "xyz") "apple" `shouldBe` ["pple", "pple", "pple", "pple"]
    it "[^anb] should not match banana" $
      andM (fmap negLit "anb") "banana" `shouldBe` []
    it "[^\\w] should not match banana" $
      alphaNumInverseM "banana" `shouldBe` []
    it "[^\\d] should not match 1" $
      digitInverseM "1" `shouldBe` []
    it "\\d apple should match 3 apples" $
      concatM (digitM : fmap posLit " apple") "3 apple" `shouldBe` [""]
    it "\\d apple should not match 1 orange" $
      concatM (digitM : fmap posLit " apple") "3 orange" `shouldBe` []
    it "\\d\\d\\d apples should match 124 apples" $
      concatM ([digitM, digitM, digitM] ++ fmap posLit " apples") "123 apples" `shouldBe` [""]
    it "\\d\\d\\d apples should not match 12 apples" $
      concatM ([digitM, digitM, digitM] ++ fmap posLit " apples") "12 apples" `shouldBe` []
      
    it "\\d \\w\\w\\ws should match 3 dogs" $
      concatM [digitM, posLit ' ',  alphaNumM, alphaNumM, alphaNumM, posLit 's'] "3 dogs" `shouldBe` [""]
    it "\\d \\w\\w\\ws should match 4 dogs" $
      concatM [digitM, posLit ' ',  alphaNumM, alphaNumM, alphaNumM, posLit 's'] "3 dogs" `shouldBe` [""]
    it "\\d \\w\\w\\ws should not match 1 dog" $
      concatM [digitM, posLit ' ',  alphaNumM, alphaNumM, alphaNumM, posLit 's'] "1 dog" `shouldBe` []
