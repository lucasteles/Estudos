* Function class : System programmers functions

Define Class Function as Custom

	Proc Message(tcMessage as String, tnFlags as Integer) as Boolean;
	HelpString 'Message to system users.'	
	*************************************
	
		* Validating parameters.
		If Type('tnFlags')<>'N'
			tnFlags=64
		EndIf
		=MessageBox(tcMessage, 'Alert!', tnFlags)
	EndProc
	
	Proc YesNoMessage(tcMessage as String, tcTitle as String, tnDefault as Integer) as Boolean;
	HelpString 'Yes or No message to system users.'	
	***********************************************
		Local lnButton as Number
		If tnDefault =1
			lnButton = 0
		Else
			lnButton = 256
		EndIf
		If MessageBox(tcMessage, tcTitle, 32+4+lnButton)=6
			Return .T.
		EndIf
		Return(.F.)
	EndProc
	
	Proc TempFile(tcExtension as String) as String;
	HelpString 'Create a tempfile.'	
	*******************************
		
		* Validating parameters.
		If Type('tcExtension ')<>'C'
			tcExtension = 'Tmp'
		EndIf
		
		Return(ForceExt(System.TempPath+Sys(2015),tcExtension))
	EndProc	

	Proc StrZero(tuValue as Variant, tnLen) as String;
	HelpString 'Create a tempfile.'	
	*******************************
		
		If Type('tuValue')='C'
			tuValue = Int(Val(tuValue))
		EndIf
		
		Return(StrTran(Str(tuValue,tnLen),' ','0'))
	EndProc

	Proc ValidateRequired(toObj as Object) as Logical;
	HelpString 'Validate required fields.'	
	*******************************
	
		If Type('toObj')<>'O'
			Return(.T.)
		EndIf

		Local loObj as Object
		Local llError, llMessage as Logical
		STORE .F. to llMessage
		
		For each loObj in toObj.Controls
			llMessage = .F.
			* Verifyng required fields inside pages of pageframe
			If Upper(loObj.BaseClass) $ 'PAGEFRAME'
				For Each loPage in loObj.Pages
					llError = comuns.ValidateRequired(loPage)
					If llError
						Exit
					EndIf
				EndFor
			EndIf
			
			* Verifying required fields inside containers
			If Upper(loObj.BaseClass) $ 'CONTAINER'
				llError = comuns.ValidateRequired(loObj)
			EndIf
			
			* Treatment of required fields
			If Upper(loObj.BaseClass) $ 'TEXTBOXEDITBOXSPINNER'
				If loObj.RequiredField = .T. and loObj.Enabled
					If Type('loObj.Value')='C'
						loObj.Value = StrTran(loObj.Value,"'",'')
					EndIf
					
					* Empty value
					If Empty(loObj.Value)
						llMessage = .T.
					EndIf
				EndIf
			EndIf

			* Treatment of required fields (combobox)
			If Upper(loObj.BaseClass) $ 'COMBOBOX'
				If loObj.RequiredField = .T. and loObj.Enabled
					If Type('loObj.Value')='C'	
						loObj.Value = StrTran(IIf(loObj.Style=0,loObj.Text,loObj.Value),"'",'')
					EndIf
					
					* Empty value
					If Empty(loObj.Value)
						llMessage = .T.
					EndIf
				EndIf
			EndIf
						
			* Treatment of required fields (listbox)
			If Upper(loObj.BaseClass) $ 'LISTBOX'
				If loObj.RequiredField = .T. and loObj.Enabled
					
					* Empty list
					If Empty(loObj.ListCount<=0)
						llMessage = .T.
					EndIf
				EndIf
			EndIf

			* Give message
			If llMessage
				* in pageframe objects
				If Upper(loObj.Parent.BaseClass) == 'PAGE'
					loObj.Parent.Parent.ActivePage = loObj.Parent.PageOrder
				EndIf
				
				comuns.Message('Campo obrigatório'+Chr(13)+;
									'Favor verifique o preenchimento e tente novamente')
				loObj.SetFocus()
				llErro = .T.
			EndIf
			
			* Stop process
			If llError
				Exit
			EndIf
		EndFor
	EndProc	
	
	*retorna icone de ? caso nao exista
	FUNC PutIcon(cIconFile as String) as String;
	HELPSTRING "Retorna local do icone"

	
		LOCAL cRetorno as String
		IF !file( System.IconPath + cIconFile ) 	
			cRetorno = System.ClassImagePath + 'unfind.png'
		ELSE
			cRetorno = System.IconPath + cIconFile 
		ENDIF
		
		RETURN cRetorno 
		
	ENDFUNC
	
	FUNC LoadPict(cImageFile as String) as String;
	HELPSTRING "Retorna local de imagem"

	
		LOCAL cRetorno as String
		IF file( System.ClassImagePath + cImageFile ) 	
			cRetorno = System.ClassImagePath + cImageFile
		ELSE
			cRetorno = System.ImagePath + cImageFile
		ENDIF
		
		IF ! FILE(cRetorno)
			cRetorno = System.ClassImagePath + 'unfind.png'
		ENDIF
		
		RETURN cRetorno 
		
	ENDFUNC
	
	Func Aspas(cString as String) as String;
	HELPSTRING "Retorna stringo concatenada com aspas"
	
		RETURN  "'"+ALLTRIM(cString)+"'"
		
	EndFunc
		
	Func Virg(cString as String) as String;
	HELPSTRING "Retorna string concatenada com virgulas"
	
		RETURN  ","+ALLTRIM(cString)+","
		
	EndFunc
	
	Func cINT(cString as String) as integer;
	Helpstring "Converte string para int"
	
		RETURN INT(VAL(cString))
		
	EndFunc
	
	Func Encriptar(cString as String,cChave as String) as String
	
		cString =IIF(VARTYPE(cString )='C',ALLTRIM(cString ),'')
		cChave  =IIF(VARTYPE(cChave  )='C',ALLTRIM(cChave  ),'')

		LOCAL lnCaracter, lnAscCadena, lnAscClave, lnAscEncript, lnClavePosicion, lcRetorno

		lnCaracter=0  		
		lnAscCadena=0 		
		lnAscClave=0		
		lnAscEncript=0		
		lnClavePosicion=1	
		lcRetorno=""		


		FOR lnCaracter=1 TO LEN(cString )
			
			lnAscCadena=ASC(SUBSTR(cString ,lnCaracter,1))
			lnAscClave=ASC(SUBSTR(cChave  ,lnClavePosicion,1))
			lnClavePosicion=IIF(lnClavePosicion=LEN(cChave  ),1,lnClavePosicion+1)
			lnAscEncript=lnAscClave+lnAscCadena
			lnAscEncript=IIF(lnAscEncript>255,lnAscEncript-255,lnAscEncript)
			lcRetorno=lcRetorno+CHR(lnAscEncript)
			
		ENDFOR 

		RETURN lcRetorno
		
	EndFunc
	
	Func Desencriptar(cString as String,cChave as String) as String
	
		cString =IIF(VARTYPE(cString )='C',ALLTRIM(cString ),'')
		cChave =IIF(VARTYPE(cChave )='C',ALLTRIM(cChave ),'')

		LOCAL lnCaracter, lnAscCadena, lnAscClave, lnAscEncript, lnClavePosicion, lcRetorno

		lnCaracter=0  		
		lnAscCadena=0 		
		lnAscClave=0		
		lnAscEncript=0		
		lnClavePosicion=1	
		lcRetorno=""	
			
		FOR lnCaracter=1 TO LEN(cString )
			
			lnAscCadena=ASC(SUBSTR(cString ,lnCaracter,1))
			lnAscClave=ASC(SUBSTR(cChave ,lnClavePosicion,1))
			lnClavePosicion=IIF(lnClavePosicion=LEN(cChave ),1,lnClavePosicion+1)		
			lnAscEncript=lnAscCadena-lnAscClave
			lnAscEncript=IIF(lnAscEncript<=0,lnAscEncript+255,lnAscEncript)
			lcRetorno=lcRetorno+CHR(lnAscEncript)
			
		ENDFOR 

		RETURN lcRetorno
			
	ENDFUNC
	
	
	
EndDefine


	