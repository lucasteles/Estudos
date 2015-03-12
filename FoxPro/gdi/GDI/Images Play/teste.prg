LOCAL loBMP AS XFCBITMAP
LOCAL loGFX AS XFCGRAPHICS
LOCAL loGFX2 AS XFCGRAPHICS
LOCAL ARRAY laFILES[1]
LOCAL loMatrix AS xfcMatrix
LOCAL loPointF AS xfcPointF
LOCAL loRect as XfcRectangle

LOCAL lnX, lnY AS Integer
STORE 100 TO lnX, lnY

LOCAL lnXShear, lnYShear as Integer
STORE 0 TO lnXShear, lnYShear

LOCAL lnXScale, lnYScale as Integer
STORE 0 TO lnXScale, lnYScale

DO 'C:\GDI\CARREGARGDI.PRG'

CLEAR

lnCOUNT = ADIR(laFILES,'IMAGES\*.JPG')

loRect	= _Screen.System.Drawing.Rectangle.New(0, 0, 160, 160)

loGFX = _Screen.System.Drawing.Graphics.FromHwnd(_SCREEN.HWnd)
lnAUX=0
lnINCREMENTO=30
FOR lnXI = 1 TO lnCOUNT
	lcFILE = laFILES[lnXI,1]
	INKEY(.000001)
	IF LASTKEY() = 27
		EXIT
	ENDIF
	
	loBMP = _Screen.System.Drawing.Bitmap.FromFile('IMAGES\'+lcFILE)
	loBMPNEW = _Screen.System.Drawing.Bitmap.New(1000,1000)
	loGFX2 = _Screen.System.Drawing.Graphics.FromImage(loBMPNEW)
	*loGFX2.Clear(_Screen.System.Drawing.Color.White)
	loMatrix = _Screen.System.Drawing.Drawing2D.Matrix.New()
	loPointF = _SCREEN.System.Drawing.PointF.New(loBMPNEW.WIDTH/2, loBMPNEW.HEIGHT / 2)
	loMatrix.RotateAt(lnXI * 8, loPointF)
	loGfx2.MultiplyTransform(loMatrix)
	loGfx2.DrawImage(loBmp, 200, 200, 600, 600)
	
	lnAUX = lnAUX + lnINCREMENTO
	
	WAIT WINDOW lnAUX NOWAIT NOCLEAR
	
	IF lnAUX = 180
		lnINCREMENTO = -30
	ENDIF
	
	IF lnAUX = 0
		lnINCREMENTO = 30
	ENDIF
	
	loGfx.DrawImage(loBmpNew, lnXI*30,0+lnAUX, 300, 300)
	
*	loGfx.DrawImage(loBmpNew, lnXI*10,lnXI*10, 300, 300)
ENDFOR