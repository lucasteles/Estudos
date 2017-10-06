import cherrypy
import os.path
from Functions import *
from System import *

#Carrega variavel sys.app, objeto com parametrizações do sistema (System.py)
Ambientar()


#Definição das classes das paginas
class Inicio:
    _cp_config = {'tools.sessions.on': True}

    def index(object):
        cRetorno = uReadFile('Index.html')
        cRetorno = cRetorno.replace('[[Site]]','')
        return cRetorno
    index.exposed = True

    def get_LoadLinks(self,txtSite=None,txtTipo=None,txtCache=None):
      cRetorno = RetornaHtmlBusca(txtSite, txtTipo, txtCache)
      #cRetorno = '<img src="../IMAGES/foto 1.jpg" >|<img src="../IMAGES/foto 2.jpg" >|<img src="../IMAGES/foto 3.jpg" >|<img src="../IMAGES/foto 4.jpg" >|'
      #cRetorno = "<a href='http://teste/teste.pdf'>teste</a>|<a href='http://teste/teste2.ppt'>teste2</a>|<a href='http://teste/teste3.doc'>teste3</a>|<a href='http://teste/teste4.xls'>teste4</a>|"
      cRetorno = TratarRetornoHtml(cRetorno, txtTipo)
      return cRetorno
    get_LoadLinks.exposed = True
    
#classe About
class About:
    def index(object):
        cRetorno =  uReadFile('About.html')
        return cRetorno
    index.exposed = True

#Classe de grupo
class Group:
    def index(object):
        cRetorno =  uReadFile('Group.html')
        return cRetorno
    index.exposed = True

#classe de contato
class Contact:
    def index(object):
        cRetorno =  uReadFile('Contact.html')
        return cRetorno
    index.exposed = True     
    
#definindo hierarquia das paginas
ZeraCache()
root=Inicio()
root.about = About()
root.group = Group()
root.contact = Contact()


conf = uGetFile('Settings.conf')
cherrypy.quickstart(root, config=conf )