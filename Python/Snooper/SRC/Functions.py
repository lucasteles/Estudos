import os.path
import urllib.request
import http.client
import urllib.parse
import cherrypy
from bs4 import BeautifulSoup
from Classes import *
from SqlControl import *
from datetime import date
import time
#--------------------------------------------------------------	

#Funcao de retorno de diretorio corrente de arquivo
def uGetFile(tFile):
    return os.path.join(os.path.dirname(__file__), tFile)

#Funcao que abre um arquivo em texto
def uReadFile(tFile):
    return open(uGetFile(tFile),'r').read()

# retorna html da busca
def RetornaHtmlBusca(tcSite,tcTipo,tCache):
    Ambientar()
    
    cUrl  = tcSite
    cTipo = tcTipo
    cRetorno = ''
    
    cHtml = AbreSite(cUrl,[cTipo],20,tCache)
        
    if cHtml:
        cRetorno=cRetorno+'<br>'+cHtml
    else:
        cRetorno='<ERROR>' #
                                           
    return cRetorno

#Abre todos os links do site
def AbreSite(tUrlOri,tTipos,tQuant,tCache):
    global gLinks,gOld,gUrl
    gUrl = tUrlOri

    if not tTipos:
        oTipos = ['img']
    else:
        oTipos = []
        for oT in tTipos:
            oTipos.append(oT)

    nX = 0
    cRetorno=''
    cCache = ''
    cTag   = ''
    # corrige possiveis erros na Url
    tUrlOri = CorrigiUrl("",tUrlOri)
    
     # cria a lista com as url que já foram
    gLinks = [tUrlOri]
    gOld   = [""]
    
    # so busca do cache se for uma continuacao de consulta, caso não seja deleta o cache
    if tCache=='CACHE':
        cRetorno,gLinks,gOld = BuscaCache()
    else:
        DeletaCache()
    
    # guarda o tempo de inicio mais um tempo de timeout
    nSeg  = 240
    oTime = time.localtime(time.time()+nSeg)
    nMin  = oTime.tm_min
    nSeg  = oTime.tm_sec
    nHor  = oTime.tm_hour
    
    while gLinks:
        cLink = gLinks.pop(0)
        
        # caso demore mais que 2 minutos, considera que achou tudo e retorna
        oTime  = time.localtime(time.time())
        if nSeg <= oTime.tm_sec and nMin <= oTime.tm_min and nHor <= oTime.tm_hour:
            return cRetorno
        
        # varre todos os tipos passados na lista
        while oTipos:
            cTipo = oTipos.pop(0)
            oConteudo = AbreUrl(cLink,cTipo)
            
            for oHtml in oConteudo:
                if cTipo == 'img':
                    cTag = 'src'
                else:
                    cTag = 'href'
                
                cCont = RetornoLink(tUrlOri,cTipo,oHtml)
                
                if oHtml.get(cTag) in gOld:
                    cCont = ''
                
                # se estourar o numero de requisição, grava o que falta e inclui no cache
                if nX>=tQuant:
                    cCache   = cCache   + cCont
                else:
                    # guarda o html
                    cRetorno = cRetorno + cCont

                if cCont:
                    nX=nX+1
                    # grava nos olds para não repetir
                    if oHtml.get(cTag) and oHtml.get(cTag)!=None:
                        gOld.append(oHtml.get(cTag))

            #grava na lista das old
            if cLink and cLink!=None:
                gOld.append(cLink)

            #grava o cache
            if nX>=tQuant:
                # busca mais link dentro da url
                gLinks = ListaUrl(tUrlOri,cLink,gLinks)
                GravaCache(gLinks,gOld,cCache)
                return cRetorno
        
        # retorna a lista de tipos
        for oT in tTipos:
            oTipos.append(oT)

        # busca mais link dentro da url
        gLinks = ListaUrl(tUrlOri,cLink,gLinks)

    return cRetorno

def ListaUrl(tUrlOrg,tUrl,gLinks):
    oHref = AbreUrl(tUrl,"a")
    
    # guarda todas as Urls da pagina
    for oA in oHref:
        cA = oA.get('href')

        if cA:
            # tenta corrigir possiveis erros da Url
            cUrl = CorrigiUrl(tUrlOrg,cA)
        else:
            cUrl = ''
        
        # verifica se a  Url ja foi listada
        if cUrl in gOld:
            cUrl = ''

        if cUrl and cUrl!=None:
            gLinks.append(cUrl)

    return gLinks

#Funcao que verifica e retorna o que foi pedido
def AbreUrl(tUrl,tTipo):
    if not tUrl:
        return ''
    
    tTipo = TrataTipo(tTipo)
    oHref = ''

    try:
        oResponse = urllib.request.urlopen(tUrl)
        oDocument = oResponse.read()
        oSoup     = BeautifulSoup(oDocument)
        oHref     = oSoup.findAll(tTipo) 
    except urllib.request.URLError:
        oHref = ''
    
    return oHref

def CorrigiUrl(tURL, tURL2):
    
    if not tURL2:
        return ''

    cURL  = tURL
    cURL2 = tURL2
    
    # confere se existe alguma vazia
    if not tURL or not tURL2:
        if tURL2[:7].upper() != 'HTTP://':
            tURL2 = 'http://' + tURL2
        return tURL2

    # se for igual, então é a pagina inicial novamente
    if tURL == tURL2:
        return ''
    
    # se for um link a mesma pagina (como uma simples movimentação) então ignora
    if tURL2[:1].upper() == "#":
        return ''
    
    # se não existir http:// adiciona
    if cURL[:7].upper() != 'HTTP://' and cURL[:8].upper() != 'HTTPS://':
       cURL  = 'http://' + cURL

    # confere se é http ou https
    nHttp = 0
    if cURL[:7].upper() == 'HTTP://':
        nHttp = len('HTTP://')
    if cURL[:8].upper() == 'HTTPS://':
        nHttp = len('HTTPS://')
    nHttp2 = 0
    if cURL2[:7].upper() == 'HTTP://':
        nHttp2 = len('HTTP://')
    if cURL2[:8].upper() == 'HTTPS://':
        nHttp2 = len('HTTPS://')

    # pega a raiz do link
    cAuxURL  = cURL[nHttp:] #separa inicio das URLs para comparacao
    cAuxURL2 = cURL2[nHttp2:]
    
    if (cAuxURL+'/').index('/')==len(cAuxURL):
        cAuxURL = cAuxURL+'/'
    
    if (cAuxURL2+'/').index('/')==len(cAuxURL2):
        cAuxURL2 = cAuxURL2+'/'

    # se o link não for do mesmo site ele é ignorado
    if (not cAuxURL == cAuxURL2[:cAuxURL2.index('/')+1]) and (tURL2[:nHttp2].upper() == 'HTTP://' or tURL2[:nHttp2].upper() == 'HTTPS://'):
        return ''

    if (tURL2[:nHttp2].upper() == 'HTTP://' or tURL2[:nHttp2].upper() == 'HTTPS://'):
        return cURL2

    cAuxURL = cAuxURL[:cAuxURL.index('/')]

    cAuxURL = "HTTP://"+cAuxURL
    
    if cURL2[:1] == '/':
        cURL2 = cURL2[1:]
        
    if cAuxURL[:-1] == "/":
        cRetURL = cAuxURL + cURL2[nHttp2:]
    else:
        cRetURL = cAuxURL + '/' + cURL2[nHttp2:]

    return cRetURL

def RetornoLink(tUrl,tcTipo,toHtml):
    cRetorno = str(toHtml)
    cTipo = ''
    
    if tcTipo == 'files' or tcTipo == 'lnk':
        cTipo = 'href'

    if tcTipo == 'img':
        cTipo = 'src'

    # faz a correcao do caminho, adicionando a url completo
    cUrl       = str(toHtml.get(cTipo))
    cCorrigido = cUrl

    # se for um link esterno ou nao tiver vazio, tenta corrigir a url
    if not cCorrigido[:7].upper() == 'HTTP://' and cCorrigido and not tcTipo == 'lnk':
        cCorrigido = CorrigiUrl(tUrl,cCorrigido)
        cRetorno = cRetorno.replace(cUrl,cCorrigido)

    if tcTipo == 'lnk' and cCorrigido:
        cCorrigido = CorrigiUrl(tUrl,cCorrigido)
        cRetorno   = cRetorno.replace(cUrl,cCorrigido)
        
        cA    = foo(cRetorno,'>','</a>')
        cUrl  = foo(cA,'src="','"')
        cCorrigido = cUrl
        
        if cCorrigido:
            cCorrigido = CorrigiUrl(tUrl,cCorrigido)
            cRetorno   = cRetorno.replace(cUrl,cCorrigido)

    # filtra as extenções proibidas para os links
    if tcTipo == 'lnk':
        lTipos = sys.app.FileList

        cEXT = os.path.splitext(cCorrigido)[1]
        cEXT = cEXT.upper()

        if cEXT in lTipos:
            cRetorno = ""
    
    # filtra as extenções permitidas para arquivos
    if tcTipo == 'files':
        lTipos = sys.app.FileList

        cEXT = os.path.splitext(cCorrigido)[1]
        cEXT = cEXT.upper()

        if not cEXT in lTipos:
            cRetorno = ""

    # filtra as extenções permitidas para imagens
    if tcTipo == 'img':
        lTipos = sys.app.ImgList
        
        cEXT = os.path.splitext(cCorrigido)[1]
        cEXT = cEXT.upper()

        if not cEXT in lTipos:
            cRetorno = ""
            
    if cRetorno:
        cRetorno = cRetorno+"|"
    
    return cRetorno

def TrataTipo(tcTipo):
    cTipo = tcTipo
    if cTipo == 'files':
        cTipo = 'a'

    if cTipo == 'lnk':
        cTipo = 'a'

    return cTipo

def GravaCache(tLinks,tOlds,tcCache):
    lcLinks = '|'.join(c for c in tLinks)
    lcOlds = '|'.join(c for c in tOlds)

    oBuild = InsertBuilder()
    oBuild.cTabela = "Cache"
    oBuild.add("ip",cherrypy.request.remote.ip)
    oBuild.add("conteudo",tcCache)
    oBuild.add("links",lcLinks)
    oBuild.add("olds",lcOlds)

    oBuild.Execute()

def BuscaCache():
    gLinks   = []
    gOld     = []
    cRetorno = ''
   
    aCache = uSqlPesquisa("select conteudo,links,olds from cache where ip='"+cherrypy.request.remote.ip+"' order by id desc limit 1")
    
    if aCache:
        cLinks   = aCache[0][1]
        cOld     = aCache[0][2]
        cRetorno = aCache[0][0]

        gLinks = [c for c in  cLinks.split('|')]            
        gOld   = [c for c in  cOld.split('|')]

        DeletaCache()
        
    return cRetorno,gLinks,gOld

def DeletaCache():
    oBuild = DeleteBuilder()
    oBuild.cTabela = 'cache'
    oBuild.cCondicao="ip='"+cherrypy.request.remote.ip+"'"
    oBuild.Execute()

def ZeraCache():
    oBuild = DeleteBuilder()
    oBuild.cTabela = 'cache'
    oBuild.Execute()

def TratarRetornoHtml(tcHtml,tcTipo):

    if (tcHtml=='<ERROR>'):
        return '' #<br><div><font color=red>No Results...</font></div><br/>

    tcHtml=tcHtml[:-1]
    cRetorno  = ''
    cAux      = ''
    lnCount = 0

    cLNK='''<tr>
              <td>[FILE]</td>
              <td>[NAME]</td>
              <td> <a href="[LINK]" target="_blank">[LINK]</a></td>
            </tr>'''


    cIMG='<a class="gridimg" href="[LNKIMAGE]">[IMAGE]</a>'


    lTags = [c for c in tcHtml.split('|')]

    for coisa in lTags:

        if coisa:
            coisa = coisa.replace("'",'"')

            if(tcTipo=='img'):
                lnCount = lnCount + 1
                
                if(lnCount==1):
                    cRetorno = cRetorno + '<div>'

                cAux = cIMG
                
                cSrc = foo(coisa.lower(),'src="','"')
                cAux = cAux.replace('[LNKIMAGE]',cSrc)
                cAux = cAux.replace('[IMAGE]', coisa)

                cRetorno = cRetorno + cAux

                if(lnCount==4):
                    cRetorno = cRetorno + '</div><br />'
                    lnCount  = 0


            if(tcTipo=='lnk'):
                cAux = cLNK

                cA    = foo(coisa.lower(),'>','</a>')
                cHref = foo(coisa.lower(),'href="','"')
                cAux  = cAux.replace('[NAME]', cA)
                cAux  = cAux.replace('[LINK]', cHref)
                cAux  = cAux.replace('[FILE]', ' - ')
                cRetorno = cRetorno+chr(13)+cAux

            if(tcTipo=='files'):
                cAux = cLNK
                cA    = foo(coisa.lower(),'>','</a>')
                cHref = foo(coisa.lower(),'href="','"')
                cAux  = cAux.replace('[NAME]', cA)
                cAux  = cAux.replace('[LINK]', cHref)

                cEXT=os.path.splitext(cHref)[1]
                cEXT = cEXT.upper()
                
                cFILEARQ = ''
                for ee in sys.app.FileList:
                    if (ee in cEXT):
                        cFILEARQ="<img src='../IMAGES/FILES/"+ee.replace('.','')+".png' style='width:50px; height:auto;border: none; min-width:50px;' />"
                cAux  = cAux.replace('[FILE]', cFILEARQ)
                cRetorno = cRetorno+chr(13)+cAux
            
    if(lnCount!=0 and tcTipo=='img'):
        cRetorno = cRetorno + '</div><br />'

    return cRetorno;

def foo(s, leader, trailer):
    cStr = s+leader
    if cStr.index(leader) >= len(s):
        return ""

    end_of_leader = s.index(leader) + len(leader)

    cStr = s+trailer
    if cStr.index(trailer) >= len(s):
        return ""
    
    start_of_trailer = s.index(trailer, end_of_leader)
    return s[end_of_leader:start_of_trailer]
