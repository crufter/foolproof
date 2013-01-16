import Data.IORef
import Control.Monad as Cm

-- IORefs can only be used in the IO monad.
x :: IO Int
x = do
    ref <- newIORef 2
    modifyIORef ref (*10)
    readIORef ref

y :: IO ()
y = do
    ref <- newIORef 0
    Cm.replicateM_ 10 $ modifyIORef ref (+1)
    readIORef ref >>= print
