!classDefinition: #Piano category: 'PianoPlayer'!
BoxedMorph subclass: #Piano
	instanceVariableNames: 'teclasBlancas teclasNegras'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Piano methodsFor: 'as yet unclassified' stamp: 'S.V. 5/29/2023 23:41:26'!
initialize
	Feature require: 'Sound'.
	super initialize.
	self color: (Color fromHexString: '#303030').
	self morphHeight: 270.
	self morphWidth: 400.
	self initializeTeclasBlancas.
	self initializeTeclasNegras.! !

!Piano methodsFor: 'as yet unclassified' stamp: 'S.V. 5/29/2023 23:40:31'!
initializeTeclasBlancas
	| positionX |
	teclasBlancas := OrderedCollection new.
	teclasBlancas add: Do3 new.
	teclasBlancas add: Re3 new.
	teclasBlancas add: Mi3 new.
	teclasBlancas add: Fa3 new.
	teclasBlancas add: Sol3 new.
	teclasBlancas add: La3 new.
	teclasBlancas add: Si3 new.
	
	positionX := 25.
	teclasBlancas do: [ :tecla |
		self addMorph: tecla.
		tecla morphPosition: positionX@0.
		positionX := positionX + 50.
	]! !

!Piano methodsFor: 'as yet unclassified' stamp: 'S.V. 5/29/2023 23:49:56'!
initializeTeclasNegras
	| positionX nTeclas |
	teclasNegras := OrderedCollection new.
	teclasNegras add: Reb3 new.
	teclasNegras add: Mib3 new.
	teclasNegras add: Solb3 new.
	teclasNegras add: Lab3 new.
	teclasNegras add: Sib3 new.
	
	positionX := 60.
	nTeclas := 0.
	teclasNegras do: [ :tecla |
		self addMorph: tecla.
		tecla morphPosition: positionX@0.
		positionX := positionX + 50.
		(nTeclas = 1) ifTrue: [ positionX := positionX + 50 ].
		nTeclas := nTeclas + 1.
	]! !


!classDefinition: #Tecla category: 'PianoPlayer'!
BoxedMorph subclass: #Tecla
	instanceVariableNames: 'sound'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Tecla methodsFor: 'stepping' stamp: 'sv 5/18/2023 03:06:33'!
stepTime
	^ 20 "millisecond"! !

!Tecla methodsFor: 'stepping' stamp: 'sv 5/18/2023 03:21:20'!
wantsSteps
	^ true! !


!Tecla methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:24:05'!
fileLocation
	^ self subclassResponsibility.	! !

!Tecla methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 23:33:36'!
initialize
	| fileReader |
	super initialize.
	fileReader := AIFFFileReader new.
	fileReader readFromFile: self fileLocation.
	sound := fileReader sound.
	self startSteppingStepTime: self stepTime.! !


!Tecla methodsFor: 'events' stamp: 'sv 5/18/2023 03:55:38'!
handlesKeyboard
	^ true! !

!Tecla methodsFor: 'events' stamp: 'sv 5/18/2023 03:29:24'!
handlesMouseDown: aMouseButtonEvent
	^ true.	! !

!Tecla methodsFor: 'events' stamp: 'sv 5/18/2023 03:31:36'!
keyStroke: event! !

!Tecla methodsFor: 'events' stamp: 'sv 5/18/2023 03:27:15'!
keyUp: anEvent
! !

!Tecla methodsFor: 'events' stamp: 'sv 5/18/2023 03:51:20'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	self playFor: 2000.! !


!Tecla methodsFor: 'sound' stamp: 'sv 5/11/2023 03:50:24'!
isPlaying
	^ SoundPlayer isPlaying: sound.! !

!Tecla methodsFor: 'sound' stamp: 'sv 5/11/2023 03:23:36'!
play
	SoundPlayer playSound: sound.! !

!Tecla methodsFor: 'sound' stamp: 'sv 5/13/2023 10:11:18'!
playFor: AMillisecondsToPlay
	| delay |
	delay := Delay forMilliseconds: AMillisecondsToPlay.

	[ self play.		delay wait .self stop	] fork.
! !

!Tecla methodsFor: 'sound' stamp: 'sv 5/11/2023 03:23:41'!
stop
	SoundPlayer pauseSound: sound.! !


!classDefinition: #TeclaBlanca category: 'PianoPlayer'!
Tecla subclass: #TeclaBlanca
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!TeclaBlanca methodsFor: 'initialization' stamp: 'sv 5/18/2023 02:56:10'!
initialize
	super initialize.
	self color: (Color fromHexString: '#dedede').
	self morphHeight: 250.
	self morphWidth: 50.
	! !


!TeclaBlanca methodsFor: 'as yet unclassified' stamp: 'sv 5/18/2023 03:47:04'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	super mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition.
	[
		self color: (Color fromHexString: '#f0e4b4').
		(Delay forMilliseconds: 1000) wait.
		self color: (Color fromHexString: '#dedede').	
	] fork.! !


!classDefinition: #Do3 category: 'PianoPlayer'!
TeclaBlanca subclass: #Do3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Do3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:18:21'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.C3.aiff'.! !


!classDefinition: #Fa3 category: 'PianoPlayer'!
TeclaBlanca subclass: #Fa3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Fa3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:29:24'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.F3.aiff'.! !


!classDefinition: #La3 category: 'PianoPlayer'!
TeclaBlanca subclass: #La3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!La3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:29:33'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.A3.aiff'.! !


!classDefinition: #Mi3 category: 'PianoPlayer'!
TeclaBlanca subclass: #Mi3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Mi3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:29:57'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.E3.aiff'.! !


!classDefinition: #Re3 category: 'PianoPlayer'!
TeclaBlanca subclass: #Re3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Re3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:30:19'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.D3.aiff'.! !


!classDefinition: #Si3 category: 'PianoPlayer'!
TeclaBlanca subclass: #Si3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Si3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:30:41'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.B3.aiff'.! !


!classDefinition: #Sol3 category: 'PianoPlayer'!
TeclaBlanca subclass: #Sol3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Sol3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:30:56'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.G3.aiff'.! !


!Sol3 methodsFor: 'as yet unclassified' stamp: 'sv 5/18/2023 03:56:13'!
keyStroke: event
	| key |
	key := event keyCharacter.
	key = $w ifTrue: [ self play ].! !


!classDefinition: #TeclaNegra category: 'PianoPlayer'!
Tecla subclass: #TeclaNegra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!TeclaNegra methodsFor: 'initialization' stamp: 'sv 5/18/2023 03:14:28'!
initialize
	super initialize.
	self color: (Color fromHexString: '#242424').
	self morphHeight: 166.
	self morphWidth: 30.! !


!TeclaNegra methodsFor: 'as yet unclassified' stamp: 'sv 5/18/2023 03:49:30'!
mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition
	super mouseButton1Down: aMouseButtonEvent localPosition: localEventPosition.
	[
		self color: (Color fromHexString: '#e8c63f').
		(Delay forMilliseconds: 1000) wait.
		self color: (Color fromHexString: '#242424').	
	] fork.! !


!classDefinition: #Lab3 category: 'PianoPlayer'!
TeclaNegra subclass: #Lab3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Lab3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:29:44'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.Ab3.aiff'.! !


!classDefinition: #Mib3 category: 'PianoPlayer'!
TeclaNegra subclass: #Mib3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Mib3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:30:06'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.Eb3.aiff'.! !


!classDefinition: #Reb3 category: 'PianoPlayer'!
TeclaNegra subclass: #Reb3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Reb3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:30:28'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.Db3.aiff'.! !


!classDefinition: #Sib3 category: 'PianoPlayer'!
TeclaNegra subclass: #Sib3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Sib3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:30:49'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.Bb3.aiff'.! !


!classDefinition: #Solb3 category: 'PianoPlayer'!
TeclaNegra subclass: #Solb3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PianoPlayer'!

!Solb3 methodsFor: 'initialization' stamp: 'sv 5/11/2023 03:31:08'!
fileLocation
	^ 'PianoPlayer/FF/Piano.ff.Gb3.aiff'.! !
