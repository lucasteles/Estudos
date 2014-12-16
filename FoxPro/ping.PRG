&& Executa comando PING
LPARAMETERS tcIp
LOCAL loShell,lcPing

WAIT WINDOW " Aguarde, solicitando resposta do servidor... " NOWAIT


DELETE FILE ping.txt

loShell = CREATEOBJECT("wscript.shell")
loShell.RUN(GETENV("ComSpec") + " /C ping " + tcIp + " >ping.txt",0,.T.)

WAIT CLEAR

IF FILE("ping.txt")
lcPing = CHRTRAN(FILETOSTR("ping.txt"),CHR(13),"")
MESSAGEBOX("PING " + tcIp + CHR(10) + lcPing,IIF("Host" $ lcPing,16,64),"Atenção!")
ELSE
MESSAGEBOX("Não foi possível obter resposta do servidor.",16,"Atenção!")
ENDIF

&&DELETE FILE ping.txt
