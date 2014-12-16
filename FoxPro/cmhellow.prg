Local oldScreenLeft
Local oldScreenTop
Local oldScreenHeight
Local oldScreenWidth
Local oldScreenColor

WITH _SCREEN
 oldScreenLeft		= .Left       
 oldScreenTop		= .Top
 oldScreenHeight	= .Height
 oldScreenWidth		= .Width
 oldScreenColor 	= .Backcolor
 
 .LockScreen		= .T.
 .BackColor 		= RGB(192,192,192)   
 .BorderStyle		= 2
 .Closable			= .F.
 .ControlBox		= .F.
 .MaxButton			= .F.
 .MinButton			= .F.
 .Movable			= .T.
 .Height			= 380
 .Width				= 650
 .Caption			= "Custom Screen"    
 .LockScreen		= .F.       
ENDWITH

=MESSAGEBOX("No ERROR !!!",48,WTITLE())