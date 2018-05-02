module FullAdder where

import Data.Monoid
import HalfAdder
import Voltage
import VoltageOr

fullAdder :: Voltage -> Voltage -> Voltage -> (Voltage, Voltage)
fullAdder = undefined