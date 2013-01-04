import Control.Applicative

-- Lifting.
-- http://stackoverflow.com/questions/2395697/haskell-newbie-question-what-is-lifting

-- Result: Just 3
f = liftA (+1) (Just 2)

-- Result: Just [1,2,3,4]
g = liftA2 (++) (Just [1,2]) (Just [3,4])