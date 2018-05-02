module HalfAdder where

import Data.Monoid as M
import Data.Semigroup as S
import Voltage
import VoltageAnd
import VoltageXor

halfAdder :: Voltage -> Voltage -> (Voltage, Voltage)
halfAdder x y = (sum, carry)
  where
    Xor sum = Xor x S.<> Xor y
    And carry = And x M.<> And y