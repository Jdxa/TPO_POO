"
Instance Variables
	especie:		<Object>
	laboratorio:		<Object>
	nombreVacuna:		<Object>
	vigencia:		<Object>
"
Class {
	#name : #Vacuna,
	#superclass : #Object,
	#instVars : [
		'nombreVacuna',
		'laboratorio',
		'especie',
		'vigencia'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Vacuna class >> crearNombreVac: unNombreVacuna
    laboratorio: unLaboratorio
    especie: unaEspecie
    vigencia: unaVigencia [

    | unaVacuna |

    unaVacuna := self new.
    unaVacuna
        iniciarNombreVac: unNombreVacuna
        laboratorio: unLaboratorio
        especie: unaEspecie
        vigencia: unaVigencia.

    ^ unaVacuna
]

{ #category : #iniciador }
Vacuna >> iniciarNombreVac: unNombreVacuna laboratorio: unLaboratorio especie: unaEspecie vigencia: unaVigencia [
	nombreVacuna := unNombreVacuna .
	laboratorio := unLaboratorio .
	especie := unaEspecie .
	vigencia := unaVigencia .

	
]

{ #category : #propio }
Vacuna >> mismaVacuna: unaVacuna [
 ^ nombreVacuna = unaVacuna nombreVacuna
]

{ #category : #accesing }
Vacuna >> nombreVacuna [
^nombreVacuna 
]

{ #category : #propio }
Vacuna >> vencio: fechaAplicacion [

	^ Date today >= (fechaAplicacion addDays: vigencia )
]
