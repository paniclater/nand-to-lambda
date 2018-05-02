module HalfAdder where

import Data.Monoid
import Voltage
import VoltageAnd
import VoltageXor

halfAdder :: Voltage -> Voltage -> (Voltage, Voltage)
halfAdder x y = (sum, carry)
  where
    Xor sum = Xor x <> Xor y
    And carry = And x <> And y