import Data.List
import System.IO 

-- Lambdas
-- São como criamos funções sem nome
-- \ representa lambda quando você tem argumentos -> resultado

-- Podemos fazer assim:
doubleTo10 :: [Int] = map (* 2) [1..10]

-- Ou assim, usando lambdas:
doubleTo10' :: [Int] = map (\x -> x * 2) [1..10]

-- Condicionais
-- Operadores de comparação: < > <= >= == /=
-- Operadores lógicos: && || not

-- Todo if precisa de um else em haskell 
doubleEvenNumber :: Integral a => a -> a
doubleEvenNumber y = 
    if (y `mod` 2 /= 0)
        then y
        else y * 2

-- Podemos também usar case statements
getClass :: Int -> String
getClass n = case n of 
    5 -> "Vai para o jardimzinho"
    6 -> "Vai para o fundamental 1"
    _ -> "Vai para algum lugar meo sla"