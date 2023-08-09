import Data.List (sort)
-- Criar uma função elem que retorna True se um elemento estiver numa dada lista e retorna false caso contrário
elem' :: Eq t => t -> [t] -> Bool
elem' _ [] = False
elem' e (x:xs) = (e == x) || (elem' e xs)

-- Criar uma função nub que remove todas as duplicatas de uma dada lista
nub' :: (Eq a) => [a] -> [a]
nub' [] = []
nub' (x:xs)
    | x `elem` xs = nub' xs
    | otherwise = x : nub' xs

-- Crie uma função que veja se uma dada lista está em ordem crescente ou não
isAsc :: [Int] -> Bool
isAsc [] = True 
isAsc [x] = True
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)

-- Criar uma função que retorna um intervalo crescente de dois números
asc :: (Ord t, Num t) => t -> t -> [t]
asc n m
    | n > m = []
    | n == m = [m]
    | m > n = n : asc (n+1) m 

-- Criar uma função chamada HasPath que determina se um caminho está disponível de um node pra outro num grafo
hasPath :: [(Int, Int)] -> Int -> Int -> Bool 
hasPath [] x y = x == y
hasPath xs x y
    | x == y = True
    | otherwise = let xs' = [(n, m) | (n, m) <- xs, n /= x] in or [hasPath xs' m y | (n, m) <- xs, n == x]

-- Funções de ordem maior 
-- Uma função de ordem maior é uma função que pega uma função como argumento ou que retorna uma função como resultado

-- aqui podemos ver um exemplo de função de ordem maior chamada app
-- Perceba que na assinatura da função temos esse (a -> b), que representa uma função que pega um elemento "a" e transforma em algo "b".
app :: (a -> b) -> a -> b 
app f x = f x

-- Agora, vamos testar uma função dentro do app para ver se está funcionando
add1 :: Int -> Int 
add1 x = x + 1 
-- colocando app add1 1 no console, podemos ver que ele retorna 2, aplicando a função que lhe foi atribuída. 

-- Funções anonimas
-- São muito úteis no contexto de funções de ordem maior, porque permite que não seja necessário criar funções para aplicar dentro delas
-- podemos fazer essas chamadas anonimamente usando esse conhecimento. 

{- Estrutura de uma função anonima:
    (\<args> -> <expr>)

   Exemplo de função anonima:
    (\x -> x + 1)
-}
-- Agora, podemos fazer a função add1 de um jeito anonimo:
add1' :: Int -> Int
add1' = (\x -> x + 1)

-- Caso seja necessário múltiplos argumentos:
add3' :: Int -> Int -> Int -> Int 
add3' = (\x y z -> x + y + z)

-- Utilização de map com funções anonimas:
addTuplesToList :: Num b => [(b, b)] -> [b]
addTuplesToList = map (\(x,y) -> x + y) 

-- Utilizando filter com funções anonimas:
greaterThan2 :: (Ord a, Num a) => [a] -> [a]
greaterThan2 = filter (\x -> x > 2)

filterTuplesPairs :: Eq a => [(a, a)] -> [(a, a)]
filterTuplesPairs = filter (\(x,y) -> x /= y)

-- Implementação do map

-- Podemos fazer assim:
map' :: (t -> a) -> [t] -> [a]
map' f xs = [f x | x <- xs]

-- Ou utilizando funções de ordem maior de forma recursiva
map'' :: (t -> a) -> [t] -> [a]
map'' f (x:xs) = f x : map' f xs

-- Implementando o Filter:
filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs) 
    | p x = x : filter' p xs
    | otherwise = filter' p xs

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' p xs = [x | x <- xs, p x]

-- Implementação do foldr:
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v 
foldr' f v (x:xs) = f x (foldr' f v xs)

-- Implementação do Any:
any' :: (t -> Bool) -> [t] -> Bool
any' p xs = or [p x | x <- xs] 

-- Implementação do takeWhile
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p [] = []
takeWhile' p (x:xs)
    | p x = x : takeWhile' p xs
    | otherwise = []

-- Implementação do dropWhile
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' p [] = []
dropWhile' p (x:xs)
    | p x = dropWhile p xs
    | otherwise = x:xs 

-- Implementação do Concat
concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat xss

-- Implementação do replicate
replicate' :: (Eq t1, Num t1) => t1 -> t2 -> [t2]
replicate' 0 x = []
replicate' n x = x : replicate' (n-1) x

repete :: (Eq t, Num t) => t -> [[t]]
repete 0 = []
repete x = replicate' x x : repete (x-1)

-- função insert
insert' :: Ord t => t -> [t] -> [t]
insert' x [] = [x]
insert' x (y:ys) = if x <= y then x : y : ys else y : insert' x ys 

-- insertion sort usando o insert
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert' x (isort xs)

-- Currying
{- Quando vemos aplicações de funções parciais, estamos usando um recurso chamado Currying
é um princípio que nos diz o seguinte: se temos uma função, que por exemplo, pega 3 argumentos e retorna um valor, nós podemos
reescrever ela da seguinte forma:
  - forma padrão:
    f :: a -> b -> c -> d 

  - forma currificada:
  Uma função que pega um único argumento e retorna uma função que pega um outro único argumento e retorna uma função que pega um único outro 
  argumento e finalmente nos dá o resultado da expressão. 
   f :: a -> (b -> (c -> d))

   Toda função tem apenas um argumento e então retorna uma outra função ou um resultado final. 
-}

-- Exemplificação: 
multiply :: Num a => a -> a -> a
multiply x y = x * y

multiply' :: Num a => a -> a -> a
multiply' x = (\y -> x * y)

multiply'' :: Num a => a -> a -> a
multiply'' = (\x -> (\y -> x * y))

-- Composição: 
{- Composição é um termo usado em haskell para quando utilizamos o . para aplicar várias funções simultaneamente

(f . g) é equivalente a (\x -> f (g x))

Exemplos: 

- 3 variações da mesma coisa que é organizar uma lista de forma decrescente
descSort = reverse . sort 
descSort = (\x -> reverse (sort x))
descSort x = reverse (sort x)

- map e dimensões de lista:
Podemos fazer map com n dimensões utilizando composição, por exemplo, fazer 3 maps consecutivos por composição, faria um map tri-dimensional

map2D = map . map 
map3D = map . map . map 

-}

-- Folding

{- Foldr e Foldl
  - Implementações de ambos foldr e foldl
        foldr (\elem acc -> <term>) <start_acc> <list>
        foldl (\acc elem -> <term>) <start_acc> <list>
        
-}
-- Implementação do foldr

foldr'' :: (a -> b -> b) -> b -> [a] -> b
foldr'' f v [] = v 
foldr'' f v (x:xs) = f x (foldr' f v xs)

-- Implementação do foldl

foldl'' :: (a -> b -> a) -> a -> [b] -> a
foldl'' f v [] = v 
foldl'' f v (x:xs) = foldl'' f (f v x) xs

-- Função que conta quantos elementos igual a ele estão em uma dada lista
count :: (Foldable t, Eq a, Num b) => a -> t a -> b
count e = foldr (\x acc -> if e==x then acc+1 else acc) 0

-- Função que determina se todos os elementos de uma dada lista são iguas ao elemento dado
isAll :: (Foldable t, Eq a) => a -> t a -> Bool
isAll e = foldr (\x acc -> e==x && acc) True 

-- Implementando a função Lenght e Map com foldr
length' :: (Foldable t, Num b) => t a -> b
length' = foldr (\x -> (+) 1) 0

map''' :: Foldable t => (a -> b) -> t a -> [b]
map''' f = foldr ((:) . f) []

-- Exercicios com folding

-- Criar uma função que reverta uma lista

rev' :: [a] -> [a]
rev' = foldl (\acc x -> x : acc) []

rev'' :: [a] -> [a]
rev'' = foldl (flip (:)) []

rev''' :: [a] -> [a]
rev''' = foldr (\x xs -> xs ++ [x]) []

-- Implementação de palindromo com rev'
palindromo :: Eq a => [a] -> Bool
palindromo = (\x -> x == rev' x)

-- Sem usar fold:
rev'''' :: [a] -> [a]
rev'''' [] = []
rev'''' (x:xs) = reverse xs ++ [x]

-- Criar uma função que retorna todos os prefixos de uma dada lista
{-
prefixes :: [a] -> [[a]]
ex: prefixes [1,2,3] -> [[1], [1,2], [1,2,3]]
-}

prefixes :: [a] -> [[a]]
prefixes = foldr (\x acc -> [x] : (map ((:) x) acc)) []