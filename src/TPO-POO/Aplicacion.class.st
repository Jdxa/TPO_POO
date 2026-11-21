"
Instance Variables
	fecha:		<Object>
	mascota:		<Object>
	vacuna:		<Object>
	veterinario:		<Object>
"
Class {
	#name : #Aplicacion,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'veterinario',
		'vacuna'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Aplicacion class >> crearFecha: unaFecha mascota: unaMascota veterinario: unVeterinario vacuna: unaVacuna [
|unaAplicacion|
unaAplicacion := self new.
unaAplicacion iniciarFecha: unaFecha mascota: unaMascota veterinario: unVeterinario vacuna: unaVacuna.
^unaAplicacion  
]

{ #category : #constructor }
Aplicacion class >> crearFecha: unaFecha veterinario: unVeterinario vacuna: unaVacuna [

	| unaAplicacion |
	unaAplicacion := self new.
	unaAplicacion
		iniciarFecha: unaFecha
		veterinario: unVeterinario
		vacuna: unaVacuna.
	^ unaAplicacion
]

{ #category : #propio }
Aplicacion >> estaVencida [
^vacuna vencio: fecha
]

{ #category : #visualizer }
Aplicacion >> fecha [
^fecha 
]

{ #category : #iniciador }
Aplicacion >> iniciarFecha: unaFecha veterinario: unVeterinario vacuna: unaVacuna [

	fecha := unaFecha.
	veterinario := unVeterinario.
	vacuna := unaVacuna
]

{ #category : #visualizer }
Aplicacion >> vacuna [ 
^vacuna 
]

{ #category : #propio }
Aplicacion >> vacunaPertenece: unaVacuna [
	^vacuna mismaVacuna: unaVacuna 
]

{ #category : #visualizer }
Aplicacion >> veterinario [ 
^veterinario 
]
