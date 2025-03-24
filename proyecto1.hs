-- ************ EJERCICIO 1 ************
-- 1a
esCero :: Int -> Bool
esCero x = x == 0

{- ejemplos:
    ghci> esCero 0
    True   
    ghci> esCero (-4)
    False -}

-- 1b
esPositivo :: Int ->  Bool
esPositivo x = x > 0

{- ejemplos:
    ghci> esPositivo 3
    True
    ghci> esPositivo (-3)
    False -}

-- 1c
esVocal :: Char -> Bool
esVocal x | x == 'a' || x =='e' || x =='i' || x =='o' || x =='u'  = True
          | otherwise = False

{- ejemplos:
    ghci> esVocal 'r'
    False
    ghci> esVocal 'e'
    True -}

-- 1d
valorAbsoluto :: Int -> Int
valorAbsoluto x | x >= 0 = x
                | x < 0 = x * (-1)

{- ejemplos:
    ghci> valorAbsoluto 4
    4
    ghci> valorAbsoluto (-6)
    6 -}


-- ************ EJERCICIO 2 ************
-- 2a
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x == paratodo xs

{- ejemplos:
    ghci> paratodo [True, False]
    False
    ghci> paratodo [True, True]
    True -}

-- 2b
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

{- ejemplos:
    ghci> sumatoria [1,2,3,4,5]
    15
    ghci> sumatoria [(-1), (-3), 1, 2, 4]
    3 -}

-- 2c
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

{- ejemplos:
    ghci> productoria [1,2,3,4,5]
    120
    ghci> productoria [(-1), 2, 3, 4, 5]
    -120 -}

-- 2d tengo 2 formas, la primera tomo en cuenta si entra un numero negativo que me de 0 para no entrar en un bucle infinito y que no se me tilde la compu
factorial :: Int -> Int
factorial 0 = 1
factorial n | n >= 0 = n * factorial (n - 1)
            | n < 0 = 0

factorial2 :: Int -> Int
factorial2 n | n == 0 = 1
            | n > 0 = n * factorial2 (n-1)

{- ejemplos:
    ghci> factorial (-3)
    0
    ghci> factorial2 4
    24 -}

-- 2e
promedio :: [Int] -> Int
promedio [] = 0
promedio (x:xs) = sumatoria xs `div` length xs

{- ejemplos:
    ghci> promedio [1,2,3,4,5]
    3
    ghci> promedio [2,2,2,2,3,4,5,6,10]
    4 -}


-- ************ EJERCICIO 3 ************
pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs

{- ejemplos:
    ghci> pertenece 2 [1,2,3,4]
    True
    ghci> pertenece 0 [1,2,3,4]
    False
    ghci> pertenece (-1) [1,2,3,3,(-1)]
    True -}


-- ************ EJERCICIO 4 ************
-- 4a
paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] f = True 
paraTodo' (x:xs) f = f x && paraTodo' xs f 

{- ejemplos: 
    ghci> paraTodo' [1,2,3,4,5] esCero
    False
    ghci> paraTodo' [1,2,3,4,5] esPositivo    
    True
    ghci> paraTodo' ['a', 'e', 'b'] esVocal
    False -}

-- 4b
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] f = False
existe' (x:xs) f = f x || existe' xs f

{- ejemplos:
    ghci> existe' [1,2,3,4,5] esCero
    False
    ghci> existe' [0,1,2,3,4,5] esCero
    True -}

-- 4c
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] f = 0
sumatoria' (x:xs) f = f x + sumatoria' xs f

{- ejemplos:
    ghci> sumatoria' [1,2,3,4] (+2)
    18
    ghci> sumatoria' ["genial"] length
    6
    ghci> sumatoria' ["genial","hola"] length
    10
    ghci> sumatoria' [1,2,3,4] (*2)
    20 -}

-- 4d
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] f = 1
productoria' (x:xs) f = f x * productoria' xs f

{- ejemplos:
    ghci> productoria' [1,2,3] (+1)
    24
    ghci> productoria' ["ae","bc"] length
    4 -}


-- ************ EJERCICIO 5 ************
paraTodo'' :: [a] -> (a -> Bool) -> Bool
paraTodo'' xs y = paraTodo' xs y

{- ejemplos:
    ghci> paraTodo'' [1,2,3] esCero
    False
    ghci> paraTodo'' "aaa" esVocal  
    True
    ghci> paraTodo'' "aba" esVocal
    False -}


-- ************ EJERCICIO 6 ************
-- Ejercicio 6a
todosPares :: [Int] -> Bool
todosPares xs = paraTodo' xs (even)

{- ejemplos:
    ghci> todosPares [1,2,3]
    False
    ghci> todosPares [2,4,6]
    True -}

-- Ejercicio 6b
esMultiplo :: Int -> Int -> Bool 
esMultiplo y x = mod x y == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo y xs = existe' xs (esMultiplo y)

{- ejemplos:
    ghci> hayMultiplo 5 [1, 10, 4]
    True
    ghci> hayMultiplo 2 [3, 5, 7]
    False -}

-- Ejercicio 6c
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0..n] (^2)

{- ejemplos:
    ghci> sumaCuadrados 4
    30
    ghci> sumaCuadrados 2
    5 -}

-- Ejercicio 6d
esDivisor :: Int -> Int -> Bool 
esDivisor y x = mod y x == 0

existeDivisor :: Int -> [Int] -> Bool
existeDivisor y xs = existe' xs (esDivisor y)

{- ejemplos:
    ghci> existeDivisor 2 [6, 12]
    False
    ghci> existeDivisor 12 [1,2,3,4,5]
    True -}

-- Ejercicio 6e
esPrimo :: Int -> Bool
esPrimo n = not(existeDivisor n [2..(n-1)]) && n>1

{- ejemplos:
    ghci> esPrimo 3
    True
    ghci> esPrimo 4
    False -}

-- Ejercicio 6f
factorial' :: Int -> Int
factorial' n = productoria [1..n]

{- ejemplos:
    ghci> factorial' 4
    24
    ghci> factorial' 3
    6 -}

-- Ejercicio 6g
soloPrimos :: [Int] -> [Int]
soloPrimos [] = []
soloPrimos (x:xs)|esPrimo x = x:soloPrimos xs
                 |otherwise = soloPrimos xs

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria (soloPrimos xs)

{- ejemplos:
    ghci> multiplicaPrimos [1,2,3,4,5,6,7,8,9]
    210
    ghci> multiplicaPrimos [3,6]
    3 -}

-- Ejercicio 6h
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

esFib :: Int -> Bool
esFib n = pertenece n (map fib [0..(n+1)])

{- ejemplos:
    ghci> esFib 5 
    True
    ghci> esFib 10
    False -}

-- Ejercicio 6i
todosFib :: [Int] -> Bool
todosFib xs = paraTodo'' xs esFib

{- ejemplos:
    ghci> todosFib [1,2,3,4,5,6]
    False
    ghci> todosFib [0,1,2]
    True -}

-- ************ EJERCICIO 7 ************
{- funciones map y filter
¿qué hacen estas funciones?
map :: (a -> b) -> [a] -> [b]
    es la lista obtenida aplicado f a cada elemento de xs ( map f xs )
filter :: (a -> Bool) -> [a] -> [a]
    es la lista de elementos de la lista xs que verifican el predicado p ( filter p xs ) -} 

{- ¿a q equivale la expresion map succ [1, (-4), 6, 2, (-8)]
equivale a map (+1) [1, (-4), 6, 2, (-8)] 
dando como resultado [2,-3,7,3,-7] -} 

{- ¿y la expresion filter esPositivo [1, (-4), 6, 2, (-8)]
equivale a filter (>=0) [1, (-4), 6, 2, (-8)]
dando como resultado [1,6,2] -} 


-- ************ EJERCICIO 8 ************
-- 8a
duplicar :: [Int] -> [Int]
duplicar [] = []
duplicar (x:xs) = x * 2 : duplicar xs

{- ejemplo:
    ghci> duplicar [1,2,3,4,5]
    [2,4,6,8,10] -}

-- 8b
duplicar' :: [Int] -> [Int]
duplicar' xs = map (*2) xs

{- ejemplo:
    ghci> duplicar' [1,2,3,4]
    [2,4,6,8] -}


-- ************ EJERCICIO 9 ************
-- 9a (FUNCION DEFINIDA EN LINEA 123)
--soloPrimos :: [Int] -> [Int]
--soloPrimos [] = []
--soloPrimos (x:xs)|esPrimo x = x:soloPrimos xs
--                 |otherwise = soloPrimos xs

-- 9b
soloPrimos' :: [Int] -> [Int]
soloPrimos' xs = filter esPrimo xs

{- ejemplo:
    ghci> soloPrimos' [1,2,3,4,5,6,7,8,9]
    [2,3,5,7] -}

-- 9c
multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria (filter esPrimo xs)

{- ejemplo:
    ghci> multiplicaPrimos' [1,2,3,4,5,6] 
    30 -}

-- ************ EJERCICIO 10 ************
-- 10a
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA y [] = []
primIgualesA y (x:xs) | x==y = x:primIgualesA y xs
                      | otherwise = []

{- ejemplos:
    ghci> primIgualesA 2  [1,2,3,4]
    []
    ghci> primIgualesA 1 [1,2,3]
    [1] -}

--10b
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' y xs = takeWhile (==y) xs

{- ejemplos:
    ghci> primIgualesA' 3 [3,3,3,4,3]
    [3,3,3] 
    ghci> primIgualesA' 4 [3,5]
    []
    ghci> primIgualesA' 'a'  "aabaaaa"
    "aa" -}

-- ************ EJERCICIO 11 ************
-- 11a
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:y:xs) | (x /= y) = x: []
                     | (x == y) = x: primIguales (y:xs)

{- ejemplos:
    ghci> primIguales [1,1,2,3,4]
    [1,1]
    ghci> primIguales [1]        
    [1]
    ghci> primIguales "aaaaabbbaaasfd"
    "aaaaa" -}                     

--11b
primIguales' :: Eq a => [a] -> [a]
primIguales' (x:xs) = primIgualesA' x (x:xs)

{- ejemplos:
    ghci> primIguales' "aaaaba"       
    "aaaa"
    ghci> primIguales' [1,1,1,3,1]
    [1,1,1] -}