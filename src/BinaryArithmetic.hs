module BinaryArithmetic where

import Data.Monoid as M
import Data.Semigroup as S
import CombinatoryBoolean
import Voltage
import VoltageAnd
import VoltageOr
import VoltageXor

halfAdder :: Voltage -> Voltage -> (Voltage, Voltage)
halfAdder x y = (sum, carry)
  where
    Xor sum = Xor x S.<> Xor y
    And carry = And x M.<> And y

--TODO: Implement as fold :)
fullAdder :: Voltage -> Voltage -> Voltage -> (Voltage, Voltage)
fullAdder x y z =
  (sum2, (or' carry1 carry2))
      where
        (sum1, carry1) = halfAdder x y
        (sum2, carry2) = halfAdder sum1 z

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