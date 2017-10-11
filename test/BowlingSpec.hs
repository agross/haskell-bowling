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

    context "6/ 30 00 ..." $
      it "is 16" $ do
        let g = game $ take 20 $ [6, 4, 3, 0] ++ repeat 0
        score g `shouldBe` 16

    context "5/ ... 5/5" $
      it "is 150" $ do
        let g = game $ replicate 21 5
        score g `shouldBe` 150

    context "5/ ... 5/3" $
      it "is 148" $ do
        let g = game $ replicate 20 5 ++ [3]
        score g `shouldBe` 148

    context "X 43 00 ..." $
      it "is 24" $ do
        let g = game $ take 20 $ [10, 4, 3] ++ repeat 0
        score g `shouldBe` 24

    context "X X 43 00 ..." $
      it "is 48" $ do
        let g = game $ take 20 $ [10, 10, 4, 3] ++ repeat 0
        score g `shouldBe` 48

    context "perfect game" $
      it "is 300" $ do
        let g = game $ replicate 12 10
        score g `shouldBe` 300

    context "chaotic scoring" $
      it "is 133" $ do
        let g = game [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
        score g `shouldBe` 133


