import Data.List
import System.IO
import Text.Printf

search :: [Double] -> Double
-- Performs a binary search to find the square root of the number
-- The arguments are four numbers [left, right, num, ctr]
-- The function will search for the square root in the range [left,right] for ctr number of iterations

search (x)
    | length(x) /= 4 = error "Needs four elements in the list"
    | (x !! 3 == 0) = x !! 0
    | (otherwise) = 
        let left = x!!0
            right = x!!1
            mid = (left + right)/2
            num = x !! 2
            ctr = x !! 3 in
            if(mid*mid > num) then search[left,mid,num,ctr-1]
            else search[mid,right,num,ctr-1]
        
squareRoot :: Double -> Double

--This function outputs the square root of the input number x by using the search function
--search[0,x,x,200]: A binary search is performed to search for the square root of x
-- in the range [0,x] for 200 iterations. 200 iterations are enough to give square root with 0.000001 precision 
-- on all numbers that can be stored without loss of precision in Double.
squareRoot x
    | x < 0 = error "Number is negative"
    | (otherwise) = search [0,x,x,200]
--Tests
input = [2, 2.5, 25, 178.34, 1000, 1000.001, 200000, 100000000001]
output = [squareRoot x| x <- input]