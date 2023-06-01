{- Algumas funções do prelude:

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
    
    sum -> Calcula a soma de uma lista de números 
    product -> Calcula o produto de uma lista de números 
    ++ -> Concatena duas listas
    reverse -> inverte uma lista
-}

-- Aplicações de funções
{-
As funções funcionam por padrão com notação prefixa, quando o nome da função
vem antes dos parâmetros, todos eles separados por espaços. 

As funções devem iniciar com letra minúscula, seguida ou não por uma combinação de letras
(maiúsculas ou minúsculas), dígitos, e underscores. 
O nome de uma função também pode terminar com aspas simples. 

IMPORTANTE: A aplicação de funções tem maior precedência, ou seja, vem antes
de qualquer operador

Lista de palavras reservadas que não podem ser usadas como nomes de funções:
    case, class, data, default, deriving, do, else, if, import, in, infix, infixl, infixr,
    instance, let, module, newtype, of, then, type, where.  
-}

-- Exemplo:
menor x y = if x <= y then x else y   
-- Vemos aqui a precedência de funções, dando como resultado 7 porque a função tem maior prioridade. 
num' :: Integer 
num' = menor 5 1 + 6 

-- Regras de Layout
{-
Cada definição no mesmo nível deve iniciar exatamente na mesma coluna, assim definições 
relacionadas a um bloco são mais facilmente identificadas
-}

-- Exemplo
a :: Int = b + c 
    where
        b = 1 
        c = 2 
d :: Int = a * 2

-- Exercícios: 
{-
1. Coloque parênteses nas expressões a seguir de forma que continuem tendo
o mesmo significado: 
    a. 2 ^ 3 * 4
    b. 2 * 3 + 4 * 5
    c. 2 + 3 * 4 ^ 5 
-}
questao1a :: Int = (2 ^ 3) * 4
questao1b :: Int = (2 * 3) + (4 * 5)
questao1c :: Int = 2 + (3 * (4 ^ 5))

{-
2. O código a seguir possui um erro sintático. Faça a correção: 

n = a `div` lenght xs
    where
        a = 10
        xs = [1, 2, 3, 4, 5]
-}

questao2 :: Int = a `div` length xs
    where
        a = 10
        xs = [1, 2, 3, 4, 5]

-- Questão 3
ultimo :: [a] -> a  
ultimo [] = error "Faz isso não mano :("
ultimo l = l !! (length l - 1)

-- Questão 4
questao4 :: [a] -> [a]
questao [] = error "Não é possível fazer com listas vazias"
questao4 l = reverse (tail (reverse l)) 

questao4b :: [a] -> [a]
questao4b [] = error "Não é possível fazer com listas vazias"
questao4b l = take (length l - 1) l 

