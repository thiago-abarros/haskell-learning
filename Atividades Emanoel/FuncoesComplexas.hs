-- 1) Implemente uma função que receba uma lista de inteiros 
-- (que pode ou não estar ordenada) e retorne uma lista ordenada
-- em ordem crescente formada apenas pelos números ímpares da lista recebida.

ordList :: Ord a => [a] -> [a]
ordList [] = []
ordList (x:xs) = ordList menores ++ [x] ++ ordList maiores
    where
        menores = [y | y <- xs, y < x]
        maiores = [y | y <- xs, y >= x]

returnOddInOrder :: [Integer] -> [Integer]
returnOddInOrder = ordList . filter odd

-- 2) defina uma função que retorne o elemento na n-ésima posição de uma lista
elemAt' :: Int -> [a] -> a
elemAt' e xs = xs !! max 0 e

-- 3)  Defina uma função que repita as ocorrências até um determinado 
-- valor, no formato de uma lista, tal que (NÃO PODE USAR O replicate):

takeNums' :: Int -> [Int]
takeNums' n = take n [n, n..]

repeat' :: Int -> [[Int]]
repeat' 0 = []
repeat' e = takeNums' e : repeat' (e-1)

-- Saída 2
repeat'' :: Int -> [Int]
repeat'' 0 = []
repeat'' e = takeNums' e ++ repeat'' (e-1)

-- 4) Construa uma função que cheque se o conteúdo de uma lista é um palíndromo:

palindromeCheck :: Eq a => [a] -> Bool
palindromeCheck xs = xs == reverse xs

-- 5) Construa uma função que retorne os n primeiros elementos da sequência de Fibonacci:
infiniteFibs :: [Integer]
infiniteFibs = 0 : 1 : zipWith (+) infiniteFibs (tail infiniteFibs)

fibonacci :: Int -> [Integer]
fibonacci e = take e infiniteFibs

-- 6) Sem olhar as definições no Prelude, defina a seguintes funções de alta ordem:
-- a) Decide se todos os elementos de uma lista satisfazem um predicado:

-- b) Decide se algum elemento de uma lista satisfaz um predicado:

-- c) Selecione elementos de uma lista enquanto eles satisfazem um predicado:

-- d) Remove elementos de uma lista enquanto eles satisfazem um predicado:

-- 7) Redefina as funções map e filter usando foldr 

-- 8) Usando foldl, defina a função dec2int :: [int] -> int que converte uma lista de inteiros em um inteiro
-- Exemplo dec2int [2,3,4,5] deve retornar 2345
concatNumbers :: Num int => int -> int -> int
concatNumbers x y = x * 10 + y

dec2int :: (Foldable t, Num a) => t a -> a
dec2int = foldl concatNumbers 0

{- 
    9) Considere a função unfold que encapsula o padrão recursivo definido abaixo
    unfold p h t x 
        | p x = []
        | otherwise = h x : unfold p h t (t x)
    Isto é, a função unfold produz uma lista vazia se o predicado é verdadeiro para o argumento passado em x, caso contrário, produz uma lista não vazia aplicando h a x, para formar a cabeça, e a função t aplicada a x que é processado recursivamente usando as mesmas regras, produzindo a cauda da lista. Como exemplo, podemos definir uma função int2bin, que converte um número inteiro em uma lista de bits:
    int2bin = unfold (== 0) (`mod` 2) (`div` 2)
    Redefina as funções map f e iterate f da biblioteca padrão usando a função unfold.
-}
unfold' :: (t -> Bool) -> (t -> a) -> (t -> t) -> t -> [a]
unfold' p h t x
    | p x = []
    | otherwise = h x : unfold' p h t (t x)

-- Fazendo a função map
unfoldMap :: Eq b => (b -> a) -> [b] -> [a]
unfoldMap f = unfold' (==[]) (f . head) tail

-- Com lambda
unfoldMap' :: Eq t => (t -> a) -> [t] -> [a]
unfoldMap' f = unfold' (==[]) (\l -> f (head l)) tail

-- Fazendo a função iterate
-- Predicado pode ser uma lambda \x -> False
unfoldIterate :: (a -> a) -> a -> [a]
unfoldIterate f = unfold' (const False) id f

-- 10) Defina a função altMap :: (a -> b) -> (a -> b) -> [a] -> [b] que aplica de forma alternada as duas funções que recebe como argumento a elementos sucessivos em uma lista.
-- Exemplo: altMap (+10) (+100) [0,1,2,3,4] deve retornar [10, 101, 12, 103, 14]

altMap :: (t -> a) -> (t -> a) -> [t] -> [a]
altMap _ _ [] = []
altMap func1 func2 (x:xs) = func1 x : altMap func2 func1 xs

{- 11)
    Sem olhar nas definições do Prelude, 
    defina uma função de alta ordem chamada 
    curry que converte uma função em um par (tupla)
    em uma versão currificada. Defina também uma função 
    chamada uncurry que converte uma função 
    currificada para dois argumentos em uma função
    que recebe um par (tupla).
-}
function' :: (Int, Int) -> Int
function' (x,y) = x + y

curry' :: ((a, b) -> c) -> a -> b -> c
curry' fn p1 p2 = fn (p1, p2)

function2' :: Int -> Int -> Int
function2' x y = x + y

uncurry' :: (a -> b -> c) -> ((a, b) -> c)
uncurry' fn (x,y) = fn x y

uncurry'' :: (t1 -> t2 -> t3) -> (t1, t2) -> t3
uncurry'' fn = \(x,y) -> fn x y 