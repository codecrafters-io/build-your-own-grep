import Test.Hspec
import qualified RegExSpec
import qualified ParserSpec

main :: IO ()
main = do hspec spec

spec :: Spec
spec = do describe "RegEx" RegExSpec.spec
          describe "Parser" ParserSpec.spec
