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
		'colDiagnostico'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Mascota class >> crearNombre: unNombre especie: unaEspecie raza: unaRaza fechaNac: unaFechaNac peso: unPeso colDiagnostico: unaColDiagnostico [
|unaMascota|
unaMascota := self new.
unaMascota iniciarNombre: unNombre  especie: unaEspecie  raza: unaRaza fechaNac: unaFechaNac peso: unPeso colDiagnostico: unaColDiagnostico.
^unaMascota  
]

{ #category : #iniciador }
Mascota >> iniciarNombre: unNombreMascota especie: unaEspecie raza: unaRaza fechaNac: unaFechaNac peso: unPeso colDiagnostico: unaColDiagnostico [

nombreMascota := unNombreMascota .
especie := unaEspecie .
raza := unaRaza .
fechaNac := unaFechaNac .
peso := unPeso .
colDiagnostico := unaColDiagnostico.
]
