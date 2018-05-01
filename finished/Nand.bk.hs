module Nand where

import Voltage


-- NAND Truth Table
-- Inputs    | Output
----------------
-- High High | Low
-- High Low  | High
-- Low  High | High
-- Low  Low  | High

nand :: Voltage -> Voltage -> Voltage
nand High High = Low
nand High Low = High
nand Low High = Low
nand Low Low = High