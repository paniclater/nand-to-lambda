module Nand where

import Voltage

nand :: Voltage -> Voltage -> Voltage
nand High High = Low
nand _ _ = High
