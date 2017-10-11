module Bowling where

type Try = Int
type Tries = [Try]
type Score = Int
type Game = Tries

score :: Game -> Score
score (t1:t2:bonus:rest)
  | null rest =
    t1 + t2 + bonus
  | t1 == 10 =
    t1 + t2 + bonus + score(t2:bonus:rest)
  | t1 + t2 == 10 =
    t1 + t2 + bonus + score(bonus:rest)
  | otherwise =
    t1 + t2 + score(bonus:rest)
score (x:rest) = x + score rest
score [] = 0
