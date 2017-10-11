module BowlingSpec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import Bowling

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

game :: [Int] -> Game
game = id

spec :: Spec
spec = do
  describe "True" $
    it "is true" $
      True `shouldBe` True

  describe "Bowling Score" $ do
    context "20 misses" $
      it "is 0" $ do
        let g = game $replicate 20 0
        score g `shouldBe` 0

    context "10 times 9-" $
      it "is 90" $ do
        let g = game $ take 20 $ cycle [9, 0]
        score g `shouldBe` 90
