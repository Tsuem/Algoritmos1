-- EJERCICIO 2
-- 2a Definir el tipo Astro
data Astro = Estrella Luminosidad Temperatura Nombre | Planeta Estructura NumSat DistEstrella deriving Show

{- data Luminosidad = Supergigante | Gigante | SecuenciaPrincipal | Enana deriving Show -}
data Luminosidad = Enana | SecuenciaPrincipal | Gigante | Supergigante deriving Show
{- data Temperatura = A | B | F | G | K | M | O deriving Show -}
data Temperatura = O | B | A | F | G | K | M deriving Show
data Estructura = Rocoso | Gaseoso deriving Show

type Nombre = String 
type NumSat = Int 
type DistEstrella = Float 


-- 2b Definir la función masSatelites
{- masSatelites :: [Astro] -> Int -> [Astro]
masSatelites [] n = []
masSatelites ((Planeta a b c):xs) n = if b >= n then (((Planeta a b c):[]) ++ masSatelites xs n)
                                                else masSatelites xs n
masSatelites (_ :xs) n = masSatelites xs n -}

masSatelites :: [Astro] -> Int -> [Astro]
masSatelites [] n = []
masSatelites ((Planeta a b c):xs) n | b >= n = (((Planeta a b c):[]) ++ masSatelites xs n)
                                    | otherwise = masSatelites xs n
masSatelites (_ :xs) n = masSatelites xs n



-- 2c Definir el orden para Astro de manera que:
{- ordenAstro :: Ord Astro => [Astro] -> [Astro]
ordenAstro [] = []
ordenAstro ((Estrella l t n):(Estrella l' t' n'):xs) | ((l >= l') || (t > t')) = ((Estrella l t n):[]) ++ ordenAstro xs
                                                     | otherwise = ordenAstro xs 
 -}
{- numeroTemperatura :: (Eq Temperatura, Ord Temperatura) => Temperatura -> Int
numeroTemperatura O = 0
numeroTemperatura B = 1
numeroTemperatura A = 2
numeroTemperatura F = 3
numeroTemperatura G = 4
numeroTemperatura K = 5
numeroTemperatura M = 6

numeroLuminosidad :: Luminosidad -> Int
numeroLuminosidad Enana = 0
numeroLuminosidad SecuenciaPrincipal = 1
numeroLuminosidad Gigante = 2
numeroLuminosidad Supergigante = 3 -}



-- EJERCICIO 3
-- 3a Definir un tipo recursivo NotasDeIngles
data NotasDeIngles = EvolucionDelEstudiante Nombre' Nivel Nota1 Nota2 NotaFinal NotasDeIngles| NohayMasEstudiantes

data Nivel = One | Two | Three deriving (Eq, Ord)

type Nombre' = String
type Nota1 = Int
type Nota2 = Int
type NotaFinal = Int

-- 3b Programar la función pasaDeNivel
pasaDeNivel :: NotasDeIngles -> Nombre -> Bool
pasaDeNivel (NohayMasEstudiantes) n' = False
pasaDeNivel (EvolucionDelEstudiante n lvl n1 n2 n3 xs) n' | ((n == n') && ((lvl == One) || (lvl == Two)) && ((n1 > 8) || (n2 > 8)) && (n3 >= 7)) || ((n==n') && (lvl == Three) && (((n1 >= 6) && (n2 >= 6)) || (n3 >= 7))) = True
                                                          | otherwise = False

{- ejm:
*Main> pasaDeNivel (EvolucionDelEstudiante "Maxi" One 5 7 8 (EvolucionDelEstudiante "Nako" Two 4 6 3 (EvolucionDelEstudiante "Tsue" Three 7 8 9 NohayMasEstudiantes))) "Maxi"
False

*Main> pasaDeNivel (EvolucionDelEstudiante "Maxi" One 8 9 8 (EvolucionDelEstudiante "Nako" Two 4 6 3 (EvolucionDelEstudiante "Tsue" Three 7 8 9 NohayMasEstudiantes))) "Maxi"
True
-}

-- 3c
devolverNotaFinal :: NotasDeIngles -> Nombre' -> Maybe Int
devolverNotaFinal NohayMasEstudiantes n = Nothing
devolverNotaFinal (EvolucionDelEstudiante nombre lvl n1 n2 i xs) n | n == nombre = Just i
                                                                   | otherwise = devolverNotaFinal xs n

{- ejm:
*Main> devolverNotaFinal (EvolucionDelEstudiante "Maxi" One 2 4 6 (EvolucionDelEstudiante "Nako" One 5 6 6 NohayMasEstudiantes)) "Nako"
Just 6

*Main> devolverNotaFinal (EvolucionDelEstudiante "Maxi" One 2 4 9 NohayMasEstudiantes) "Maxi"
Just 9

*Main> devolverNotaFinal (EvolucionDelEstudiante "Maxi" One 2 4 9 NohayMasEstudiantes) "Nako"
Nothing
-}