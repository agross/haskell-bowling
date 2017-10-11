module Bowling where

type Try = Int
type Tries = [Try]
type Score = Int
type Game = Tries

score :: Game -> Score
score = sum
