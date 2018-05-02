module Add16 where

import Data.Monoid as M
import Data.Semigroup as S
import CombinatoryBoolean
import Voltage
import VoltageAnd
import VoltageOr
import VoltageXor
import HalfAdder
import FullAdder

first = [High, High, High, Low, Low, High, Low, Low, Low, High]
second = [High, Low, Low, Low, Low, Low, Low, Low, Low, Low ]

add16 f s =
  let
    ((x, y) : xs) = zip f s
    (s1, c1) = halfAdder x y
  in
    go [s1] c1 xs
  where
    go result _ [] = reverse result
    go result c ((x, y) : xs) = go (sum : result) carry xs
      where
        (sum, carry) = fullAdder c x y

result = add16 first second
expected = [Low, Low, Low, High, Low, High, Low, Low, Low, High]