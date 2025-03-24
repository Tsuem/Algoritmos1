-- ***** EJERCICIO 1 *****
-- 1a
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Show, Eq)

{- ejm:
ghci> Matematica
Matematica
ghci> :t Matematica
Matematica :: Carrera -}

-- 1b
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

{- ejm:
ghci> titulo Matematica
"Licenciatura en Matematica"
ghci> titulo Derecho
<interactive>:56:8: error:
    * Data constructor not in scope: Derecho :: Carrera
    * Perhaps you meant `Derecha' (line 60) -}

-- 1c
{- data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si -}

-- 1d
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A' 
cifradoAmericano Si = 'B'

{- ejm:
ghci> cifradoAmericano Do
'C' 
ghci> cifradoAmericano Mi
'E' -}


-- ***** EJERCICIO 2 *****
-- 2a
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Eq, Ord)

{- ejm:
ghci> Do <= Re
True
ghci> Fa `min` Sol
Fa -}


-- ***** EJERCICIO 3 *****
-- 3a
minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

{- ejm: 
ghci> minimoElemento [1,2,3,4,5]
1
ghci> minimoElemento "abcdef"
'a' -}

-- 3b
minimoElemento' :: (Ord a, Bounded a, Show a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)

{- ejm:
ghci> minimoElemento' ['e','i','o']
'e' -}

-- 3c uso la función minimoElemento para determinar la nota más grave de la siguiente lista
{- ghci> minimoElemento [Fa, La, Sol, Re, Fa]
Re -}


-- ***** EJERCICIO 4 *****
-- 4a
type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera deriving (Eq, Show)
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

-- 4b
{- ciclista es un constructor con un argumento, es una función que toma como parámetro a Modalidad y devuelve un Deportista.
ghci> :t Ciclista
Ciclista :: Modalidad -> Deportista -}

-- 4c
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista _) :xs) = 1 + contar_velocistas xs
contar_velocistas (_: xs) = contar_velocistas xs

{- ejm:
ghci> contar_velocistas [Velocista 2, Velocista 1, Ajedrecista, Ciclista Pista]
2 
ghci> contar_velocistas []           
0 -}

-- 4d
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas ((Futbolista x _ _ _):xs) z = if x == z then 1 + contar_futbolistas xs z
                                                           else contar_futbolistas xs z
contar_futbolistas (_:xs) z = contar_futbolistas xs z

{- ejm:
ghci> contar_futbolistas [Velocista 1, Ajedrecista, Futbolista Arco 1 Izquierda 2, Ajedrecista] Defensa
0
ghci> contar_futbolistas [Velocista 1, Ajedrecista, Futbolista Arco 1 Izquierda 2, Ajedrecista] Arco
1 -}

-- 4e
zona_igual :: Zona -> Deportista -> Bool
zona_igual z (Futbolista x _ _ _) = x == z
zona_igual _ _ = False

contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' xs z = length (filter (zona_igual z) xs)

{- ejm:
ghci> contar_futbolistas' [Futbolista Arco 2 Derecha 2, Ajedrecista, Velocista 3] Arco
1
ghci> contar_futbolistas' [Futbolista Arco 2 Derecha 2, Ajedrecista, Velocista 3] Mediocampo
0 -}


-- ***** EJERCICIO 5 *****
-- 5a
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

{- ejm: 
ghci> sonidoNatural Do
0
ghci> sonidoNatural La
9 -}

-- 5b
data Alteracion = Bemol | Natural | Sostenido deriving (Eq, Ord, Show)

{- ejm:
ghci> Natural
Natural
ghci> :t Bemol
Bemol :: Alteracion -}

-- 5c
{- data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Eq, Ord) -}
data NotaMusical = Nota NotaBasica Alteracion

{- ghci> :t Nota
Nota :: NotaBasica -> Alteracion -> NotaMusical -}

-- 5d
-- definir sonidoCromatico
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n a) =
    case a of
        Sostenido -> valorNota + 1
        Bemol -> valorNota - 1   
        Natural -> valorNota
    where
        valorNota = sonidoNatural n

{- ejm:
ghci> sonidoCromatico (Nota Do Bemol)
-1
ghci> sonidoCromatico (Nota Re Sostenido)
3
ghci> sonidoCromatico (Nota La Sostenido)
10 -}

-- 5e
instance Eq NotaMusical where
    n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2

{- ejm:
ghci> Nota Do Sostenido == Nota Re Bemol
True
ghci> Nota Do Sostenido == Nota La Sostenido
False -}

-- 5f
instance Ord NotaMusical where
    n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2

{- ejm:
ghci> Nota Re Sostenido <= Nota Do Bemol
False
ghci> Nota Si Bemol <= Nota La Sostenido
True -}

-- ***** EJERCICIO 6 *****
-- 6a
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

{- ejm:
ghci> primerElemento [1,2,3,4,5]
Just 1
ghci> primerElemento "jthrgefs" 
Just 'j' -}

-- ***** EJERCICIO 7 *****
data Cola = VaciaC | Encolada Deportista Cola deriving Show

-- 7a
-- a1
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada d c) =
    case c of
        VaciaC -> Nothing
        c -> Just c


{- ejm:
ghci> atender (Encolada Ajedrecista VaciaC)
Nothing
ghci> atender (Encolada Ajedrecista (Encolada Ajedrecista (Encolada Ajedrecista VaciaC)))
Just (Encolada Ajedrecista (Encolada Ajedrecista VaciaC)) 
ghci> atender VaciaC
Nothing -}

-- a2
encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = (Encolada d VaciaC)
encolar d (Encolada d' c) = (Encolada d' (Encolada d c))

{- ejm:
ghci> encolar (Ciclista Pista) (Encolada Ajedrecista VaciaC)
Encolada Ajedrecista (Encolada (Ciclista Pista) VaciaC)
ghci> encolar Ajedrecista (Encolada Ajedrecista VaciaC)
Encolada Ajedrecista (Encolada Ajedrecista VaciaC) -}

-- a3
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC z = Nothing
busca (Encolada (Futbolista z n p a) c) zona | zona == z = Just (Futbolista z n p a)
                                             | otherwise = busca c zona

{- ejm:
ghci> busca (Encolada (Futbolista Arco 2 Derecha 2) VaciaC) Defensa                       
Nothing
ghci> busca (Encolada (Futbolista Arco 2 Derecha 2) VaciaC) Arco   
Just (Futbolista Arco 2 Derecha 2) -}


-- 7b ¿A qué otro tipo se parece Cola?
-- Cola se parece al tipo listas.


-- ***** EJERCICIO 8 *****
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

-- 8a cómo instanciar el tipo ListaAsoc para representar la info almacenada en una guía telef
type GuiaTelefonica = ListaAsoc String Int

-- 8b programar las sgtes funciones:
-- b1
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _ c) = 1 + la_long c

{- ejm:
ghci> la_long Vacia                 
0
ghci> la_long (Nodo 1 2 (Nodo 1 3 (Nodo 13 6 Vacia)))
3 -}

-- b2
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia la = la
la_concat (Nodo a b la') la = (Nodo a b (la_concat la' la))

{- ejm: 
ghci> la_concat (Nodo "Tsue" 1 Vacia) Vacia   
Nodo "Tsue" 1 Vacia
ghci> la_concat (Nodo 1 3 Vacia) (Nodo 5 2 Vacia)
Nodo 1 3 (Nodo 5 2 Vacia)
ghci> la_concat (Nodo 23 5 Vacia) Vacia
Nodo 23 5 Vacia -}

-- b3
la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = (Nodo a b Vacia) 
la_agregar (Nodo a b la) a' b' | a == a' = (Nodo a b' la)
                               | otherwise = (Nodo a' b' (Nodo a b la))

{- ejm:
ghci> la_agregar (Nodo 1 5 Vacia) 1 5
Nodo 1 5 Vacia

ghci> la_agregar (Nodo 1 5 Vacia) 1 6
Nodo 1 6 Vacia

ghci> la_agregar (Nodo 1 5 Vacia) 3 7             
Nodo 3 7 (Nodo 1 5 Vacia)

ghci> la_agregar (Nodo "Nako" 65432 Vacia) "Nako" 65432345
Nodo "Nako" 65432345 Vacia -}

-- b4
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b la) = (a, b) : la_pares la

{- ejm:
ghci> la_pares (la_concat (Nodo 4 2 Vacia) Vacia)
[(4,2)]
ghci> la_pares (Nodo 1 2 (Nodo 1 3 (Nodo 13 6 Vacia)))
[(1,2),(1,3),(13,6)] -}

-- b5
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo a b la) a' | a == a' = Just b
                          | otherwise = la_busca la a'

{- ejm:
ghci> la_busca (Nodo 3 1 Vacia) 3
Just 1
ghci> la_busca (Nodo 3 1 Vacia) 2
Nothing -}

-- b6
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a' Vacia = Vacia
la_borrar a' (Nodo a b la) | a' == a = la
                          | otherwise = (Nodo a b (la_borrar a' la))

{- ejm:
ghci> la_borrar 2 (Nodo 3 2 (Nodo 2 4 Vacia))
Nodo 3 2 Vacia
ghci> la_borrar 2 (Nodo 2 4 Vacia)
Vacia 
ghci> la_borrar 2 (Nodo 2 4 (Nodo 2 6 (Nodo 5 1 Vacia)))
Nodo 2 6 (Nodo 5 1 Vacia) -}