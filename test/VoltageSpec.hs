module VoltageSpec where

import Voltage

import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

instance Arbitrary (And a) where
  arbitrary = elements [And High, And Low]

instance Eq a => EqProp (And a) where
  (=-=) = eq

instance Eq a => Arbitrary (Or a) where
  arbitrary = elements [Or High, Or Low]

instance Eq a => EqProp (Or a) where
  (=-=) = eq

instance Eq a=> Arbitrary (Xor a) where
  arbitrary = elements [Xor High, Xor Low]

instance Eq a => EqProp (Xor a) where
  (=-=) = eq

-- testMonoidAnd = quickBatch $ monoid (And High)
testMonoidOr = quickBatch $ monoid (Or High)