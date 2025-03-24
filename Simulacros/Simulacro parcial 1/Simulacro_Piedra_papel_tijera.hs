--Ejercicio 1a

data Forma = Piedra | Papel | Tijera

leGana :: Forma -> Forma -> Bool
leGana Piedra Tijera = True
leGana Tijera Papel = True
leGana Papel Piedra = True
leGana _ _ = False

--Ejercicio 1b

type Nombre = String

data Jugador = Mano Nombre Forma

ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n1 f1) (Mano n2 f2)   | leGana f1 f2 = Just n1
                                    | leGana f2 f1 = Just n2
                                    | otherwise = Nothing

--Ejercicio 2

mismaForma :: Forma -> Forma -> Bool
mismaForma Tijera Tijera = True
mismaForma Piedra Piedra = True
mismaForma Papel Papel = True
mismaForma _ _ = False

quienJugo :: Forma -> [Jugador] -> [Nombre]
quienJugo f [] = []
quienJugo f ((Mano n f1):xs)    | mismaForma f f1 = n : quienJugo f xs
                                | otherwise = quienJugo f xs 