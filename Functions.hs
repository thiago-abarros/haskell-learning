-- Funções Haskell
-- Construção de funções:
-- funcName param1 param2 = operations (returned value)

addMe :: Int -> Int -> Int
addMe x y = x + y 

-- Podemos também fazer sem a declaração de tipo
sumMe x y = x + y 

-- Alguns outros exemplos
addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)

-- Similar a um if, temos:
whatAge :: Int -> String 

whatAge 16 = "Você pode dirigir"
whatAge 18 = "Você pode votar"
whatAge 21 = "Você é um adulto"
whatAge _ = "Nada de importante"

-- Recursões

-- Factorial por recursão
factorial :: Int -> Int 

factorial 0 = 1
factorial n = n * factorial (n-1)

-- Fatorial usando a função product
factProd :: Int -> Int
factProd n = product [1..n]

-- Podemos usar "guards" que promovem ações diferentes baseando-se nas condições dadas
eImpar :: Int -> Bool 
eImpar n
    | even n = False   -- aqui, poderiamos usar n `mod` 2 == 0
    | otherwise = True 

-- Podemos fazer assim também: 
ePar :: Int -> Bool
ePar = even 

-- Outro exemplo usando "guards"
whatGrade :: Int -> String 
whatGrade age
    | (age >= 5) && (age <= 6) = "Jardim de Infancia"
    | (age > 6) && (age <= 10) = "Fundamental 1"
    | (age > 10) && (age <= 14) = "Fundamental 2"
    | (age > 15) && (age <= 18) = "Ensino Médio"
    | otherwise = "Vai para a faculdade grr"
