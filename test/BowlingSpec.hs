module BowlingSpec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import Bowling

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "True" $ do
    it "is true" $ do
      True `shouldBe` True

  -- describe "Bowling" $ do
  --   it "removes leading and trailing whitespace" $ do
  --     strip "\t  foo bar\n" `shouldBe` "foo bar"
  --   it "is idempotent" $ property $
  --     \str -> strip str === strip (strip str)
