module VoltageAnd where

import Voltage

data And a = And Voltage deriving (Show, Eq)

instance Monoid (And a) where
  mempty = And High
  mappend (And High) (And High) = And High
  mappend _ _ = And Low