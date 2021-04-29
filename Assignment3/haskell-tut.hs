--Comments
import Data.List
import System.IO

-- Int -2^63 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Double 11 point precision
bigFloat = 3.9999999 + 0.00003


--Bool True False
--Char
--Tuple

--Declare permanent value
always5::Int
always5 = 5

--sum of numbers
sumOfNums = sum[1..1000]

--modulus of a division
modEx = mod 5 4 
modEx2 = 5 `mod` 4

--adding negative numbers, paraentheses are important
negNumEx = 5 + (-4)

--Finding square root
num0 = 2::Int
x = sqrt(fromIntegral num0)

--Builtin math functions, 
ceilingval = ceiling 9.999
floorval = floor 9.999

-- Logical symbols

trueandFalse = True && False
trueorfalse = True || False


--Lists in haskell
--Singly linked: can only add to the front
primeNumbers = [3,5,7,11]
--Concatenate
morePrime = primeNumbers ++ [13,17]

--Another way to combine numbers into lists
favNums = 2:7:21:66:[]

--List of lists

multiList = [[1,2],[3,4,5]]

--adding to the front of the list
morePrimes2 = 2: morePrime

--length of the list
lenPrime = length morePrimes2

--checking if list is empty
isempty = null morePrime

--reversing list
revPrime = reverse morePrime

secondPrime = morePrime !! 1

firstPrime = head morePrimes2

lastPrime = last morePrime

--Retursn all the elements but the last one.
primeInit = init morePrime

--First 3 
first3 = take 3 morePrime

--Remove first 3
removePrime  = drop 3 morePrimes2





