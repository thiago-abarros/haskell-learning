-- Tuplas
-- Tuplas podem conter elementos de múltiplos tipos
myTuple :: (String, Int) = ("Giuseppe", 1)
getName :: String = fst myTuple
getID :: Int = snd myTuple 

-- Vamos supor que temos uma lista com os nomes e ids de uma empresa
empNames :: [String] = ["John Doe", "Jane Doe", "Mary Jane", "Ben Doe"]
empID :: [Int] = [1,2,3,4]
empList :: [(String, Int)] = zip empNames empID

add a b = a + b
multiply a b = a*b 
func a b c = add (multiply a b) c

-- Vamos aprender agora a executar um programa em Haskell
sayHello :: String = "Olá, Mundo!"

main :: IO () = do
    print sayHello

    putStrLn "Coloque o seu nome: "
    name :: String <- getLine         -- Estamos pegando o input do usuário
    putStrLn ("Olá, " ++ name ++ "!")