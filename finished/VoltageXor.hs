module VoltageXor where
import Data.Monoid
import Voltage

data Xor a = Xor Voltage deriving (Eq, Show)

instance Monoid (Xor a) where
  mempty = Xor Low
  mappend (Xor Low) (Xor Low) = Xor Low
  mappend (Xor High) (Xor High) = Xor Low
  mappend _ _ = Xor High