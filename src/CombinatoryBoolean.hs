module CombinatoryBoolean where

import Nand
import Voltage
import Data.Function
import Data.Aviary.Birds
(...) = blackbird

not' :: Voltage -> Voltage
not' x = undefined

and' :: Voltage -> Voltage -> Voltage
and' x y = undefined

and'' :: Voltage -> Voltage -> Voltage
and'' = undefined

xor :: Voltage -> Voltage -> Voltage
xor High High = Low
xor Low  Low = Low
xor _ _ = High

