module Anotacoes where 

somar :: Int -> Int -> Int 
somar a b = a + b 

-- Somando uma sequência de 1 até N
soma :: Int -> Int 
soma n = sum [1..n]

-- Também podemos fazer de modo recursivo essa soma, da seguinte forma:
soma' :: [Int] -> Int
soma' [] = 0 
soma' (x:xs) = x + soma' xs

-- Fibonnaci exemplo, usando recursão: 
fib :: [Int] = 0 : 1 : zipWith (+) fib (tail fib)

-- Computerphile canal supimpa
    -- What is monad?

 
produtoLista :: (Num a, Enum a) => a -> a
produtoLista n = product [1..n]

-- Função produto recebendo listas
-- Esse exemplo mostra o poder da recursão do Haskell
produtoLista' :: Num a => [a] -> a

-- Sempre colocamos as exceções para tratar os possíveis erros na chamada da função
produtoLista' [] = 0
produtoLista' [x] = x
produtoLista' l = head l * produtoLista' (tail l)

-- Temos como operar utilizando o infixo para qualquer função que recebe 2 parâmetros
{-
exemplo: 1 `somar` 2
-}

-- Quick sort em Haskell 
-- Fazendo por divisão de arvores:
{- Algumas observações: 
O operador ++ recebe duas listas e retorna a concatenação das duas em uma terceira lista.
Já a palavra Where introduz definições locais das coisas que foram usadas no código, que neste caso temos duas:
    menores -> que vai conter os valores menores que o pivô x
    maiores -> que vai conter os valores maiores que o pivô x
-}

quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort menores ++ [x] ++ quickSort maiores 
    where
        menores = [a | a <- xs, a < x]
        maiores = [b | b <- xs, b > x]

quickSortInverso :: Ord a => [a] -> [a]
quickSortInverso [] = []
quickSortInverso (x:xs) = quickSortInverso maiores ++ [x] ++ quickSortInverso menores
    where
        menores = [a | a <- xs, a < x]
        maiores = [b | b <- xs, b > x]

quickSortIgual :: Ord a => [a] -> [a]
quickSortIgual [] = []
quickSortIgual (x:xs) = quickSortIgual menoresIguais ++ [x] ++ quickSortIgual maiores
    where
        menoresIguais = [a | a <- xs, a <= x]
        maiores = [a | a <- xs, a > x]
    