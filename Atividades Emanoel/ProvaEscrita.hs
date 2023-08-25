-- 1) Dependentes


dependentes' :: Foldable t => t (a1, [a2]) -> [a2]
dependentes' xs = concat $ foldl (\semente elem -> snd (elem) : semente) [] xs 

-- 2) Questão 2
menor :: Ord a => [a] -> a
menor (x:xs) = foldr min x xs

removerMenor :: Ord a => [a] -> [a]
removerMenor (x:xs) = takeWhile (> menor(x:xs)) (x:xs) ++ drop (length (takeWhile (> menor(x:xs)) (x:xs))) (x:xs)

-- 3) 

converter :: Int -> String
converter x
    | x >= 359999 = "23:59:59"
    | x >= 3600 = x `div` 3600 : converter (x `mod` 3600)
    | x >= 60 = x `div` 60 : converter (x `mod` 60)
    | otherwise = formatar x
        where
            formatar x
                | length x == 3 = show(x[0]) ++ ":" ++ show (x[1]) ++ ":" ++ show (x[2])
                | length x == 2 = "00:" ++ show(x[0]) ++ ":" ++ show (x[1])
                | length x == 1 = "00:00:" ++ show(x[0])

-- 4)
