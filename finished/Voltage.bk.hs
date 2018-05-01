module Voltage where

import Data.Monoid

data Voltage = Low | High deriving (Show, Eq)

data And a = And Voltage deriving (Show, Eq)

instance Monoid (And a) where
  mempty = And High
  mappend (And High) (And High) = And High
  mappend _ _ = And Low


data Or a = Or Voltage deriving (Show, Eq)

instance Monoid (Or a) where
  mempty = Or Low
  mappend (Or Low) (Or Low) = Or Low
  mappend (Or _)   (Or _)   = Or High


data Nand a = Voltage deriving (Eq, Show)

class Nandoid a where
  (!&&) :: a -> a -> a

instance Nandoid Voltage where
  (!&&) (High) (High) = Low
  (!&&) _      _      = High