module Add16 where

import CombinatoryBoolean
import Voltage
import VoltageAnd
import VoltageOr
import VoltageXor
import HalfAdder
import FullAdder

voltageToInt :: Voltage -> Int
voltageToInt High = 1
voltageToInt Low = 0

voltagesToBinaryString :: [Voltage] -> String
voltagesToBinaryString xs = foldl (\acc x -> show x ++ acc) "" $ fmap voltageToInt xs

add16 :: [Voltage] -> [Voltage] -> [Voltage]
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

first = [High, High, High, Low, Low, High, Low, Low, Low, High]
second = [High, Low, Low, Low, Low, Low, Low, Low, Low, Low ]
result = voltagesToBinaryString $ add16 first second
expected = voltagesToBinaryString [Low, Low, Low, High, Low, High, Low, Low, Low, High]