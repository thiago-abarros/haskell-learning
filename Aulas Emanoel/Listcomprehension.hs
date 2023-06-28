
-- Respondendo questões de 1-10 (tirando a questão 7) da lista
-- https://wiki.haskell.org/99_questions/1_to_10

-- Questão 1
{-# LANGUAGE ParallelListComp #-}
myLast :: [a] -> a
myLast = head . reverse 

-- Questão 2
-- Find the last but one (second-last)

myLastSecond :: [a] -> a
myLastSecond l = head (tail (reverse l))

-- Segunda Solução
myLastSecond' :: [a] -> a
myLastSecond' = last . init

-- Questão 3
-- Find the k'th elemnent of a list

elementAt :: (Num a1, Enum a1, Eq a1) => [a2] -> a1 -> [a2]
elementAt l k = [x |  (x, e) <- zip l [0..k], e == k]

-- Questão 4
-- Find the number of elements in a list
numberOfElements :: [a] -> Integer
numberOfElements = sum . map (const 1)

-- Questão 5
-- Reverse a list
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- Segunda Solução
reverseList' :: [a] -> [a]
reverseList' = foldl (flip (:)) []

-- Questão 6
-- Find wheter or not a list is a palindrome
palindromeCheck :: Eq a => [a] -> Bool
palindromeCheck l = and [x == y | (x,y) <- zip l (reverse l)]

-- Questão 7

-- Questão 8
-- Eliminate consecutive duplicates of list elements

compress :: Eq a => [a] -> [a]
compress l = [x | (x,y) <- zip l (tail l), x /= y] ++ [last l]

-- Questão 9
-- Pack consecutive duplicates of a list of elements into sublists

packList :: Eq a => [a] -> [[a]]
packList (x:xs) = let (primeiro, resto) = span (==x) xs 
    in (x:primeiro) : packList resto
packList [] = []

-- Questão 10
-- Use the result of Problem 9 to implement the so-called run-length encoding data compression method. 
-- Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

encodeList :: Eq b => [b] -> [(Integer, b)]
encodeList l = [(x,y) | (x, y) <- zip (map numberOfElements $ packList l) (compress l)]

-- Questão 11
-- Modify the result of problem 10 in such a way that if an element has no duplicates it is simply 
-- copied into the result list. Only elements with duplicates are transferred as (N E) lists.

{- Exemplo:
* input (encode-modified '(a a a a b c c a a d e e e e))
* output ((4 A) B (2 C) (2 A) D (4 E))
-}


data ListItem a = Single a | Multiple Integer a  

encodeModified :: Eq a => [a] -> [ListItem a]
encodeModified = map variableDefiner . encodeList
    where 
        variableDefiner (1, x) = Single x 
        variableDefiner (n, x) = Multiple n x 

-- Questão 16
dropEvery :: [a] -> Int -> [a]
dropEvery list num = take (num - 1) list ++ dropEvery (drop num list) num      

-- Questão 17 
-- Split a list into two parts; the length of the first part is given.

-- Solução 1
split :: [a] -> Int -> ([a], [a])
split list n = (take n list, drop n list)

-- Solução 2
split' :: [a] -> Int -> ([a], [a])
split' list n = splitAt n list

-- Questão 18 
-- Given two indices, i and k, the slice is the list containing the elements
-- between the i'th and k'th element of the original list (both limits included). Start counting the elements with 1.
slice :: [a] -> Int -> Int -> [a]
slice xs i j = drop i (take (j+1) xs) 