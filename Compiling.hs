import System.IO
import Data.List 

-- Algumas operações com Strings e aplicações feitas em haskell

-- Filtro de letras minúsculas:
letrasMinusculas :: [Char] -> [Char]
letrasMinusculas s = [c | c <- s, c `elem` ['a'..'z']]

-- Para executarmos um programa, precisamos seguir os seguintes Passos:
{-
    1 - Sair do GHCI usando :q
    2 - GHC --make nomeDoArquivo para compilar ele
    3 - .\nomeDoArquivo para executar-lo
-}

main :: IO () = do
    let s :: [Char]= letrasMinusculas "O Heisenberg é Careca!"
    putStrLn "Qual é o seu nome? "
    
    nome :: String <- getLine 
    print(s ++ " " ++ nome)