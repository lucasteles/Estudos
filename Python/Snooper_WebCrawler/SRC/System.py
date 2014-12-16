import sys
import cherrypy

#CLasse de utilização publica com propriedades
class MyAplicativo:
        cDbFile = "SnooperDB.db3"
        FileList=['.AVI','.DOC','.MP3','.PDF','.PPT','.RAR','.WAV','.WMV','.XLS','.ZIP','.EXE','.MSI','.TXT']
        ImgList = ['.JPG','.PNG','.JPEG','.BMP','.GIF']

#Definições padrões do sistema
def Ambientar():
	sys.app = MyAplicativo()
	
