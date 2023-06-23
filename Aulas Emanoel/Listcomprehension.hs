
-- Respondendo questões de 1-10 (tirando a questão 7) da lista
-- https://wiki.haskell.org/99_questions/1_to_10

-- Questão 1
myLast :: [a] -> a
myLast l = head (reverse l)

-- Questão 2
-- Find the last but one (second-last)

myLastSecond :: [a] -> a
myLastSecond l = head (tail (reverse l))

-- Questão 3
-- Find the k'th elemnent of a list

elementAt :: (Num a1, Enum a1, Eq a1) => [a2] -> a1 -> [a2]
elementAt l k = [x |  (x, e) <- zip l [0..k], e == k]

-- Questão 4
-- Find the number of elements in a list
numberOfElements :: [a] -> Integer
numberOfElements = sum . map (\_ -> 1)

-- Questão 5
-- Reverse a list


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
