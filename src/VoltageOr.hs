module VoltageOr where

import Data.Monoid
import Voltage

data Or a = Or Voltage deriving (Show, Eq)

instance Monoid (Or a) where
  mempty = Or Low
  mappend (Or Low) (Or Low) = Or Low
  mappend (Or _)   (Or _)   = Or High