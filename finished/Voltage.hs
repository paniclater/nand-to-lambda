module Voltage where

import Data.Monoid
import Data.Semigroup

data Voltage = Low | High deriving (Show, Eq, Ord)