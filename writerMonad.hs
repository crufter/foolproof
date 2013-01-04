-- I found this monad one of the most easily understandable, it is both clear in usage, and in the problem it solves.
import Control.Monad.Writer

fact1 :: Integer -> Writer String Integer
fact1 0 = return 1
fact1 n = do
    let n' = n-1
    tell $ "We've taken one away from " ++ show n ++ "\n"
    m <- fact1 n'
    tell $ "We've called f " ++ show m ++ "\n"
    let r = n*m
    tell $ "We've multiplied " ++ show n ++ " and " ++ show m ++ "\n"
    return r

-- ex1 = runWriter (fact1 10)
-- we get back both 10! and a list of what it took to compute this.