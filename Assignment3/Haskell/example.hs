import Data.List
import System.IO 

even2 = takeWhile (<=30) [2,4,1,0]
ele = 2 : even2

randTuple = (1,"Random tuple")

bobs = fst randTuple

names = ["milind", "prabhu"]
second = ["1","2"]

combine = zip names second 

main = do
    putStrLn "Whats your name?"
    name <- getLine
    putStrLn("hello" ++ name)

--addMe :: Int -> Int -> Int


--funcName param1 param2 = operations (return value)
--funcName should not start with upper case letter.
addMe :: (Int,Int) -> (Int,Int) -> (Int,Int)
addMe (x,y) (a,b) = (x+a, y+b)


--factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial(n-1)
  
--factorial

isOdd n 
    | n `mod` 2 ==0 = False
    | otherwise = True

whatGrade age
    | (age >= 5) && (age <= 6) = "Kindergarten"
    | (age >= 10) = "School"
    | (otherwise) = "illiterate"

batAvg :: Double -> Double -> String

batAvg hits atBats 
    | avg <= 0.200 ="Terrible"
    | avg <= 0.23 = "Good"
    |avg <= 0.9 = "Superstart"
    |otherwise = "average"
    where avg = hits/atBats

com = [1,2]++[3,4]

times4 x = x*4
listT = map times4 com