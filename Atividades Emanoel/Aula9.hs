data Nat = Zero | Suc Nat deriving Show
nat2int :: Num a => Nat -> a
nat2int Zero = 0
nat2int (Suc n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Suc (int2nat (n-1))
 
somar :: Nat -> Nat -> Nat
somar Zero n = n
somar (Suc m) n = Suc (somar m n)

-- Método Pilas
diminuir :: Nat -> Nat -> Nat
diminuir m Zero = m
diminuir m n = int2nat (nat2int (m) - nat2int (n))

diminuir' :: Nat -> Nat -> Nat
diminuir' Zero n = Zero
diminuir' m Zero = m 
diminuir' (Suc m) (Suc n) = diminuir' m n
