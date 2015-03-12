LPARAMETERS lcCommand,Lctype

IF lcCommand=='OPEN'
	lcCommand="set cdaudio door open wait"
ENDIF

IF lcCommand=='CLOSE'
	lcCommand="set cdaudio door closed wait"
ENDIF


DECLARE INTEGER mciSendString IN winmm;
    STRING lpszCommand, STRING @lpszReturnString,;
    INTEGER cchReturn, INTEGER hwndCallback
 
LOCAL lnError
STORE SPACE(250) TO lcReturn, lcError
lnError = mciSendString(lcCommand, @lcReturn, Len(lcReturn), 0)


*!*	 	COMANDOS RECEBIDOS POR PARAMETROS 	
*!*											
*!*	"set cdaudio door open wait"			
*!*	"set cdaudio door closed wait"			
*!*	"-"										
*!*	"capability cdaudio can eject"			
*!*	"capability cdaudio can play"			
*!*	"capability cdaudio can record"			
*!*	"capability cdaudio can save"			
*!*	"capability cdaudio compound device"	
*!*	"-"										
*!*	"info cdaudio identity"					
*!*	"info cdaudio upc"						
*!*	"-"										
*!*	"status cdaudio current track"			
*!*	"status cdaudio length"					
*!*	"status cdaudio media present"			
*!*	"status cdaudio mode"					
*!*	"-"										
*!*	"spin cdaudio down"						
*!*	"spin cdaudio up"						
*!*	"-"										
*!*	"play cdaudio from 2"					
*!*	"pause cdaudio wait"					
*!*	"resume cdaudio wait"					
*!*	"stop cdaudio wait"						
*!*											