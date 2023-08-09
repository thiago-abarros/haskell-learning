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
insertionSort :: Ord a => [a] -> [a] -> [a]
insertionSort [] ys = ys
insertionSort xs [] = xs
insertionSort (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge ys (x:xs)

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge l [] = l
merge [] l = l
merge (x:xs) (y:ys) 
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

-- Exercício 7

metades :: [a] -> ([a], [a])
metades [] = error "Lista vazia não é permitida"
metades xs = splitAt (length xs `div` 2) xs

mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort esquerda) (mergeSort direita)
    where (direita, esquerda) = metades xs

-- Exercício 8
-- A) calcular a soma de uma lista de inteiros
somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs

-- B) obtenha o número de elementos de uma lista
numElements' :: Num a1 => [a2] -> a1
numElements' [] = 0
numElements' (x:xs) = 1 + numElements' xs

-- C) Selecione o último elemento de uma lista
lastElem :: Eq a => [a] -> a
lastElem [] = error "Lista vazia passada"
lastElem (x:xs) = if xs == [] then x else lastElem xs