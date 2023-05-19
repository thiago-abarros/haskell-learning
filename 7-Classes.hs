import Data.List 
import System.IO 

-- Tipos customizaveis 
-- voce pode armazenar varios valores como se fosse 
-- um struct para criar um tipo customizado
data Customer = Customer String String Double 
    deriving Show 

-- Definindo um Customer e seus valores:
tomSmith :: Customer 
tomSmith = Customer "Tom Smith" "123 Main St" 20.50

-- Definindo como encontraremos o Customer certo e retornando o valor dele
getBalance :: Customer -> Double 
getBalance (Customer _ _ b) = b 

tomSmithBal = print (getBalance tomSmith) 

-- tambem podemos definir um tipo com todos os valores possiveis das variaveis
data RockPaperScissors = Rock | Paper | Scissors 
shoot :: RockPaperScissors -> RockPaperScissors -> String 
shoot Paper Rock = "Papel vence da pedra"
shoot Rock Scissors = "Pedra esmaga Tesoura"
shoot Scissors Paper = "Tesoura corta papel"
shoot Scissors Rock = "Tesoura perde para a pedra"
shoot Paper Scissors = "Papel perde para a Tesoura"
shoot Rock Paper = "Pedra perde para o Papel"
shoot _ _ = "Error"

-- Tambem podemos definir 2 versoes de um mesmo tipo 
-- Primeiro 2 floats como coordenadas centrais e 1 float como o raio do Circulo
-- Os primeiros 2 floats sao para o canto superior esquerdo e
-- Os ultimos 2 Floats  para o canto inferior direito de um retangulo. 

data Shape = Circle Float Float Float 
            | Rectangle Float Float Float Float 
            deriving (Show)

-- Criando uma funcao para calcular a area das formas
area :: Shape -> Float 
area (Circle _ _ r) = pi * r^2
area (Rectangle x y x2 y2) = abs (x2-x) * abs (y2-y)

-- Tambem poderia ser (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs $ y2 - y)
-- $ significa que tudo que vinher apos ele ira ter precedencia em cima de qualquer 
-- outra coisa que vem antes (uma alternativa para adicionar parenteses)

-- pegando a area das formas
areaOfCircle :: Float = area (Circle 50 60 20)
areaOfRetangle :: Float = area (Rectangle 10 10 100 100)

-- Classes de tipagem
-- Num, Eq, Ord e Show são classes de tipagem
-- Classes de tipagem correspondem ao conjunto de tipos
-- os quais possuem certas operações definidas por eles

-- Funções polimórficas, que funcionam com múltiplos
-- tipos de parâmetros, definem os tipos que funcionam
-- através do uso de classes de tipagem.

{- 
Por exemplo (+) funciona através do uso de classes
de tipagem, com parâmetros do tipo Num. 

:t (+) = Num a => a -> a -> a
Isso fala que para qualquer tipo de a, des de que a
seja uma instância de Num, o sinal de + pega 2 valores
e retorna um outro tipo de Num.  
-}

-- Vamos criar uma classe chamada funcionário e 
-- adicionar a habilidade de checar se são iguais. 

data Employee = Employee { name :: String, 
                           position :: String, 
                           idNum :: Int
} deriving (Eq, Show)
-- Colocamos Eq para operações de igualdade funcionarem
-- e o Show para conseguirmos mostrar os dados que 
-- estão contidos
samSmith :: Employee = 
    Employee {name = "Sam Smith", position = "Manager", idNum = 1000}

pamMarx :: Employee = 
    Employee {name = "Pam Marx", position = "Sales", idNum = 1001}

isSamPam :: Bool = samSmith == pamMarx

-- Podemos printar para mostrar o valor do show
samSmithData :: String = show samSmith

-- Fazendo uma tipagem de instância da classe Eq e Show
data ShirtSize = S | M | L 

instance Eq ShirtSize where
    S == S = True
    M == M = True
    L == L = True
    _ == _ = False  

instance Show ShirtSize where 
    show S = "Pequeno"
    show M = "Medio"
    show L = "Grande"

-- Checando se S é um elemento da lista 
smallAvail = S `elem` [S, M, L]

-- Pegando o valor String para o ShirtSize
theSize = show S 

-- Definindo uma classe de tipo customizada para checar igualdade
-- "a" representa qualquer tipo que implementa a função areEqual

class MyEq a where 
    areEqual :: a -> a -> Bool 

-- Permitindo booleanos para checar igualdade usando areEqual
instance MyEq ShirtSize where
    areEqual S S = True 
    areEqual M M = True 
    areEqual L L = True 
    areEqual _ _ = False 

newSize :: Bool = areEqual M M