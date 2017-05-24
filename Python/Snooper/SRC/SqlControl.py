import sqlite3 as sql
from System import *
from Functions import *


#Funcao que conecta no arquivo de sqlite
def uSqlConnect():
    return sql.connect(sys.app.cDbFile)

#Funcao dde execução de comando 
def uSqlExecute(cComando):
	Conn = uSqlConnect()
	RS = Conn.cursor()
	RS.execute(cComando)
	Conn.commit()
	RS.close()
	Conn.close()


#Funcao dde execução de consulta
def uSqlPesquisa(cComando):
	Conn = uSqlConnect()
	RS = Conn.cursor()
	RS.execute(cComando)
	aRetorno = RS.fetchall()
	RS.close()
	Conn.close()
	return aRetorno

#classes de auxilio
class InsertBuilder:
	def __init__(self):
		self.aCampos=[]
		self.cTabela=''

	def add(self,cField,cValue):
		self.aCampos.append([cField,cValue])
		
	def Command(self):
		cFields,cValues = '',''
		for Campo in self.aCampos:
			cFields += Campo[0]+','
			cValues += "'"+Campo[1].replace("'",'"')+"',"

		cFields=cFields[0:-1]
		cValues=cValues[0:-1]

		cComando = 'insert into '+self.cTabela+'('+cFields+') values('+cValues+')'
		

		return cComando

	def new(self):
		self.aCampos=[]

	def Execute(self):
		uSqlExecute( self.Command() )
		self.new()

class DeleteBuilder:
	def __init__(self):
		self.cTabela=''
		self.cCondicao=''

	def Command(self):
		if not self.cCondicao:
			cComando = 'delete from '+self.cTabela
		else:
			cComando = 'delete from '+self.cTabela+" where "+self.cCondicao

		return cComando

	def Execute(self):
		uSqlExecute( self.Command() )

