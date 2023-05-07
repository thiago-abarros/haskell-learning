-- Comentário em linha única

{- 
Comentários em múltiplas linhas

Para rodar o código, abrimos um terminal e executamos:
    ghci -> para abrir o compilador de haskell
    :l (nome do arquivo.hs) -> para carregar o arquivo que quer codar
    :r   -> para recarregar o código colocado
    :!clear -> para limpar o console do ghci
-}

-- Imports
import Data.List
import System.IO

-- Haskell é estaticamente tipado, ou seja, não dá para mudar o tipo da variável após criar-la
-- Listas em haskell também são tipadas, ou seja, não tem como armazenar mais de um tipo na mesma lista

-- Tipos de dados em Haskell:
-- Bool, Int, Integer, Float, Double, Char, [Char], Tuples ()

-- :: Bool
-- True ou False
trueAndFalse :: Bool = True && False
trueOrFalse :: Bool= True || False
notTrue :: Bool = not(True)

-- :: Int
-- Numéros inteiros [-2^63, 2^63]

-- Caso queiramos ver o número máximo possivel, podemos usar o maxBound:
maxInt :: Int = maxBound 
-- E caso queiramos ver o menor número possível, podemos usar o minBound:
minInt :: Int = minBound

-- O haskell, assim como o python, também pode fazer inferências sobre o tipo daquilo que está sendo declarado, mas, uma boa prática é sempre tipar se possível quando for declarar variáveis
numFive = 5 -- Perceba que já inferiu como um Int
numFive :: Integer -- E aqui estamos tipando a variável 
numFive' :: Float = 5
boolFive = 5 > 4 -- Perceba que mesmo que não seja tipado, o haskell é bem inteligente em descobrir o tipo das variáveis

-- Floats e Doubles
-- Tipicamente usamos Doubles, o haskell também infere normalmente como Double
myFloat :: Float -- Se comentarmos essa linha, o haskell irá inferir como Double
myFloat = 1.0 + 2.5 

myDouble :: Double = 1.55555

-- :: Char 
-- Char são caractéres únicos e denotados com aspas simples 
singleChar :: Char = 'a'
myName :: String = "Thiago B)"
myName' :: [Char] = ['T', 'h', 'i', 'a', 'g', 'o', ' ', 'B', ')'] -- A mesma coisa que o de cima

-- Matemática aeeee
addNum :: Integer = 3 + 6
subNum :: Integer = 3 - 6
multNum :: Integer = 3 * 6
divNum :: Double = 3 / 6 
modNum :: Integer = mod 9 2 -- Isso aqui chamamos de operador de préfixo
modNum' :: Integer = 9 `mod` 2 -- E esse é operador de infixo, que é o mais utilizado

-- Caso queiramos por números negativos nas equações, temos que escrever entre parênteses para o compilador entender
addNeg :: Integer = 4 + (-5)

-- Algumas constantes e operações matemáticas já existentes em Haskell são:
-- pi, exp, log, sin, cos, asin, acos, atan
truncDouble :: Integer = truncate myDouble
roundDouble :: Integer = round myDouble
ceilDouble :: Integer = ceiling myDouble
floorDouble :: Integer = floor myDouble

-- Tirar a raiz de um número pelo método sqrt sempre retornará um float, portanto, cuidado com a tipagem de funções deste tipo
squareFive :: Float = sqrt numFive'

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
infOdds :: [Int] = [1,3..] -- ps: não tente rodar no ghci se não vai ficar infinitamente... 
