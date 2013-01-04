import Control.Monad.State

fact3 :: Integer -> State Integer Integer
fact3 0 = return 1
fact3 n = do
    let n' = n-1
    modify (+1)
    m <- fact3 n'
    let r = n*m
    modify (+1)
    return r

-- You can run a function using the state monad by issuing
-- > runState (fact3 10) 0

-- > runState (example1) 0 -- Will return (6, 2) as expected.
example1 :: State Integer Integer
example1 = do
    modify (+1)
    example2
    return 6

example2 :: State Integer Integer
example2 = do
    modify (+1)
    return 5

