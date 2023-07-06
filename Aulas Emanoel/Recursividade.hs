insert :: Ord t => t -> [t] -> [t]
insert x [] = [x]
insert x (y:ys) | x <= y = x:y:ys
                | otherwise = y:insert x ys

insertionSort :: (Foldable t, Ord a) => t a -> [a]
insertionSort = foldr insert []


insertionSort' :: Ord a => [a] -> [a]
insertionSort' [] = []
insertionSort' (x:xs) = insert x (insertionSort xs)
