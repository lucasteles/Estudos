LOCAL loGFX AS XFCGRAPHICS
LOCAL loPEN AS XFCPEN
LOCAL loBRUSH AS XFCBRUSH

&&DO 'C:\GDI\CARREGARGDI.PRG'
DO LOCFILE('SYSTEM.APP')

CLEAR
FOR i2 = 1 to 10&& 52 Existem 52
	loGFX 	= _Screen.System.Drawing.Graphics.FromHwnd(_Screen.Hwnd)
	loSOLIDBRUSH = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.green,.T.)
	loSOLIDBRUSH2 = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.green,.T.)
	*loSOLIDBRUSH3 = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.Green,.T.)
	*loSOLIDBRUSH4 = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.Yellow,.T.)
	loSOLIDBRUSH4 = _Screen.System.Drawing.Drawing2D.HatchBrush.New(i2,_Screen.System.Drawing.Color.green, _Screen.System.Drawing.Color.Blue)
	loSOLIDBRUSH3 = loSOLIDBRUSH4.clone()

	loPEN = _Screen.System.Drawing.Pen.New(loSOLIDBRUSH,1)
	*loPEN 	= _Screen.System.Drawing.Pen.New(_Screen.System.Drawing.Brushes.Black,1)
	*loGFX.DrawEllipse(loPEN,0,0,100,100)
	FOR I = 10 TO 360 STEP 5
		IF INKEY(.0001) = 27
			RETURN
		ENDIF
		loGFX.FillPie(loSOLIDBRUSH, 0, 0, 100, 100, I, 90)
		loGFX.FillPie(loSOLIDBRUSH2, 0, 0, 100, 100, I+180, 90)
		loGFX.FillPie(loSOLIDBRUSH3, 0, 0, 100, 100, I+90, 90)
		loGFX.FillPie(loSOLIDBRUSH4, 0, 0, 100, 100, I+270, 90)
	ENDFOR
ENDFOR