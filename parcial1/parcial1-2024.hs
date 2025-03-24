-- 1a
type Duracion = Int
type Nombre = String
type Director = String
type AñoDeEstreno = Int
type NroDeCapitulo = Int
type Temporada = Int

data Video = Pelicula Nombre Director Duracion AñoDeEstreno 
           | CapSerie Nombre NroDeCapitulo Temporada AñoDeEstreno deriving Show


-- 1b
-- a)
odisea2001 :: Video
odisea2001 = (Pelicula "2001: Odisea del espacio" "Stanley Kubrick" 142 1968)

-- b)
theOfficeS02E05 :: Video
theOfficeS02E05 = (CapSerie "The Office" 5 2 2005)

-- c)
esDelDirector :: Video -> String -> Bool
esDelDirector (Pelicula _ d _ _) d' | (d == d') = True
                                    | otherwise = False
esDelDirector _ d' = False

{- ejemplo:
*Main> esDelDirector (Pelicula "peli1" "dire" 123 1990) "dire"
True -}

-- d)
esActual :: Video -> Bool
esActual (CapSerie  _ _ _ a) | (a >= 2020) = True
                             | otherwise = False
esActual _ = False

{- ejemplos:
*Main> esActual (CapSerie "n" 5 5 2023)
True
*Main> esActual (CapSerie "n" 5 5 1990)
False 
*Main> esActual (Pelicula "a" "pepe" 235 1990)
False -}

-- e)
tiempoPelis :: [Video] -> Int -> Int
tiempoPelis [] a' = 0
tiempoPelis ((Pelicula _ _ d a):ls) a' | (a == a') = d + tiempoPelis ls a'
                                       | otherwise = tiempoPelis ls a'
tiempoPelis (_:ls) a' = tiempoPelis ls a'

{- ejemplo: 
*Main> tiempoPelis [(Pelicula "a" "b" 123 2000), (Pelicula "b" "c" 100 2000), (CapSerie "d" 2 4 2000)] 2000
223 -}


-- EJERCICIO 2
data ColaVideo = Vacia | Encolada Video ColaVideo deriving Show

colaReproduccion :: ColaVideo
colaReproduccion = Encolada (Pelicula "elPadrino" "d" 123 2000) (Encolada (CapSerie "breakingBadS01E01" 1 1 2024) Vacia)

seriesActuales :: ColaVideo -> ColaVideo
seriesActuales Vacia = Vacia
seriesActuales (Encolada (CapSerie n nc t a) q) | (esActual (CapSerie n nc t a)) = (Encolada (CapSerie n nc t a) q)
                                                | otherwise = seriesActuales q
seriesActuales (Encolada _ q) = seriesActuales q