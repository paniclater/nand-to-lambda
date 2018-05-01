module CombinatoryBoolean where

import Nand
import Voltage
import Data.Function
import Data.Aviary.Birds

not' :: Voltage -> Voltage
not' a = nand a a

and' :: Voltage -> Voltage -> Voltage
and' a b =  not' (nand a b)

(...) = blackbird

and'' :: Voltage -> Voltage -> Voltage
and'' = not' ... nand
