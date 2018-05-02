module VoltageNand where

  import Voltage
  data Nand a = Nand Voltage deriving (Eq, Show)

  class NotSame a where
    (!&&) :: a -> a -> a

  instance NotSame Voltage where
    (!&&) (High) (High) = Low
    (!&&) _      _      = High