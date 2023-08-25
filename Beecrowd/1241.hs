import Text.Printf

parseToInt :: String -> Integer
parseToInt s = read s :: Integer

stringCheck :: [Char] -> String
stringCheck s
  | reverse (take (length s2) (reverse s1)) == s2 = "encaixa"
  | otherwise = "nao encaixa"
        where (s1,s2) = (takeWhile (/= ' ') s, tail $ dropWhile (/= ' ') s)

quantidadeAplicada 0 _ = []
quantidadeAplicada n f = f (quantidadeAplicada (n - 1) f)

solucao :: IO String
solucao = do getLine
main :: IO ()
main = do
        qtd <- getLine
        
        putStrLn("Teste para não dar erro")
