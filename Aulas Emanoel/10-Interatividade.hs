import System.IO
    ( stdout, stdin, hSetBuffering, hSetEcho, BufferMode(NoBuffering) )


-- quando digitar a palavra senha vai tendo um feedback do que tá sendo digitado
-- fazer letra a letra a na forca 
-- contabilizando os erros
-- exibição do status do jogador
-- '\del' para lidar com o backspace

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = do putChar x
                    putStr xs

putStrLn' :: String -> IO ()
putStrLn' xs = do putStr xs
                  putStr "\n"

obterLinhaSecreta :: IO String
obterLinhaSecreta = do x <- obterChar
                       if x == '\n' then
                            do putChar x
                               return []
                       else do putChar '-'
                               xs <- obterLinhaSecreta
                               return (x:xs)
 
obterChar :: IO Char
obterChar = do hSetEcho stdin False
               x <- getChar
               hSetEcho stdin True
               return x

jogar :: String -> IO ()
jogar palavra = do putStr "? "
                   tentativa <- getLine

                   if tentativa == palavra then
                      putStrLn "Muito bem!"
                   else do putStrLn (encontrar palavra tentativa)
                           jogar palavra

encontrar :: String -> String -> String
encontrar xs ys = [if x `elem` ys then x else '-' | x <- xs]

main :: IO ()
main = do hSetBuffering stdout NoBuffering
          putStr "Escreva uma palavra: "
          palavra <- obterLinhaSecreta
          putStrLn "Tente advinhar: "
          jogar palavra
