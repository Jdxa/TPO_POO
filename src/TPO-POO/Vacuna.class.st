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

{ #category : #iniciador }
Vacuna >> iniciarNombreVac: unNombreVacuna laboratorio: unLaboratorio especie: unaEspecie vigencia: unaVigencia [
	nombreVacuna := unNombreVacuna .
	laboratorio := unLaboratorio .
	especie := unaEspecie .
	vigencia := unaVigencia .

	
]
