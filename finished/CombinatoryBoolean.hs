module CombinatoryBoolean where

import Nand
import Voltage

not' :: Voltage -> Voltage
not' x = nand x x

and' :: Voltage -> Voltage -> Voltage
and' x y = not' (nand x y)