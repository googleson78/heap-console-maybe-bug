{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ViewPatterns #-}

module Lib where

import Data.Data (Data)
import Heap.Console

data Person = Person {name :: Int, age :: String}
  deriving stock (Show, Data)

data Thing
  = A Person
  | B (Int, String) Char
  deriving stock (Show, Data)

someFunc :: IO ()
someFunc = do
  let x = A $ Person 42 "pesho"
      y = B (42, "barov") '!'
  case Person 42 "lol" of
    InspectD (Person _ _) -> print x
  case y of
    InspectD (A _) -> print y
    B _ _ -> print y

pattern InspectD :: Data a => a -> a
pattern InspectD x <- (inspectD -> x)
