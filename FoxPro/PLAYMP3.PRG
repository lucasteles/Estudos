LPARAMETERS ACAO,MP3FILE,nMUSIC


***************************************************************************************************
* PLAY MP3 BY TELES
***************************************************************************************************
* Parametros
*	ACAO:
*		"OPEN" = Abri arquivo mp3 (parametro MP3FILE NECESSARIO COM O NOME DO ARQUIVO)
*		"PAUSE" = Pausa arquivo mp3
*		"CLOSE" = Fexa arquvo
*		"PLAY"  = INICIA MUSICA
*	nMUSIC: NUMERO DA MUSICA A TOCAR
*	MP3FILE: ARQUIVO MP3
****************************************************************************************************

DECLARE INTEGER mciSendString IN "winmm.dll" AS "mciSendString" ;
	 String lpstrCommand ,String lpstrReturnString ,INTEGER uReturnLength , INTEGER VhwndCallback 
			 
			 
DECLARE INTEGER GetShortPathName IN  "kernel32" AS "GetShortPathName";
	 String szLongPath  , String pszShortPath , INTEGER  cchBuffer


IF EMPTY(nMUSIC)
	nMUSIC=0
ENDIF

*COLOCA ALTO,ATICAMENTE AÇAO DE ABRIR ARQUIVO
*E SE NAO TIVER ARQUIVO BUSCA UM
IF EMPTY(ACAO)
	ACAO="OPEN"
	IF EMPTY(MP3FILE) 
		MP3FILE=GETFILE()
	ENDIF
ENDIF



ACAO=UPPER(ACAO)
 
DO CASE
	CASE ACAO=="OPEN"
		RETURN OpenFile(FULLPATH(MP3FILE), nMUSIC)
		
	CASE ACAO="PLAY"
	 	 PlayFile(nMUSIC)
		
	CASE ACAO=="PAUSE"	
		PauseFile(nMUSIC)
		
	CASE ACAO="CLOSE"
		CloseFile(nMUSIC)
		
ENDCASE



Function OpenFile 
	LPARAMETERS sFile As String,iAlias As Integer
	
    LOCAL lPathLen As Long, sShortPath As String
    
    lPathLen = GetShortPathName(sFile, NULL, 0)
    
    If lPathLen = 0 
    	 RETURN .F.
    ENDIF
    
    sShortPath = REPLICATE(Chr(0),lPathLen)
    
    GetShortPathName(sFile, @sShortPath, lPathLen)
    sShortPath = Left(sShortPath, Len(sShortPath) - 1)
    

    
    CloseFile(iAlias)
    If Not mciSendString("open " + sShortPath + " type MPEGVideo alias mp3" + TRANSFORM(iAlias), NULL, 0,0) = 0

    	RETURN 
    ENDIF

    mciSendString( "set mp3" + TRANSFORM(iAlias) + " time format milliseconds", NULL, 0, 0)
    RETURN .T.
EndFunc


Function  PlayFile(iAlias As Integer)
   mciSendString("play mp3" + TRANSFORM(iAlias), NULL, 0, 0)

EndFunc

Function  CloseFile(iAlias As Integer)
   mciSendString("close mp3" + TRANSFORM(iAlias), NULL, 0, 0)
ENDFUNC

Function  PauseFile(iAlias As Integer)
    mciSendString("pause mp3" + TRANSFORM(iAlias), NULL, 0, 0)
ENDFUNC

