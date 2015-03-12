LOCAL loBMP AS XFCBITMAP
LOCAL loBMPCROP AS XFCBITMAP
LOCAL loGFX AS XFCGRAPHICS
LOCAL loRECT AS XFCRECTANGLE

CLEAR
DO 'C:\GDI\CARREGARGDI.PRG'

loGFX = _Screen.System.Drawing.Graphics.FromHwnd(_Screen.HWnd)
loBMP = _Screen.System.Drawing.Bitmap.FromFile(GETPICT())
loRECT = _Screen.System.Drawing.Rectangle.New(200,200,200,200)
loBMPCROP = loBMP.Clone(loRECT)
loGFX.DrawImage(loBMPCROP,0,0,200,200)