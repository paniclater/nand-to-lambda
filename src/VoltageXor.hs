module VoltageXor where
import Data.Semigroup
import Voltage

data Xor a = Xor Voltage deriving (Eq, Show)

instance Semigroup (Xor a) where
  (<>) (Xor Low) (Xor Low) = Xor Low
  (<>) (Xor High) (Xor High) = Xor Low
  (<>) _ _ = Xor High