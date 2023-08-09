import Data.List
import System.IO 
import GHC.Exts (the)

sayHello = do 
    putStrLn "Qual é o seu nome? "
    -- Pegando o input do usuário: 
    name <- getLine 
    putStrLn $ "Olá " ++ name 

-- Caso queiramos escrever em um arquivo:
writeFile :: IO () = do 
    theFile <- openFile "test.txt" WriteMode 
    hPutStrLn theFile "Qualquer linha de texto"
    -- agora fechamos o arquivo
    hClose theFile 

readFile :: IO () = do 
    theFile2 <- openFile "test.txt" ReadMode 
    contents <- hGetContents theFile2 
    putStrLn contents
    hClose theFile2 

-- Fibonnaci
-- Criando uma lista da esquerda para a direita
-- Este exemplo usa recursão
fib :: [Integer] = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]

-- No início temos:
-- 1st : fib = 1 e (tail fib) = 1
-- [1,1,2] : a: 1 + b: 1 = 2, que é retornada a lista
-- 2nd : fib = 1 e (tail fib) = 2; a: 1 + b: 2 = 3, que é retornada a 
-- sequencia [1,1,2,3]