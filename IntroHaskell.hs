-- Comentário em linha única

{- 
Comentários em múltiplas linhas

Para rodar o código, abrimos um terminal e executamos:
    ghci -> para abrir o compilador de haskell
    :l (nome do arquivo.hs) -> para carregar o arquivo que quer codar
    :r   -> para recarregar o código colocado
-}

import Data.List
import System.IO

--Haskell é estaticamente tipado, ou seja, não dá para mudar o tipo da variável após criar-la
-- Inteiros

maxInt = maxBound :: Int
hello = "bom dia"
