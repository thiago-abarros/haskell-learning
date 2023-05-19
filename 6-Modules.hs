import Data.List
import System.IO 

-- Modulos 
{-
voce pode agrupar funcoes em modulos. 
Voce pode criar o seu proprio modulo, criando um arquivo que contem todas 
as suas funcoes e entao listando elas no topo desse jeito: 

module SampFuncions (getClass, doubleEvenNumbers) where

Ai elas poderao ser importadas com "import SampFunctions"
-}

-- Tipos de Enumeracao 
-- Usados quando voce precisa de uma lista de tipos possiveis 
-- Coloque um nome, uma lista e entao o Show converte em uma String para 
-- printar os elementos
data BaseballPlayer = Pitcher
                     | Catcher 
                     | Infielder
                     | Outfield
                     deriving Show 

barryBonds :: BaseballPlayer -> Bool 
barryBonds Outfield = True 