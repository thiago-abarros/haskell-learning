{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
import Prelude hiding (elem)

-- Exercise 1
-- Create a function elem that returns True if a element is in a given list and returns False otherwise
elem :: (Eq a) => a -> [a] -> Bool   
elem _ [] = False
elem e (x:xs) = (e == x) || (e `elem` xs)

-- Solution 2
elem' :: (Eq a) => a -> [a] -> Bool 
elem' e (x:xs) = if e == x then True else elem' e xs 

-- Exercise 2
-- Create a function nub that removes all duplicates in a given list
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs) 
    | x `elem` xs = nub xs
    | otherwise = x : nub xs 

-- Exercise 3
-- Create a function isAsc that returns True if the list given to it is a list of ascending order
isAsc :: [Int] -> Bool
isAsc [] = True 
isAsc [x] = True 
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)

-- Exercise 4
-- Create a factorial function
fac :: (Ord t, Num t) => t -> t
fac n 
    | n <= 1 = 1
    | otherwise = n * fac (n-1)

-- Solution 2
-- Accumulators
fac n = aux n 1 
    where 
        aux n acc 
            | n <= 1 = acc
            | otherwise = aux (n-1) (n*acc)

-- Exercise 5
-- Generating a ascending list with a given interval
asc :: Int -> Int -> [Int]
asc n m 
    | m < n = []
    | m == n = [m]
    | m > n = n : asc (n+1) m 
