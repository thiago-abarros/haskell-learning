{-# LANGUAGE ParallelListComp #-}
import Data.Char (isDigit)

-- Questão 1 

-- Questão 2
media3 :: Fractional a => a -> a -> a -> a
media3 a b c = (a + b + c) / 3

maior :: (Ord a1, Num a2) => a1 -> a1 -> a2
maior x y = if x > y then 1 else 0


maioresQueMedia :: (Num a, Ord a1, Fractional a1) => a1 -> a1 -> a1 -> a
maioresQueMedia a b c = maior a m + maior b m + maior c m
    where
        m = media3 a b c

-- Questão 3
potencia_2 :: Floating a => a -> a
potencia_2 a = a ** 2

-- Questão 4
potencia_4 :: Floating a => a -> a
potencia_4 a = p * p
    where
        p = potencia_2 a

-- Questão 5
meuXor :: Eq a => a -> a -> Bool
meuXor a b = if a == b then False else True

meuXor' :: Eq a => a -> a -> Bool
meuXor' a b = a/=b

-- Questão 6
raizDelta :: Floating a => a -> a -> a -> a
raizDelta a b c = sqrt $ b ** 2 - 4 * a * c

xMaior :: Floating a => a -> a -> a -> a
xMaior a b c = ((-b) + raizDelta a b c)/2

xMenor :: Floating a => a -> a -> a -> a
xMenor a b c = ((-b) - raizDelta a b c)/2

-- Questão 7 
intervalo :: (Ord a, Enum a) => a -> a -> [a]
intervalo a b = if a > b then [b..a] else [a..b]

incluindoLimites :: (Num a, Ord a, Enum a) => a -> a -> [[a]]
incluindoLimites a b = [[x + y | x <- limite]| y <- limite]
    where
        limite = intervalo a b

excluindoLimites :: (Ord a, Num a, Enum a) => a -> a -> [[a]]
excluindoLimites a b = [[x + y | x <- limite]| y <- limite]
    where
        limite = init $ tail $ intervalo a b

-- Soma intervalo
somaIncluindo :: (Num a, Ord a, Enum a) => a -> a -> a
somaIncluindo x y = sum $ intervalo x y

somaExcluindo :: (Ord a, Num a, Enum a) => a -> a -> a
somaExcluindo x y = if x > y then sum [y+1..x-1] else sum [x+1..y-1]


-- Questão 8
multiplos :: Integral a => a -> a -> a -> [a]
multiplos x y z = [n | n <- intervalo , n `mod` z == 0]
    where
        intervalo = if x > y then [y..x] else [x..y]

-- Questão 9
multiplicacaoSum :: Num a => Int -> a -> a
multiplicacaoSum x y = sum $ x `replicate` y

-- Questão 10
mod2 :: (Ord t, Num t) => t -> t -> t
mod2 x y = if y < x then y else mod2 x (y-x)

-- Questão 11
seq6 :: (Eq t, Floating a, Num t) => t -> a
seq6 n = if n == 1 then sqrt 6 else sqrt (6 + seq6 (n-1))

-- Questão 12 
factorial :: (Eq t, Num t) => t -> t
factorial n = if n == 0 then 1 else n * factorial (n - 1)

combination :: (Ord a, Fractional a) => a -> a -> a
combination m n = if m < n then 0 else factorial m / ( factorial n *  factorial (m - n) )

-- Questão 13
maiorLista :: (Ord t) => [t] -> (t, Int)
maiorLista [] = error "lista vazia"
maiorLista l = (m, pos m l)
    where m = maximum l


-- Função para identificar onde um número está na lista
pos :: (Eq t, Num a) => t -> [t] -> a
pos e (x:xs)
    | x == e = 0
    | otherwise = 1 + pos e xs

-- Solução 2

-- Questão 14
-- Solução 1
dictNums :: [(Integer, String)]
dictNums = [(0, "zero"), (1, "um"), (2, "dois"), (3, "tres"), (4, "quatro"), (5, "cinco"), (6, "seis"), (7, "sete"), (8, "oito"), (9, "nove")]

listaUnitarios :: [Int] -> [String]
listaUnitarios l = [snd $ dictNums !! n | n <- l]

-- Consultando igualdade das chaves:
-- Solução 2 
converter :: [Integer] -> [String]
converter [] = []
-- converter (x:xs) = consultar x dictNums : converter xs -- : é o operador cons
converter xs = map (`consultar` dictNums) xs

consultar :: Eq t => t -> [(t, String)] -> String
consultar _ [] = ""
consultar ch ((k,v):xs) = if k == ch then v else consultar ch xs

consultar2 :: (Eq a, Eq b) => (a, b) -> [(a, b)] -> b
consultar2 ch l = snd $ head [t | t <- l, t == ch]

-- Questão 15 
delPosicao :: [a] -> Int -> [a]
delPosicao l x = take x l ++ drop (x+1) l

-- Questão 16 
inserirPosicao :: [a] -> Int -> a -> [a]
inserirPosicao l y x =  take y l ++ x : drop (y+1) l

-- Questão 17 
posicaoLista :: [a] -> Int -> a
posicaoLista l n = l !! n

-- Implementação do método
posicaoLista' :: (Num t1, Eq t2) => t2 -> [t2] -> t1
posicaoLista' n l = go 0 n l
    where 
        go i n [] = -1
        go i n (x:xs)
            | n == x = i
            | otherwise = go (i+1) n xs

-- Implementação 2 do método
posicaoLista'' :: (Eq t, Num t) => t -> [t] -> t
posicaoLista'' x [] = -1 
posicaoLista'' x (y:ys) 
    | x == 0 = y
    | otherwise = pos (x -1) ys 

pos' :: Int -> [a] -> a
pos' x ys = head (drop x ys)

-- Questão 18  
merge :: Ord a => [a] -> [a] -> [a]
merge xs ls = quickSort (xs ++ ls)

quickSort :: Ord a => [a] -> [a]
quickSort (x:xs) = menores ++ [x] ++ maiores
    where
        menores = [y | y <- xs, y <= x]
        maiores = [y | y <- xs, y > x]

-- Merge é uma estrutura de dados para juntar os dados de duas listas e ordena-las em uma só lista
merge' :: Ord a => [a] -> [a] -> [a]
merge' xs [] = xs
merge' [] ys = ys
merge' (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys
 
-- Questão 19

intersectionLists :: Eq a => [a] -> [a] -> [a]
intersectionLists [] = const []
intersectionLists xs = filter (`elem` xs)

intersectionLists' :: (Foldable t, Eq a) => [a] -> t a -> [a]
intersectionLists' xs ys = [x | x <- xs, x `elem` ys]

-- Questão 20
comprime :: [Char] -> [Char]
comprime [] = [ ]
comprime (x:xs) = if tamanho > 2 then "!" ++ show (tamanho + 1) ++ [x] ++ comprime (drop tamanho xs) else [x] ++ comprime xs
    where 
        repeticao = takeWhile (==x) xs 
        tamanho = length repeticao

-- Questão 21
descomprima :: [Char] -> [Char]
descomprima [] = []
descomprima ('!':xs) = replicate (read numero::Int) y ++ descomprima ys 
    where
        numero = takeWhile isDigit xs
        (y:ys) = drop (length numero) xs 
descomprima (x:xs) = x : descomprima xs
