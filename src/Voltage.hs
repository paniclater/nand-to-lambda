module Voltage where

import Data.Monoid
import Data.Semigroup

data Voltage = Low | High deriving (Show, Eq, Ord)

data And a = And Voltage deriving (Show, Eq, Ord)

instance Monoid (And a) where
  mempty = And High
  mappend (And High) (And High) = And High
  mappend _ _ = And Low

data Or a = Or Voltage deriving (Show, Eq, Ord)

instance Monoid (Or a) where
  mempty = Or Low
  mappend (Or Low) (Or Low) = Or Low
  mappend (Or _)   (Or _)   = Or High


data Nand a = Nand Voltage deriving (Eq, Show)

class Nandoid a where
  (!&&) :: a -> a -> a

instance Nandoid Voltage where
  (!&&) (High) (High) = Low
  (!&&) _      _      = High

data Xor a = Xor Voltage deriving (Eq, Show)

instance Semigroup (Xor a) where
  (<>) (Xor Low) (Xor Low) = Xor Low
  (<>) (Xor High) (Xor High) = Xor Low
  (<>) _ _ = Xor High