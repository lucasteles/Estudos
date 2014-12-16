Local oldScreenLeft
Local oldScreenTop
Local oldScreenHeight
Local oldScreenWidth
Local oldScreenColor

WITH _SCREEN
 .Left = oldScreenLeft     
 .Top = oldScreenTop       
 .Height = oldScreenHeight
 .Width  = oldScreenWidth
 .BackColor=oldScreenColor     
 .LockScreen=.T.       
 .BorderStyle=3        
 .Closable=.T.         
 .ControlBox=.T.
 .MaxButton=.T.
 .MinButton=.T.
 .Movable=.T.
 .Caption="Microsoft Visual FoxPro"  
 .LockScreen=.F.       
ENDWITH