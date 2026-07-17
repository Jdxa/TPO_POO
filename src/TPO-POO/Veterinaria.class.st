"
Instance Variables
	colAplicaciones:		<Object>
	colCliente:		<Object>
	colDiagnostico:		<Object>
	colFacturas:		<Object>
	colMonodrogas:		<Object>
	colTurnos:		<Object>
	colVeterinario:		<Object>
	cuit:		<Object>
"
Class {
	#name : #Veterinaria,
	#superclass : #Object,
	#instVars : [
		'cuit',
		'colVeterinario',
		'colCliente',
		'colDiagnostico',
		'colFacturas',
		'colMonodrogas',
		'colAplicaciones',
		'colTurnos'
	],
	#category : #'TPO-POO'
}

{ #category : #constructor }
Veterinaria class >> crearCuit: unCuit [
|unaVeterinaria|
unaVeterinaria := self new.
unaVeterinaria iniciarCuit: unCuit .
^unaVeterinaria 
]

{ #category : #visualizer }
Veterinaria >> buscarCliente: unNombreMascota [

	| unCliente |
	unCliente := colCliente detect: [ :cliente |
		             cliente buscarMascota: unNombreMascota ].
	unCliente := unCliente  getNombreCliente.
	^unCliente
]

{ #category : #iniciador }
Veterinaria >> iniciarCuit: unCuit [
cuit := unCuit.
colVeterinario := OrderedCollection new.
colCliente := OrderedCollection new.
colDiagnostico := OrderedCollection new.
colFacturas := OrderedCollection new.
colMonodrogas := OrderedCollection new.
colAplicaciones := OrderedCollection new.
colTurnos := OrderedCollection new.

]
