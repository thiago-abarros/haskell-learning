-- Questão 1
funcionarios :: Foldable t => [(a1, t a2)] -> [a1]
funcionarios xs = [x |(x,y) <- xs, length y >= 2]

-- Questão 2
prefixes :: [a] -> [[a]]
prefixes = foldr (\x acc -> [x] : (map ((:) x) acc)) []

-- Questão 3
isPrime :: Integral a => a -> Bool
isPrime x = length [y | y <- [1..x], x `mod` y == 0] == 2

-- Implementação Emanoel
isPrime' :: Integral a => a -> Bool
isPrime' x = not $ or [x `mod` y == 0 | y <- [2..x-1]]

primos :: Integral a => a -> a -> [a]
primos p q
    | p > q = []
    | p == q = [p | isPrime p]
    | otherwise = [y | y <- [p..q], isPrime y]

-- Questão 4
-- A) Expressão Condicional
tail' :: Eq a => [a] -> [a]
tail' xs = if xs == [] then [] else tail xs

-- B) Guardas
tail'' :: Eq a => [a] -> [a]
tail'' xs
    | xs == [] = []
    | otherwise = tail xs

-- C) Casamento de padrão
-- Num fiz :(
    
-- Questão 5
novoMap :: [b -> b] -> [b] -> [b]
novoMap fs xs = foldl (flip map) xs fs

{- 
    O compilador corrigiu para essa forma mais complicada mas eu fiz desse jeito aqui:
        novoMap [] xs = xs
        novoMap (f:fs) xs = novoMap fs (map f xs)
-}