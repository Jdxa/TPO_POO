"
Clase Mascota con atributos significativos
"
Class {
	#name : #Mascota,
	#superclass : #Object,
	#instVars : [
		'nombreMascota',
		'especie',
		'raza',
		'fechaNac',
		'peso',
		'colAplicaciones'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Mascota class >> crearNombre: unNombre especie: unaEspecie raza: unaRaza fechaNac: unaFechaNac peso: unPeso [

	| unaMascota |
	unaMascota := self new.
	unaMascota
		iniciarNombre: unNombre
		especie: unaEspecie
		raza: unaRaza
		fechaNac: unaFechaNac
		peso: unPeso.
	^ unaMascota
]

{ #category : #accesors }
Mascota >> agregarAplicacion: unaAplicacion [
	colAplicaciones add: unaAplicacion 
]

{ #category : #accesors }
Mascota >> aplicaciones [ 
^colAplicaciones 
]

{ #category : #iniciador }
Mascota >> iniciarNombre: unNombreMascota especie: unaEspecie raza: unaRaza fechaNac: unaFechaNac peso: unPeso [

	nombreMascota := unNombreMascota.
	especie := unaEspecie.
	raza := unaRaza.
	fechaNac := unaFechaNac.
	peso := unPeso.
	colAplicaciones := OrderedCollection new.
	
]

{ #category : #visualizer }
Mascota >> nombreMascota [
	^nombreMascota 
]
