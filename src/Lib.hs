module Lib where
import Text.Show.Functions
laVerdad = True
type Barrio = String
type Mail = String
type Requisito = Depto -> Bool
type Busqueda = [Requisito]

data Depto = Depto { 
  ambientes :: Int,
  superficie :: Int,
  precio :: Int,
  barrio :: Barrio
} deriving (Show, Eq)

data Persona = Persona {
    mail :: Mail,
    busquedas :: [Busqueda]
}

ordenarSegun _ [] = []
ordenarSegun criterio (x:xs) =
  (ordenarSegun criterio . filter (not . criterio x)) xs ++
  [x] ++
  (ordenarSegun criterio . filter (criterio x)) xs

between cotaInferior cotaSuperior valor =
  valor <= cotaSuperior && valor >= cotaInferior

deptosDeEjemplo = [
  Depto 3 80 7500 "Palermo", 
  Depto 1 45 3500 "Villa Urquiza", 
  Depto 2 50 5000 "Palermo", 
  Depto 1 45 5500 "Recoleta"]
  
------------------------------------------- Punto 1 -------------------------------------------
mayor :: (Eq a , Ord b)=> (a->b)->a->a->Bool
mayor funcion valor otroValor = funcion valor > funcion otroValor

menor :: (Eq a , Ord b)=>(a->b)->a->a->Bool
menor funcion valor  = not.mayor funcion valor

{-
ordenarSegun (mayor.length) lista
Entonces el criterio que ordenarSegun aplcia el lenght a los dos strings que va a evaluar y les aplica la funcion mayor para 
ver cual es mayor y ordenar de esta forma la lista.
Eq a es para los valores a comparar que pueden ser strings,Ints o floats y el Ord b es para lo que devuelve la funcion que le pase
para que sepa que son elementos con un orden y pueda comparalos.
ej: ordenarSegun (mayor length) ["gol","hola","martes","sopa do macaco"] devuelve ["sopa do macaco","martes","hola","gol"]
-}
------------------------------------------- Punto 2 -------------------------------------------
