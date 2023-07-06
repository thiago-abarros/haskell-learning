-- Exercício 1
fatorial :: Int -> Int
fatorial n
    | n < 0 = 0
    | n == 0 = 1
    | otherwise  = n * fatorial (n - 1)

-- Exercício 2
somar :: Int -> Int
somar n
    | n < 0 = error "Coloque um número que seja maior ou igual a 0"
    | n == 0 = 0
    | otherwise = n + somar (n - 1)

-- Exercício 3
exponenciacao :: Int -> Int -> Int
exponenciacao m n = if n == 1 then m else m * exponenciacao m (n-1)

-- Exercício 4
euclides :: (Num t, Ord t) => t -> t -> t
euclides m n = if n == m then m else euclides (max m n - min m n) (min n m)

euclides' :: (Ord a, Num a) => a -> a -> a
euclides' m n 
    | m == n = m
    | otherwise = euclides' (maximo - minimo) minimo
        where
            maximo = max m n
            minimo = min m n

-- Exercício 5
-- A) decidir se todos os valores de uma lista são True
verifyBooleanList :: [Bool] -> Bool
verifyBooleanList [] = True
verifyBooleanList (x:xs) = not (x == False) && verifyBooleanList xs

-- B) [[a]] -> [a]
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs

-- C) Produzir uma lista com n elementos idênticos
replicate' :: Int -> Int -> [Int]
replicate' _ 0 = []
replicate' x n = x : replicate' x (n-1)

-- D) Selecionar o n-ésimo elemento em uma lista
nElement [] _ = error "Lista Vazia"

-- E) Decidir se um valor está presenta na lista
isInList :: Eq t => [t] -> t -> Bool
isInList [] _ = False
isInList (x:xs) e = (x == e) || isInList xs e

-- Exercício 6

-- Exercício 7

-- Exercício 8