DO 'C:\GDI\CARREGARGDI.PRG'

CLEAR

LOCAL loGFX AS XFCGRAPHICS
LOCAL loPEN AS XFCPEN

loGFX = _Screen.System.Drawing.Graphics.FromHwnd(_SCREEN.HWnd)

LOCAL llALTERNADO AS Logical
STORE .F. TO llALTERNADO

FOR lnXI = 1 TO 700 STEP 10
	=INKEY(.0000000001)
	IF llALTERNADO
		loPEN = _Screen.System.Drawing.Pen.New(_Screen.System.Drawing.Brushes.Red,1)
	ELSE
		loPEN = _Screen.System.Drawing.Pen.New(_Screen.System.Drawing.Brushes.Black,1)	
	ENDIF
	llALTERNADO = NOT llALTERNADO
	loGFX.DrawLine(loPEN, lnXI, 0, 0, 700-lnXI)
ENDFOR
