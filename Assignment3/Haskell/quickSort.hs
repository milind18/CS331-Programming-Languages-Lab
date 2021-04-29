import Data.List
import System.IO

quickSort [] = []

--"result" divides the input list into three lists by pivoting about the 0th element of the list.
-- List 0 contains all elements less than or equal to the pivot, List 1 contains the pivot
-- List 2 contains all elements greater than the pivot
-- quickSort is called recursively on list 1 and list 3 and the results are then concatenated.
quickSort (x) = 
    let result = if(x == []) then [[],[],[]] else [[y | y <- tail x, y <= (x!!0)], [x!!0], [y | y <- x, y > (x!!0)]] in
    quickSort(result !! 0) ++ (result !! 1) ++ quickSort(result !! 2)
-- Tests
input = [[],[2],[1,2,2,2],[1500,200,100,20,10], [100,2,1230123,23,45,2], [5,1,4,2,40000]]
output = [quickSort x| x <- input]
