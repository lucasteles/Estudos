LOCAL r as integer
LOCAL g as integer
LOCAL b as integer

r=1
g=1
b=1

FOR c=1 TO 100000
_screen.BackColor=RGB(R,G,B)

IF r>220
r=r-1
else
r=r+1
endif

IF g>220
g=g-1
else
g=g+1
endif


IF b>220
b=b-1
else
b=b+1
endif

next



*-------------------------------------


A='.'
A2=A
r=1
g=1
b=1
_SCREEN.FONTSIZE=16
_SCREEN.FONTBOLD=.T.
FOR I=1 TO 5
	FOR X=1 TO 200 
		A=A+A2
		? A
		

		
		IF R>240 THEN
			R=1
		ENDIF

		IF G>240 THEN
			G=1
		ENDIF
		
		IF B>240 THEN
			B=1
		ENDIF


		_SCREEN.FORECOLOR=RGB(R,G,B)
		R=R+1
	ENDFOR
	FOR Y=1 TO 200
		A=SUBSTR(A,1,(LEN(A)-1))
		? A
		

		
		IF R>240 THEN
			R=1
		ENDIF

		IF G>240 THEN
			G=1
		ENDIF
		
		IF B>240 THEN
			B=1
		ENDIF

		
		_SCREEN.FORECOLOR=RGB(R,G,B)
		R=R+1	
	ENDFOR
ENDFOR