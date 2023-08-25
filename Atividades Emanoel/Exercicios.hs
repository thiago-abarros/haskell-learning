-- Exercício 1
{-
    Classes em haskell são usadas para definir tipos novos para funções, os quais podem receber uma coleção de tipos que muda de acordo com o
    comportamento, podendo estes serem chamados de métodos, um exemplo de classe é a Ord, que contém várias instâncias da classe Eq para saber
    se algo está ordenado ou não de acordo com essas instâncias.
-}

{-   Emanoel def: 
    Classes definem um conjunto de funções que podem ser aplicadas a todos os membros daquela classe.   
    Para definir-se um tipo como membro de uma classe, criamos uma instância do tipo para a classe alvo. 
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
splitString initial final list = drop initial (take (final) list)

-- Exercicio 4
splitAt' :: Eq a => [a] -> a -> [[a]]
splitAt' [] _ = []
splitAt' ys separator = f : splitAt' (dropSeparator separator rest) separator
    where (f, rest) = break (== separator) ys

dropSeparator :: Eq a => a -> [a] -> [a]
dropSeparator _ [] = []
dropSeparator separator (x:xs) = if x == separator then xs else x:xs