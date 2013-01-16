{-# LANGUAGE TemplateHaskell, TypeOperators, NoMonomorphismRestriction #-}

import Control.Monad.State
import qualified Control.Category as CC
import qualified Data.Label as L -- This is fclabels package, install with cabal install fclabels
-- There are other popular and similar packages like lenses, data-lens, etc.

(.>) = (CC..)

data Person = Person {
    _name    :: String,
    _address :: Address
} deriving (Eq, Show)

data Address = Address {
    _street :: String
} deriving (Eq, Show)

modLevel0 :: State Person ()
modLevel0 = do
    modify (\x -> x{_name = "Joe"})

-- Accessing and modifying even a first level child of a record gets quite messy.
modLevel1 :: State Person ()
modLevel1 = do
    modify (\x -> x{_address = Address (reverse (_street (_address x)))})

-- This is why we need lenses.
-- 'Person refers to the data constructor. ''Person refers to the type constructor
$(L.mkLabels [''Person, ''Address]) -- This is template haskell.

-- > runState (modLevel1') (Person "Joe" (Address "Whatever street"))
modLevel0' :: State Person ()
modLevel0' = do
    modify $ \a -> L.set (street .>  address) "wtf" a

modLevel1' :: State Person ()
modLevel1' = do
    modify $ \a -> L.modify (street .>  address) reverse a
