import Control.Monad.State

data Person = Person {
    name    :: String,
    address :: Address
} deriving (Eq, Show)

data Address = Address {
    street :: String
} deriving (Eq, Show)

modLevel0 :: State Person ()
modLevel0 = do
    modify (\x -> x{name = "Joe"})

-- Accessing and modifying even a first level child of a record gets quite messy.
modLevel1 :: State Person ()
modLevel1 = do
    modify (\x -> x{address = Address (reverse (street (address x)))})

-- This is why we need lenses. Coming soon...