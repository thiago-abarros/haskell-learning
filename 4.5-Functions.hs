import Data.List 
import System.IO 
-- Funções de ordem maior
-- Passando funções como se fossem variáveis

vezes4 :: Int -> Int 
vezes4 x = x * 4

listVezes4 :: [Int] = map vezes4 [1,2,3,4]

-- Basicamente a mesma coisa que a função de cima só que para qualquer número
multBy4 :: [Int] -> [Int]
multBy4 [] = []
-- Também podemos fazer como: multBy4 (x:xs) = vezes4 x : multBy4 xs
multBy4 xs = map vezes4 xs

-- Checando se Strings são iguais usando recursão
areStringsEqual :: [Char] -> [Char] -> Bool 

areStringsEqual [] [] = True
-- A função irá ficar repartindo a String e checando até que a String fique vazia
areStringsEqual (x:xs) (y:ys) = x == y && areStringsEqual xs ys
areStringsEqual _ _ = False 

-- Passando funções em funções

-- Aqui é a função que será passada dentro da outra
times4 :: Int -> Int 
times4 x = x * 4
-- Aqui basicamente estamos passando uma função que será passada dentro da mesma
doMult :: (Int -> Int) -> Int 

doMult func = func 3

-- E aqui, chamamos a doMult com times4 de parâmetro
-- Isso múltiplicará um número por 4 e depois por 3, que dará 12 como resultado
num3Times4 :: Int = doMult times4 

-- Basicamente, com o doMult func = func 3, passamos o 3 como parâmetro na função times4, ou seja, ele agora é o x
-- ficando portanto como 3 * 4 = 12

-- Mais um exemplo desse tipo de manipulação:
-- Como retornar uma função de uma função
getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y 

-- Perceba que isso daqui ainda é uma função, definida como x + 3
adds3 :: Int -> Int = getAddFunc 3

-- E aqui, usamos a função adds3, que é x + 3, passando 4 como o x, ficando 4 + 3 = 7
fourPlus3 :: Int = adds3 4 

-- E podemos usar o map para usar a função adds3 com uma lista de elementos
threePlusList :: [Int] = map adds3 [1,2,3,4,5]
