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
		'mascota',
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

{ #category : #iniciador }
Aplicacion >> iniciarFecha: unaFecha mascota: unaMascota veterinario: unVeterinario vacuna: unaVacuna [
fecha := unaFecha.
mascota := unaMascota .
veterinario := unVeterinario .
vacuna := unaVacuna  
]
