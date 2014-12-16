LPARAMETERS tcFOLDER,tnBACKCOLOR,tnCOLUNAS,tnLARGURA_PADRAO,tnAUTURA_PADRAO

*CONCATENA IMAGENS BY LUCAS TELES 18/10/2010

DO LOCFILE("System.App")
WITH _SCREEN.System.Drawing as xfcDrawing


IF EMPTY(tcFOLDER)
	RETURN .F.
ENDIF

LNKEBRA =0
LNKEBRA2 =0 
LNALTURA=0
LNLARGURA=0
LNMAIOR_ALTURA=0
lnALTURA_ATUAL=0
lnLARGURA_ATUAL=0

lcRGB_BACKCOLOR=DEC2RGB(tnBACKCOLOR)

LCPATH=tcFOLDER
QTARQ=ADIR(laFILES,ADDBS(LCpath)+'*.*')



loMainBmp 	= .Bitmap.NEW(1,1)
loGfx = .Graphics.FromImage(loMainBmp)
loGfx.Clear(_SCREEN.System.Drawing.Color.FromRgb(&lcRGB_BACKCOLOR))
 
FOR lnXI = 1 TO qtarq

	lcFILE=ADDBS(LCpath)+laFILES(lnXI,1)
	
	IF !FILE(lcFILE) OR  ! INLIST(UPPER(RIGHT(lcFILE,4)),'.JPG','.BMP','.PNG','.JPEG','.GIF','.EMF')
		QTARQ = QTARQ -1
		LOOP
	ENDIF
	
	loBMP		= .Bitmap.FromFile(lcFILE)
	
	IF EMPTY(tnLARGURA_PADRAO)
		lnBMPW= loBMP.WIDTH
	ELSE
		lnBMPW=tnLARGURA_PADRAO
	ENDIF
	
	IF EMPTY(tnLARGURA_PADRAO)
		lnBMPH= loBmp.Height
	ELSE
		lnBMPH=tnAUTURA_PADRAO
	ENDIF

	IF MOD(lnXI-1,tnCOLUNAS)=0
		
		LNKEBRA =0
		LNKEBRA2 = LNKEBRA2 +  LNMAIOR_ALTURA 
		lnALTURA_ATUAL=loMainBmp.HEIGHT
		LNMAIOR_ALTURA =0		
		*lnLARGURA_ATUAL=LNLARGURA
		LNLARGURA=0
	ENDIF

	IF LNMAIOR_ALTURA < lnBMPH
		LNMAIOR_ALTURA = lnBMPH
	ENDIF
	
	
	LNLARGURA=LNLARGURA+lnBMPW

	
	IF lnXI=1 OR LNLARGURA>lnLARGURA_ATUAL
		lnLARGURA_ATUAL=LNLARGURA
	ENDIF
	
	*MUDA TAMANHO DA IMAGEM DEPENDENDO DOQ FOI CARREGADO
	loAuxBmp=.Bitmap.NEW(lnLARGURA_ATUAL,lnALTURA_ATUAL+LNMAIOR_ALTURA)
		
	loGfx = .Graphics.FromImage(loAuxBmp)
	loGfx.Clear(_SCREEN.System.Drawing.Color.FromRgb(&lcRGB_BACKCOLOR))
	loGfx.DrawImage(loMainBmp, 0 ,0,loMainBmp.WIDTH, loMainBmp.HEIGHT)	


	loMainBmp=loAuxBmp
	RELEASE loAuxBmp
	loGfx = .Graphics.FromImage(loMainBmp)
	
	loGfx.DrawImage(loBMP, LNKEBRA , LNKEBRA2 ,lnBMPW, lnBMPH)
	
	LNKEBRA = LNKEBRA +  lnBMPW
	

ENDFOR


lcSAIDA =PUTFILE('FILENAME.BMP','IMAGEM.BMP','*.BMP')


IF EMPTY(lcSAIDA )
	RETURN .F.
ENDIF

lcSAIDA = '"' + lcSAIDA + '"'

DELETE FILE &lcSAIDA 
loMainBmp.Save(&lcSAIDA , .Imaging.ImageFormat.bmp)
RUN /N explorer.exe &lcSAIDA 

ENDWITH




************************************************************************************************************************************************************************
*RETIRNA RGB DE UMAN COR EM DECIMAL RGB(XXX,XXX,XXX)
*RETIRADO DO MSDN DA MICROSOFT
**Dec2RGB function: returns separate RGB values from object color value 
FUNC DEC2RGB
	LPARAMETERS tnDec
	IF tnDec < 0
	     WAIT WINDOW 'Must be a positive value'
	     RETURN ""
	ENDIF
	lTalk=IIF(SET('TALK')='ON',.T.,.F.)
	SET TALK OFF

	* Determine the hexadecimal equivalent of the decimal parameter passed
	lcHex = ""
	lnFactor = 24          && set up factor value one exponent greater than


	FOR lnPos = 6 TO 1 STEP -1
	     lnFactor = lnFactor - 4     && decrement factorial
	     lnExp = 2 ^ lnFactor        && extrapolate next least power of two
	     FOR lnOrd = 15 TO 1 STEP -1
	          IF tnDec < lnExp            && no value greater than current one,
	               lcHex = lcHex + "0"    && so store a zero in this position
	               EXIT                   && go back for the next value
	          ENDIF
	          IF tnDec >= lnExp * lnOrd  && is value greater than or equal to?
	               * find the matching hex value from its ordinal position
	               lcHex = lcHex + SUBSTR('123456789ABCDEF', lnOrd, 1)
	               EXIT
	          ENDIF
	     ENDFOR
	     tnDec = tnDec % lnExp     && leave remainder of exponential division
	ENDFOR

	* reverse the order of the individual color indicators
	lcHex = RIGHT(lcHex, 2) + SUBSTR(lcHex, 3, 2) + LEFT(lcHex, 2)

	* convert the pairs into decimal values
	lnPick = 2          && offset to determine which pair to convert
	lcRGB = ["]     && start of string delineator

	* parse each color indicator and convert to decimal
	FOR lnColor = 1 TO 3
	     lcHue = SUBSTR(lcHex, (lnPick * lnColor) - 1, 2) && pull out color
	     lnMSB = ASC(LEFT(lcHue, 1))     && "Most Significant Bit"
	     lnLSB = ASC(RIGHT(lcHue, 1))     && "Least Significant Bit"

	     * subtract appropriate value from each to get decimal equivalent
	     lnMSB = lnMSB - IIF(lnMSB > 57, 55, 48)
	     lnLSB = lnLSB - IIF(lnLSB > 57, 55, 48)

	     * then add decimals together
	     lcRGB = lcRGB + TRANSFORM( lnMSB * 16 + lnLSB, '999') + ", "
	ENDFOR
	lcRGB = LEFT(lcRGB, LEN(lcRGB) - 2) + ["]  && replace last comma with quote
	lcRGB = STRT(lcRGB,'"','')
	RETURN lcRGB