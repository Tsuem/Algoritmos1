-------------------
------ ejercicio 1
-------------------
data Categoria =  Bulbosas | Rosales | Frutales | Trepadoras
data Floracion =  Primavera | Verano | Invierno 
type Hoja = String
type Precio = Int
data TipoSemilla = Flores | Hortalizas | Aromaticas
data Material = Plastico | Barro

data ProductosVivero = Planta Categoria Floracion Hoja Precio | Semilla TipoSemilla Hoja Precio | Maceta Material Precio 
instance Eq ProductosVivero where       
    (Planta c1 f1 h1 p1) == (Planta c2 f2 h2 p2) = (mismaCategoria c1 c2) && (h1 ==h2)       
    (Semilla t1 h1 p1) == (Semilla t2 h2 p2) = (mismoTipo t1 t2) && (h1==h2) && (p1==p2)
    (Maceta m1 p1) == (Maceta  m2 p2)  = (mismoMaterial m1 m2) && (p1==p2)  
     _ == _ = False
-- ejemplos de uso 
--ghci> Planta  Bulbosas Verano "Verde" 2000 == Planta  Bulbosas Verano "Verde" 2000
--ghci>True
--ghci> Planta  Bulbosas Verano "Verde" 2000 == Planta  Rosales Verano "Verde" 2000
--ghci>False
--ghci> Planta  Bulbosas Verano "Verde" 2000 == Planta  Bulbosas Invierno "Verde" 2000
--ghci>True
--ghci> Semilla Flores "Verde" 1000 == Semilla Flores "Verde" 1000
--ghci>True
--ghci> Semilla Flores "Verde" 1000 == Semilla Flores "Amarilla" 1000
--ghci>False
--ghci>Semilla Flores "Verde" 1000 == Semilla Flores "Verde" 3000
--ghci>False
--ghci> Maceta Plastico 3000 == Maceta Plastico 300
--ghci>False
--ghci> Maceta Plastico 3000 == Maceta Plastico 3000
--ghci>True
--ghci> Maceta Plastico 3000 == Maceta Barro 3000
--ghci>False

----- b)----- Cuantas Plantas
mismaCategoria:: Categoria -> Categoria -> Bool
mismaCategoria Bulbosas Bulbosas = True
mismaCategoria Rosales Rosales = True
mismaCategoria Frutales Frutales = True
mismaCategoria Trepadoras Trepadoras = True
mismaCategoria _ _ = False

cuantasPlantas :: [ProductosVivero] -> Categoria -> Int
cuantasPlantas [] c1 = 0
cuantasPlantas ((Planta c f h p):xs) c1 | mismaCategoria c c1 = 1 + cuantasPlantas xs c1
                                                                   |otherwise = cuantasPlantas xs c1
cuantasPlantas (_:ds) c1 = cuantasPlantas ds c1

-- ejemplo de uso 
--ghci> cuantasPlantas  [Planta  Bulbosas Verano "Verde" 2000, Semilla Flores "Verde" 1000, Maceta Plastico 3000, Planta  Bulbosas Invierno "Verde" 2000] Bulbosas
--ghci>2
--ghci> cuantasPlantas  [Planta  Bulbosas Verano "Verde" 2000, Semilla Flores "Verde" 1000, Maceta Plastico 3000, Planta  Rosales Invierno "Verde" 2000] Bulbosas
--ghci>1
---- c)---Igualdad
mismoTipo:: TipoSemilla -> TipoSemilla -> Bool
mismoTipo Flores Flores = True
mismoTipo Hortalizas Hortalizas = True
mismoTipo Aromaticas Aromaticas = True
mismoTipo _ _ = False
mismoMaterial:: Material-> Material -> Bool
mismoMaterial Plastico Plastico = True
mismoMaterial Barro Barro = True
mismoMaterial _ _ = False
---- d)---- Dos Iguales
hayDosIguales :: [ProductosVivero] -> Bool
hayDosIguales [] = False
hayDosIguales [p] = False
hayDosIguales (p1:p2:xs) = (p1==p2) || hayDosIguales (p2:xs)
-- ejemplo de uso 
--ghci> hayDosIguales  [Planta  Bulbosas Verano "Verde" 2000, Semilla Flores "Verde" 1000, Maceta Plastico 3000, Planta  Bulbosas Invierno "Verde" 2000]
--ghci>False
--ghci> hayDosIguales [Planta  Bulbosas Verano "Verde" 2000, Planta  Bulbosas Invierno "Verde" 2000, Semilla Flores "Verde" 1000, Maceta Plastico 3000]
--ghci>True
-------------------
------ ejercicio 2
-------------------
type Titulo = String
type Megusta = Int
type Duracion = Int
data Estado = Reproducido | SinReproducir deriving Show
data MovieList = Movie Titulo Megusta Estado Duracion MovieList | SinMovie deriving Show
----- b)
minutosReproducidos :: MovieList -> Megusta -> Duracion
minutosReproducidos SinMovie mg = 0
minutosReproducidos (Movie _ _ SinReproducir _ mls) mg = minutosReproducidos mls mg
minutosReproducidos (Movie _ mg1 Reproducido d mls) mg | mg1 >= mg = d + minutosReproducidos mls mg
                                                                                                          | otherwise = minutosReproducidos mls mg
----- c)
estadoDePeli :: Titulo -> MovieList -> Maybe Estado
estadoDePeli _ SinMovie = Nothing
estadoDePeli t (Movie ti _ e _ mls) | t == ti = Just e
                                                            | otherwise = estadoDePeli t mls
--Main> minutosReproducidos (Movie "Ironman" 1 Reproducido 120 (Movie "Avenger" 2 Reproducido 140 (Movie "Spiderman" 0 SinReproducir 110 SinMovie))) 1 
--260
--Main> estadoDePeli "Avenger" (Movie "Ironman" 1 Reproducido 120 (Movie "Avenger" 2 Reproducido 140 (Movie "Spiderman" 0 SinReproducir 110 SinMovie))) 
--Just Reproducido
--Main> estadoDePeli "Spiderman" (Movie "Ironman" 1 Reproducido 120 (Movie "Avenger" 2 Reproducido 140 (Movie "Spiderman" 0 SinReproducir 110 SinMovie)))
--Just SinReproducir