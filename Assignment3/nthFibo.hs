import Data.List
import System.IO 

-- Let Fn denote the nth Fibonacci number
-- The function next fibo when given (Fn,F(n+1)) as input returns (F(n+1),F(n+2))
nextFibo :: (Integer, Integer) -> (Integer, Integer)
nextFibo (x,y) = (y, x+y)

--findFibo uses nextFibo in a recursive fashion to compute (Fn,F(n+1)) given n
findFibo :: Integer -> (Integer,Integer)
findFibo 1 = (1,1)
findFibo n = nextFibo (findFibo(n-1))

--nthFibo uses findFibo and outputs the nth Fibonacci number
nthFibo :: (Integer) -> (Integer)
nthFibo n = fst(findFibo n)

--Tests
input = [1,2,3,10,15,200]
output = [nthFibo x| x <- input]
