module CombinatoryBoolean where

import Nand
import Voltage
import Data.Function
import Data.Aviary.Birds
(...) = blackbird

not' :: Voltage -> Voltage
not' x = nand x x

and' :: Voltage -> Voltage -> Voltage
and' x y = not' (nand x y)

and'' :: Voltage -> Voltage -> Voltage
and'' = not' ... nand

or' :: Voltage -> Voltage -> Voltage
or' Low Low = Low
or' _ _ = High

xor :: Voltage -> Voltage -> Voltage
xor High High = Low
xor Low  Low = Low
xor _ _ = High

