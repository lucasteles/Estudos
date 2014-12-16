# Pilha
class Pilha:
    oRaiz = None

    def __init__(self):
        self.oRaiz = None

    def AddConteudo(self, tConteudo):
        if self.oRaiz == None:
            self.oRaiz = No(tConteudo)
        else:
            oNo = No(tConteudo)
            oNo.AddNo(self.oRaiz)
            self.oRaiz = oNo

    def Remove(self):
        oRetorno = self.oRaiz
        if oRetorno:
            self.oRaiz = self.oRaiz.oProximo

            return oRetorno.cConteudo
	    
    def Buscar(self, tConteudo):
        oAux = self.oRaiz

        while oAux!=None:
            if oAux.cConteudo==tConteudo:
                return True
            else:
                oAux = self.oRaiz.oProximo
		
        return False
    def Vazio(self):
        return self.oRaiz==None

class No:
    oProximo  = None
    cConteudo = ""
    # Construtor
    def __init__(self, tConteudo):
        self.oProximo = None
        self.cConteudo = tConteudo

    def AddNo(self,tNo):
        self.oProximo = tNo
