module FullAdder where

import Data.Monoid
import HalfAdder
import Voltage
import VoltageOr

fullAdder :: Voltage -> Voltage -> Voltage -> (Voltage, Voltage)
fullAdder x y z =
  (sum, carry)
      where
        (sum1, carry1) = halfAdder x y
        (sum, carry2) = halfAdder sum1 z
        Or carry = Or carry1 <> Or carry2
