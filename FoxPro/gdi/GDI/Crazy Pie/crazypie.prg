LOCAL loGfx AS XFCGraphics
LOCAL loBrush AS XFCBrush
LOCAL loRect as XFCRectangle
LOCAL lnXI AS Integer

DO 'C:\GDI\CARREGARGDI.PRG'

CLEAR

WITH _Screen.System.Drawing
	loGfx = .Graphics.FromHwnd(_Screen.HWnd)
	loRect = .Rectangle.New(0, 0, 500, 500)

	FOR lnXI = 1 TO 360
		IF MOD(lnXI,2)==0
			loBrush = .SolidBrush.New( .Color.Fromrgb(0,0,0) ) && PRETO
			loGFX.FillPie(loBrush, loRect, lnXI, 1)
		ELSE
			loBrush = .SolidBrush.New( .Color.Fromrgb(255,0,0)) && VERMELHO
			loGFX.FillPie(loBrush, loRect, lnXI, 1)
		ENDIF
	ENDFOR
ENDWITH