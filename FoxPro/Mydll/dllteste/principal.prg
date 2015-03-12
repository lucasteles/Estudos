PUBLIC  v1 as Integer

DEFINE CLASS Lucasteste AS Session OLEPUBLIC

	*<PROPRIEDADE V1>
		v1=0
		PROC v1_access()  as Integer 
			MESSAGEBOX('acesso')
			RETURN this.v1	
		ENDPROC
		
		PROC v1_assign(vNewVal)
			MESSAGEBOX('altero')
			this.v1=vNewVal
		ENDPROC
	*</PROPREDADE>
	
	PROC INIT
		CLEAR PROGRAM
	ENDPROC
	
	PROC TESTE
		DO form teste
	ENDPROC
	
	PROC DESTROY
		CLEAR PROGRAM
		RELEASE ALL
		CLOSE ALL
		CANCEL
		QUIT
	ENDPROC
	
	PROC msg(LCteste as String) as String
		MESSAGEBOX(LCteste)
	ENDPROC
ENDDEFINE