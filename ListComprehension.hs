-- Mais algumas operações com listas para solidificar o conhecimento até agora

pow3List :: [Int] = [3^n | n <- [1..10]]
multTable :: [[Int]] = [[x * y | y <- [1..10]] | x <- [1..10]]