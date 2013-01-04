-- Monads and do notation.

-- Returns Just 4
z = do
    Just 2
    Just 4

-- Same as z
z' = Just 2 >>= \_ -> Just 4

-- Returns Nothing
z1 = do
    Nothing
    Just 4

-- Just for the sake of completeness, same as z1
z1' = do
    Nothing >>= \_ -> Just 4

-- Like every function in Haskell, bind (>>=) is polymorhic, works differently for different types.
-- So far we have seen the working of the bind defined on the Maybe monad. Lets get some IO bussiness.

-- This will print str.
io = do
    getLine >>= \str -> print str

-- This is the same as io.
io' = do
    getLine >>= print

-- Regarding code below, note that in reality, the IO, if present, is always at the bottom of the stack (at the innermost layer).

-- Monads can be nested.
x :: IO (Maybe String)
x = do
    val <- getLine
    return $ Just val

-- Or even more nested, like deeply nested JSON structures.
y :: Maybe (IO (Maybe String))
y = Just x

-- Once you are in a particular monad, your whole sequence in the do notation will be in that monad.
-- The monad you are in is either defined by the explicit type signature or inferred by the compiler.

-- This would not compile, try it. It wouldn't make sense anyway.
-- stupid = do
--     val <- getLine
--     Just 4
--     print val