import Data.List
-- Listas
numList :: [Integer] = [1, 2, 3, 4]

-- Podemos formar sequências matemáticas facilmente em haskell:
rangeList :: [Integer] = [1..5]
alphaList :: [Char] = ['a'..'z']
evenNums :: [Integer] = [2,4..20]
oddNums :: [Integer] = [1,3..20]
oddAlpha :: [Char] = ['a', 'c'..'z']

-- Podemos também fazer operações com listas
sumNumList :: Int = sum [1..5]
sumNumList' :: Integer = sum numList
prodNumList :: Integer = product numList

-- Para checar se um elemento existe dentro de uma lista
elemList :: Bool = 5 `elem` numList
elemList' :: Bool = elem 5 numList -- Podemos também escrever assim, mas perceba que o check de sintaxe já está reclamando, pois o padrão é o infixo

-- Também podemos juntar listas:
fibNumbers :: [Int] = [0, 1, 1, 2, 3, 5, 8]
moreFibs :: [Int] = [13, 21, 34, 55, 89, 144]
combineFibs :: [Int] = fibNumbers ++ moreFibs

-- Pegando o menor e o maior número da lista
maxFib :: Int = maximum combineFibs
minFib :: Int = minimum combineFibs

-- Fazendo listas de duas dimensões
twoLists :: [[Int]] = [fibNumbers, moreFibs]

-- Operações com listas com o mesmo número de elementos
myNum :: [Int] = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]
zipFibs :: [Int] = zipWith (+) fibNumbers moreFibs -- aqui podemos ver que há a perca de um dos elementos
zipFibs' :: [Int] = zipWith (+) moreFibs fibNumbers -- mesmo alterando a ordem

-- Podemos também fazer listas com tamanho infinito
-- Obviamente o Haskell não irá avaliar todos os números, a não ser que precise
infiniteOdds :: [Int] = [1,3..] -- ps: não tente rodar no ghci se não vai ficar infinitamente... 
takeOdds :: [Int] = take 20 infiniteOdds -- Pegando os 20 primeiros números da lista infOdds
infiniteFives :: [Int] = repeat 5 -- Repetindo o número 5 infinitas vezes
takeFive :: [Int] = take 15 infiniteFives

-- Similarmente, podemos usar o replicate para fazer o mesmo comportamento do takeFive
replicateFive :: [Int] = 20 `replicate` 5
-- Podemos também repetir uma sequência de números infinitamente com o comando cycle
cycleFibs :: [Int] = cycle combineFibs 
-- As funções também podem ser combinadas, por exemplo:
takeCycle :: [Int] = take 25 (cycle [0..9]) -- Aqui estamos pegando os primeiros 20 números de uma sequência de 0 a 9 que se repete infinitamente
takeCycle' :: [Int] = take 25 $ cycle [0..9] -- Mesma coisa que o código acima porém com a sintaxe do haskell para sequências

-- Similarmente ao take, podemos usar o drop para tirar elementos de uma lista e criar outra
dropFibs :: [Int] = drop 5 combineFibs
filterFibs :: [Int] = filter (>5) combineFibs -- pega todos os números maiores que 5 e coloca na lista
whileFibs :: [Int] = takeWhile (<=88) combineFibs -- pega todos os números que são menores ou iguais a 88 da lista
mapList :: [Int] = map (*2) [1, 3..10] -- Uma das funções mais utilizadas no haskell, basicamente pega todos os elementos de uma lista e faz alguma operação

-- Como ordernar listas
unordenedList :: [Int] = [524, 2, 34, 5, 60, 8, 10, 1, 34]
sortList :: [Int] = sort unordenedList

-- Alguns comandos para se usar no GHCI e com Listas
{-
    head -> Pega o primeiro número de uma lista
    last -> Pega o último valor da lista
    tail -> Pega todos os membros da lista menos o primeiro valor
    init -> Pega todos os membros da lista menos o último valor
    
    !! -> Seleciona o n-ésimo elemento de uma lista
    take -> pega um número específico de elementos de uma lista
    drop -> retorna os valores depois de remover os valores especificados
    `elem` -> checa se um elemento está contido na lista
    maximum -> pega o maior valor da lista
    minimun -> pega o menor valor da lista
    sum -> soma os valores da lista
    product -> múltiplica todos os valores de uma lista
-}

-- Alguns Comandos úteis para operações com Listas:
{-
    lenght -> pega o número de elementos de uma lista
    reverse -> pega o reverso da lista
    !! num -> pega um elemento da lista pelo seu index ex: segundoPrimo = listaPrimos !! 1
    null -> checa se a lista está vazia ou não e retorna um booleano 
-}

-- Vejamos algumas funções interessantes:
multiList :: Int = product [2..5]

-- Ou, podemos fazer funções matemáticas com o foldr, vejamos um exemplo:
-- 2 * (3 * (4 * (5 * 2)))
multiList' :: Int = foldr (*) 3[2..5] -- Basicamente a mesma coisa do multiList, porém, com tudo múltiplicado por 3

-- o foldr faz as operações na sequência que foi implementada, já o foldl faz ao contrário, vejamos o exemplo:
-- (((((1) - 5) - 4) - 3) - 2)
minusList :: Int = foldl (-) 1[2..5]
sumFold :: Int = foldl (+) 0[1..100] -- Cuidado com algumas funções que podem ser feitas de maneiras mais simples, essa função está somando todos os números de 1 a 100
sumFold' :: Int = sum [1..100] -- Mesma coisa que o de cima

-- Operações com listas
constList :: [Int] = 1 : 2 : [5, 6, 7, 8] -- Basicamente isso coloca o elemento sempre no começo de uma lista qualquer

-- Criando uma função que cria a sequência de fibonnaci
infiniteFibs :: [Int] = 0 : 1 : zipWith (+) infiniteFibs (tail infiniteFibs)
-- [0, 1] ([1]) -> [0,1,1,2] ([1,1,2]) -> [0,1,1,2,3,5] ([1,1,2,3,5]) -> ... infinitamente
takeFibs :: [Int] = take 20 infiniteFibs

listFunc :: [Int] = [x * y | x <- [1..3], y <- [1..5]]
-- Podemos também filtrar os resultados de uma função, como por exemplo, pegando todos os números os quais são divisíveis por 3
divisibleBy3 :: [Int] = [x * y | x <- [1..3], y <- [1..5], x * y `mod` 3 == 0]
