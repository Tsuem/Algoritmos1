-- ej 1
type Letras = (Char,Char,Char)
type Numeracion = Int

data Matricula = Patente Letras Numeracion deriving (Show)

letra_valida :: Char -> Bool
letra_valida c | ('A' <= c) && (c <= 'Z') = True
               | otherwise = False

{- ejemplos:
ghci> letra_valida '@'
False
ghci> letra_valida 'R'
True -}

letras_validas :: Letras -> Bool
letras_validas (x,y,z) = (letra_valida x) && (letra_valida y) && (letra_valida z)

{- ejemplos:
ghci> letras_validas ('E','R','T')
True
ghci> letras_validas ('E','R','t')
False -}

matricula_valida :: Matricula -> Bool
matricula_valida (Patente t n) | ((letras_validas t) && (0 <= n) && (n <= 999)) = True
                               | otherwise = False


-- ej 2
instance Eq Matricula where
    (Patente _ n) == (Patente _ n') = (n == n')

filtrar_patentes :: [Matricula] -> Numeracion -> [Matricula]
filtrar_patentes [] n = []
filtrar_patentes ((Patente l n1):xs) n | (n1 == n) = (Patente l n1) : filtrar_patentes xs n
                                       | otherwise = filtrar_patentes xs n

{- ejemplos:
ghci> filtrar_patentes [Patente ('E','R','S') 213, Patente ('R','T','O') 543] 213
[Patente ('E','R','S') 213]
ghci> filtrar_patentes [Patente ('E','R','S') 213, Patente ('R','T','O') 543] 231
[] -}


-- ej 3
type Titular = String
data Estado = SinDeuda | ConDeuda deriving Show
data Registro = AgregaReg Matricula Estado Titular Registro | SinRegs deriving Show

mismo_estado :: Estado -> Estado -> Bool
mismo_estado SinDeuda SinDeuda = True
mismo_estado ConDeuda ConDeuda = True
mismo_estado _ _ = False

consulta :: Registro -> Titular -> Estado -> [Matricula]
consulta (AgregaReg m e t reg) ti ei | ((t == ti) && (mismo_estado e ei)) = m : consulta (reg) ti ei
                                     | otherwise = consulta (reg) ti ei
consulta _ ti ei = []

{- ejemplo:
ghci> consulta (AgregaReg (Patente ('A','A','A') 234) SinDeuda "Persona 1" (AgregaReg (Patente ('A','B','C') 321) ConDeuda "Persona 2" SinRegs)) "Persona 1" SinDeuda
[Patente ('A','A','A') 234] -}