!classDefinition: #WallpaperEngineWindow category: 'WallpaperEngine'!
SystemWindow subclass: #WallpaperEngineWindow
	instanceVariableNames: 'wallpaperList previewImageMorph applyButtonMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!

!WallpaperEngineWindow methodsFor: 'structure' stamp: 'S.V. 5/28/2023 22:35:30'!
build1stColumn
	| column |

	wallpaperList := PluggableListMorph
		model: self model
		listGetter: #wallpapersNames
		indexGetter: #selectionIndex
		indexSetter: #selectionIndex:.
		
	column := LayoutMorph newColumn.
	column addMorph: wallpaperList proportionalHeight: 1.

	^ column.! !

!WallpaperEngineWindow methodsFor: 'structure' stamp: 'S.V. 5/27/2023 21:51:47'!
build2ndColumn
	| column |

	column := LayoutMorph newColumn.
	column addMorph: self build2ndColumn1stRow.
	column addMorph: self build2ndColumn2ndRow.

	^ column.! !

!WallpaperEngineWindow methodsFor: 'structure' stamp: 'S.V. 5/28/2023 04:42:32'!
build2ndColumn1stRow
	| row |
	
	previewImageMorph := ImageMorph new.
	previewImageMorph layoutSpec offAxisEdgeWeight: 0.5.
	self updatePreview.
	
	row := LayoutMorph newColumn.
	row axisEdgeWeight: 0.5;
	addMorph: previewImageMorph.

	^ row.	! !

!WallpaperEngineWindow methodsFor: 'structure' stamp: 'S.V. 5/28/2023 05:23:01'!
build2ndColumn2ndRow
	| row |

	applyButtonMorph := PluggableButtonMorph
		model: self model
		stateGetter: nil
		action: #applyWallpaper
		label: 'Apply Wallpaper'.
	applyButtonMorph layoutSpec offAxisEdgeWeight: 0.5.

	row := LayoutMorph newColumn.
	row axisEdgeWeight: 0.5;
	addMorph: applyButtonMorph.

	^ row.	
! !

!WallpaperEngineWindow methodsFor: 'structure' stamp: 'S.V. 5/28/2023 21:53:04'!
buildMorphicWindow

	self layoutMorph beRow;
	separation: 10;
	axisEdgeWeight: 0.5;

	addMorph: self build1stColumn
		layoutSpec: (LayoutSpec proportionalWidth: 0.3);
	addMorph: self build2ndColumn
		layoutSpec: (LayoutSpec proportionalWidth: 0.7).! !


!WallpaperEngineWindow methodsFor: 'events' stamp: 'S.V. 5/28/2023 05:06:22'!
suscribeToModelEvents
	^ self model when: #selectionChanged send: #updatePreview to: self.! !

!WallpaperEngineWindow methodsFor: 'events' stamp: 'S.V. 5/28/2023 04:41:56'!
updatePreview
	previewImageMorph image: (self model selected preview).! !


!WallpaperEngineWindow methodsFor: 'initialization' stamp: 'S.V. 5/27/2023 21:40:42'!
defaultExtent
	^ 600@300.
	! !

!WallpaperEngineWindow methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 09:40:02'!
initializeWith: aView forWallpaper: aTypeOfWallpaper.
	self setLabel: 'Wallpaper Engine: ', aTypeOfWallpaper.
	self model: aView.
	self buildMorphicWindow.
	self openInWorld.
	self morphExtent: (self defaultExtent).
	self suscribeToModelEvents.
	! !

!WallpaperEngineWindow methodsFor: 'initialization' stamp: 'S.V. 5/28/2023 03:49:07'!
windowColor
	^ Theme current defaultWindowColor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WallpaperEngineWindow class' category: 'WallpaperEngine'!
WallpaperEngineWindow class
	instanceVariableNames: ''!

!WallpaperEngineWindow class methodsFor: 'instance creation' stamp: 'S.V. 5/29/2023 10:04:55'!
openDynamic
	^ self openWallpaperEngineViewWithModel: DynamicWallpaperEngineView new forWallpaper: 'Dynamic Wallpaper'.! !

!WallpaperEngineWindow class methodsFor: 'instance creation' stamp: 'S.V. 5/29/2023 10:05:13'!
openStatic
	^ self openWallpaperEngineViewWithModel: StaticWallpaperEngineView new forWallpaper: 'Static Wallpaper'.! !

!WallpaperEngineWindow class methodsFor: 'instance creation' stamp: 'S.V. 5/29/2023 09:41:01'!
openWallpaperEngineViewWithModel: aView forWallpaper: aTypeOfWallpaper.
	^ self new initializeWith: aView forWallpaper: aTypeOfWallpaper.! !


!WallpaperEngineWindow class methodsFor: 'menu' stamp: 'S.V. 5/29/2023 20:45:33'!
changeWallpaper
	| menu |
	menu := MenuMorph new.
	menu
		addTitle: 'Wallpapers';
		addStayUpIcons;
		add: 'Static' target: self action: #openStatic;
		add: 'Dynamic' target: self action: #openDynamic.
	
	menu popUpInWorld: self runningWorld.

"
Morphic-Menus / TheWorldMenu class / preferencesMenuOptions

{
	#submenuOf  			-> 		TheWorldMenu preferencesLabel.
	#itemGroup 			-> 		10.
	#itemOrder 			-> 		90.
	#label 			-> 		'Wallpapers...'.
	#object 			-> 		WallpaperEngineWindow.
	#selector 			-> 		#changeWallpaper.
	#icon 			-> 		#worldIcon.
	#balloonText 	-> 		'set a wallpaper.'
} asDictionary.
"! !


!classDefinition: #Wallpaper category: 'WallpaperEngine'!
Object subclass: #Wallpaper
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!


!Wallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:38:32'!
name
	self subclassResponsibility.! !

!Wallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:38:53'!
preview
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Wallpaper class' category: 'WallpaperEngine'!
Wallpaper class
	instanceVariableNames: ''!

!Wallpaper class methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:58:18'!
defaultResolution
	^ 1920@1080.! !


!classDefinition: #DynamicWallpaper category: 'WallpaperEngine'!
Wallpaper subclass: #DynamicWallpaper
	instanceVariableNames: 'directory frames'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!

!DynamicWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:36:43'!
frames
	^ frames.! !

!DynamicWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:56:49'!
framesAtResolution: aResolution
	| framesAtResolution |

	framesAtResolution := frames collect: [ :aForm |
		aForm magnifyTo: aResolution.
	].

	^ framesAtResolution.! !

!DynamicWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:37:07'!
name
	^ directory name.! !

!DynamicWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:37:26'!
preview
	| image  |

	image := frames at: 1 ifAbsent: [ self error: 'No se encontro preview'. ].

	^ image magnifyTo: 384@216.! !


!DynamicWallpaper methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:58:34'!
initializeFrames
	

	frames :=  (directory files) collect: [ :aFrameFile | (Form fromFileEntry: aFrameFile) magnifyTo: self class defaultResolution. ].
		! !

!DynamicWallpaper methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:40:39'!
newFromDirectory: aDirectory
	directory := aDirectory.
	self initializeFrames.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DynamicWallpaper class' category: 'WallpaperEngine'!
DynamicWallpaper class
	instanceVariableNames: ''!

!DynamicWallpaper class methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:48:02'!
newFromDirectory: aDirectory
	^ self new newFromDirectory: aDirectory.! !


!classDefinition: #StaticWallpaper category: 'WallpaperEngine'!
Wallpaper subclass: #StaticWallpaper
	instanceVariableNames: 'file image'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!

!StaticWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:42:49'!
image
	^ image.! !

!StaticWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:59:34'!
imageAtResolution: aResolution
	^ image magnifyTo: aResolution .! !

!StaticWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 20:08:25'!
name
	^ ((file name) substringsSeparatedBy: $.) at: 1.! !

!StaticWallpaper methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:41:24'!
preview
	^ image magnifyTo: 384@216.! !


!StaticWallpaper methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:58:43'!
initializeImage
	image := (Form fromFileEntry: file) magnifyTo: self class defaultResolution.! !

!StaticWallpaper methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:43:31'!
newFromFile: aFile
	file := aFile.
	self initializeImage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StaticWallpaper class' category: 'WallpaperEngine'!
StaticWallpaper class
	instanceVariableNames: ''!

!StaticWallpaper class methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:48:24'!
newFromFile: aFile
	^ self new newFromFile: aFile.! !


!classDefinition: #WallpaperEngine category: 'WallpaperEngine'!
Object subclass: #WallpaperEngine
	instanceVariableNames: 'staticWallpapers dynamicWallpapers currentDynamicWallpaper runDynamic'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!

!WallpaperEngine methodsFor: 'public' stamp: 'S.V. 5/29/2023 22:02:26'!
setDynamicWallpaperFrom: aFrameList
	self stopDynamicWallpaper.
	currentDynamicWallpaper := (self world) provideDynamicWallpaperClosureFrom: aFrameList.
	runDynamic := true.
	currentDynamicWallpaper fork.

"
Morphic / PasteUpMorph / misc

provideDynamicWallpaperClosureFrom: aFrameList
	| frameList delay |

	frameList := aFrameList collect: [ :frame |
		frame magnifyTo: extent.
		frame orderedDither32To16 asColorFormOfDepth: 8.
	].

	delay := Delay forMilliseconds: 500.

	^ [
		[ true ] whileTrue: [
			frameList do: [ :frame |
				backgroundImage := nil.
				Smalltalk primitiveGarbageCollect.
				backgroundImage := frame.
				Smalltalk primitiveGarbageCollect.
				backgroundImage bits pin.
				self redrawNeeded.
				delay wait.
			].
		]
	].
"
	! !

!WallpaperEngine methodsFor: 'public' stamp: 'S.V. 5/29/2023 22:02:35'!
setStaticWallpaperFromForm: anImage
	self stopDynamicWallpaper.
	self world setStaticImageFromForm: anImage.
	
"
Morphic / PasteUpMorph / misc

setStaticImageFromForm: anImage
	backgroundImage := nil.
	Smalltalk primitiveGarbageCollect.
	backgroundImage := anImage magnifyTo: extent.
	backgroundImage := backgroundImage orderedDither32To16 asColorFormOfDepth: 8.
	Smalltalk primitiveGarbageCollect.
	backgroundImage bits pin.
	self redrawNeeded.
"
	! !


!WallpaperEngine methodsFor: 'private' stamp: 'S.V. 5/29/2023 22:01:45'!
stopDynamicWallpaper
	runDynamic := false.
	currentDynamicWallpaper := nil.! !


!WallpaperEngine methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 22:05:46'!
initialize
	self stopDynamicWallpaper.
	staticWallpapers := OrderedCollection new.
	dynamicWallpapers := OrderedCollection new.
	self initializeWallpapers.! !

!WallpaperEngine methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 19:47:17'!
initializeWallpapers
	| dynamicDirectory staticFiles |

	dynamicDirectory := (DirectoryEntry withPathName: 'Wallpapers/DynamicWallpapers') directories.
	staticFiles := (DirectoryEntry withPathName: 'Wallpapers/StaticWallpapers') files.

	dynamicDirectory do: [ :aDirectory | dynamicWallpapers add: (DynamicWallpaper newFromDirectory: aDirectory) ].
	staticFiles do: [ :aFile | staticWallpapers add: (StaticWallpaper newFromFile: aFile) ].! !


!WallpaperEngine methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 11:13:17'!
dynamicWallpapers
	^ dynamicWallpapers.! !

!WallpaperEngine methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 11:13:27'!
staticWallpapers
	^ staticWallpapers.! !

!WallpaperEngine methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 01:54:13'!
world
	^ UISupervisor runningWorld.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WallpaperEngine class' category: 'WallpaperEngine'!
WallpaperEngine class
	instanceVariableNames: 'instance'!

!WallpaperEngine class methodsFor: 'singleton' stamp: 'S.V. 5/28/2023 22:08:11'!
getInstance
	instance ifNil: [ instance := self new ].
	^ instance.! !

!WallpaperEngine class methodsFor: 'singleton' stamp: 'S.V. 5/28/2023 22:09:20'!
resetInstance
	instance := self new.! !


!classDefinition: #WallpaperEngineView category: 'WallpaperEngine'!
Object subclass: #WallpaperEngineView
	instanceVariableNames: 'index wallpapers wallpaperEngine'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!

!WallpaperEngineView methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 11:15:06'!
initialize
	wallpaperEngine := WallpaperEngine getInstance.
	index := 1.! !


!WallpaperEngineView methodsFor: 'accessing' stamp: 'S.V. 5/28/2023 05:21:18'!
selected
	^ wallpapers at: index ifAbsent: [ self error: 'No se encontro el wallpaper seleccionado'. ].! !

!WallpaperEngineView methodsFor: 'accessing' stamp: 'S.V. 5/28/2023 03:45:27'!
selectionIndex
	^ index.! !

!WallpaperEngineView methodsFor: 'accessing' stamp: 'S.V. 5/29/2023 19:44:32'!
wallpapersNames
	^ wallpapers collect: [ :wallpaper | wallpaper name. ].! !


!WallpaperEngineView methodsFor: 'operations' stamp: 'S.V. 5/29/2023 10:05:36'!
applyWallpaper
	^ self subclassResponsibility.! !

!WallpaperEngineView methodsFor: 'operations' stamp: 'S.V. 5/28/2023 21:49:40'!
selectionIndex: anIndex

	(anIndex = 0) ifTrue: [ ^self ].

	index := anIndex.
	self triggerEvent: #selectionChanged.! !


!classDefinition: #DynamicWallpaperEngineView category: 'WallpaperEngine'!
WallpaperEngineView subclass: #DynamicWallpaperEngineView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!

!DynamicWallpaperEngineView methodsFor: 'operations' stamp: 'S.V. 5/29/2023 21:36:57'!
applyWallpaper
	| frames |
	frames := (wallpapers at: index) frames.
	wallpaperEngine setDynamicWallpaperFrom: frames.! !


!DynamicWallpaperEngineView methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 14:48:32'!
initialize
	super initialize.
	wallpapers := wallpaperEngine dynamicWallpapers.! !


!classDefinition: #StaticWallpaperEngineView category: 'WallpaperEngine'!
WallpaperEngineView subclass: #StaticWallpaperEngineView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WallpaperEngine'!

!StaticWallpaperEngineView methodsFor: 'operations' stamp: 'S.V. 5/29/2023 21:32:58'!
applyWallpaper
	| image |
	image := (wallpapers at: index) image.
	wallpaperEngine setStaticWallpaperFromForm: image.! !


!StaticWallpaperEngineView methodsFor: 'initialization' stamp: 'S.V. 5/29/2023 14:49:50'!
initialize
	super initialize.
	wallpapers := wallpaperEngine staticWallpapers.! !
