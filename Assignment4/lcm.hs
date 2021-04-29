-- Given a pair of numbers, compute the greatest common divisor of the numbers.
greatestCommonDivisor :: Int -> Int -> Int
greatestCommonDivisor a 1 = 1
greatestCommonDivisor a b
    | a `mod` b == 0  = b
    | otherwise = greatestCommonDivisor b (a `mod` b)

-- Given a pair of numbers compute their least common multiple. 
-- Uses the following fact: lcm(a,b) * gcd(a,b) = a*b
leastCommonMultiple :: Int -> Int -> Int
leastCommonMultiple a b = (a*b) `div` (greatestCommonDivisor a b)

-- The function computes the LCM of all the numbers given in the list.
lcmList :: [Int] -> Int
lcmList [] = 0
lcmList [a] = a
lcmList (x:y:xs) = lcmList( (leastCommonMultiple x y) : xs) 

input :: [Int]
input = [24,100,23]

main  =
     do
         let lcm = lcmList input
         putStrLn("The least common multiple of the list is: ")
         print lcm
