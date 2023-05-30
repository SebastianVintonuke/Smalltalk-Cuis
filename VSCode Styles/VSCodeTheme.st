'From Cuis 6.0 [latest update: #5706] on 30 May 2023 at 1:06:34 am'!
!classDefinition: #VSCodeTheme category: 'Graphics-Themes'!
Theme subclass: #VSCodeTheme
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Graphics-Themes'!

!VSCodeTheme methodsFor: 'widget colors' stamp: 'S.V. 5/21/2023 23:05:16'!
textPane
	^ Color fromHexString: '#3c3c3c'.! !


!VSCodeTheme methodsFor: 'other options' stamp: 'S.V. 5/21/2023 21:12:30'!
roundWindowCorners
	^ true.! !


!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 21:19:08'!
browser
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:01:10'!
debugger
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:04:09'!
fileList
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:02:18'!
messageNames
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/20/2023 22:10:40'!
messageSet
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 04:58:50'!
packageDownloader
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 04:57:01'!
packageInstaller
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:00:17'!
packageList
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:04:31'!
testRunner
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:03:15'!
textEditor
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:01:52'!
transcript
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 20:54:07'!
versionsBrowser
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'tool colors' stamp: 'S.V. 5/21/2023 05:02:57'!
workspace
	^ Color fromHexString: '#3c3c3c'.! !


!VSCodeTheme methodsFor: 'menu colors' stamp: 'S.V. 5/21/2023 21:16:53'!
menu
	^ Color fromHexString: '#333333'.! !

!VSCodeTheme methodsFor: 'menu colors' stamp: 'S.V. 5/21/2023 18:20:52'!
menuText
	^ Color fromHexString: '#ffffff'.! !

!VSCodeTheme methodsFor: 'menu colors' stamp: 'S.V. 5/21/2023 20:57:54'!
menuTitleBar
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'menu colors' stamp: 'S.V. 5/21/2023 21:11:02'!
textHighlight
	^ Color fromHexString: '#264f78'.! !


!VSCodeTheme methodsFor: 'colors' stamp: 'S.V. 5/21/2023 20:50:00'!
background
	^ Color fromHexString: '#1e1e1e'.! !

!VSCodeTheme methodsFor: 'colors' stamp: 'S.V. 5/21/2023 21:07:48'!
buttonLabel
	^ Color fromHexString: '#8b8b8b'.! !

!VSCodeTheme methodsFor: 'colors' stamp: 'S.V. 5/21/2023 20:38:44'!
paneBackgroundFrom: aColor
	^ Color fromHexString: '#1e1e1e'.! !

!VSCodeTheme methodsFor: 'colors' stamp: 'S.V. 5/21/2023 21:08:03'!
text
	^ Color fromHexString: '#ffffff'.! !

!VSCodeTheme methodsFor: 'colors' stamp: 'S.V. 5/21/2023 21:08:13'!
windowLabel
	^ Color fromHexString: '#ffffff'.! !


!VSCodeTheme methodsFor: 'shout' stamp: 'S.V. 5/21/2023 21:44:30'!
shout
	^ {
		#selector  					-> '#dcdc8b'.
		#arguments 					-> '#4ec9a2'.
		#comment 					-> '#56993e'.
		#tempBar 					-> '#3ac1ff'.
		#tempVars 					-> '#3ac1ff'.
		#instVar 					-> '#ce834a'.
		#pseudoVariables 			-> '#1b8fff'.
		#literals 					-> '#94cea8'.
		#messages 					-> '#dcdcaa'.
		#incompleteMessages  	-> '#6d6d6d'.

		#blockLevelZero 			-> '#da70cb'.
		#blockLevelOne 			-> '#179fff'.
		#blockLevelTwo 			-> '#ffd700'.

		#blockLevelThree 			-> '#da70cb'.
		#blockLevelFour 			-> '#179fff'.
		#blockLevelFive 			-> '#ffd700'.

		#blockLevelSix 			-> '#da70cb'.
		#blockLevelSeven 			-> '#179fff'.
	
		#defaults 					-> '#fffff'.
		#undefined 					-> '#f14c4c'.
		#methodTags 				-> '#ff0073'.
	}! !


!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:37:05'!
buttonColorFrom: aColor
	^ Color fromHexString: '#454646'.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:25:10'!
defaultWindowColor
	^ Color fromHexString: '#3c3c3c'.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:50:41'!
scrollbarButtonColor
	^ Color fromHexString: '#424242'.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:57:27'!
scrollbarColor
	^ Color fromHexString: '#1e1e1e'.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:49:21'!
scrollbarShowButtons
	^ false.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:52:20'!
scrollbarSliderShadowColor
	^ Color fromHexString: '#4f4f4f'.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:22:56'!
unfocusedTextHighlightFrom: aColor
	^ Color fromHexString: '#3a3d41'.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 22:04:09'!
useTaskbar
	^ true.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 21:23:49'!
useUniformColors
	^ true.! !

!VSCodeTheme methodsFor: 'as yet unclassified' stamp: 'S.V. 5/21/2023 22:04:27'!
useWindowTitleGradient
	^ false.! !
