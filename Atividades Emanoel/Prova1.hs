-- Exercício 1
{-
    Classes em haskell são usadas para definir tipos novos para funções, os quais podem receber uma coleção de tipos que muda de acordo com o
    comportamento, podendo estes serem chamados de métodos, um exemplo de classe é a Ord, que contém várias instâncias da classe Eq para saber
    se algo está ordenado ou não de acordo com essas instâncias. 
-}

-- Exercício 2 
multiplyBy2 :: Num a => a -> a
multiplyBy2 x = x * 2

-- Por ListComprehension
applyFunction :: (t -> a) -> [t] -> [a]
applyFunction func xs = [func x | x <- xs]

-- Forma Recursiva
applyFunction' :: (t -> a) -> [t] -> [a]
applyFunction' _ [] = []
applyFunction' func (x:xs) = func x : applyFunction' func xs

-- Exercicio 3
splitString :: Int -> Int -> [a] -> [a]
splitString initial final list = drop initial (take (final+1) list)

-- Exercicio 4
-- Implementação Emanoel
meuSplit :: Eq a => [a] -> a -> [[a]]
meuSplit s c = aux s c [] []

aux :: Eq a => [a] -> a -> [a] -> [[a]] -> [[a]]
aux [] _ parcial res = res ++ [parcial] 
aux (s:ss) c parcial res
        | s /= c = aux ss c (parcial ++ [s]) res 
        | otherwise = aux ss c [] (res ++ [parcial])