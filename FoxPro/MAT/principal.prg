_screen.Visible=.f.
SET ESCAPE ON
DO FORM matar

READ events

proc encerrar
	CANCEL
	RELEASE ALL 
	CLOSE ALL
	CLEAR ALL
	QUIT
ENDPROC
