* CLASSE SQL MANIPULAÇÃO DE BANCO

Define Class Sql as Custom
	
	* Definicndo parametros de conexao
	Handle 			= 0
	ConnectionId 	= ''	
	DataBaseDriver 	= 'SQL SERVER'
	Command			= Null
	Select			= Null
	Insert			= Null
	Update			= Null
	Delete			= Null
	
	Proc Init
	*********
		
		* Create a cursor of system connections.
		Create Cursor tmpSysConnections(;
			IdConnection 		Char(3),;
			ConnectionString 	Char(120),;
			Driver				Char(100),;
			Default 			Number(1),;
			Connected			Number(1),;
			Handle 				Integer;
		) 
		
		* Sql Objects
		this.Select 	= System.CreateObject('select')
		this.Insert 	= System.CreateObject('insert')
		this.Update		= System.CreateObject('update')
		this.Delete 	= System.CreateObject('delete')
		this.Command 	= System.CreateObject('command')
		
	EndProc	
	
	Proc AddConnection(tcConnectionString as String, tcConnectionId as String, tnDefault as Integer) as Boolean;
	HelpString 'Add a Connection to a system cursor connections.'
	*************************************************************
		
		Sele tmpSysConnections
		Append Blank 
		
		Replace IdConnection 		with tcConnectionId ,;
				ConnectionString 	with tcConnectionString,;
				Driver 				with StrExtract(Upper(tcConnectionString),'DRIVER=',';',1)
		
		* Set default connection.
		If tnDefault = 1
			this.SetDefaultConnection(tcConnectionId)
		EndIf
	EndProc
	
	Proc Connect(tcConnectionId) as Boolean;
	HelpString 'Connect to a database.'
	***********************************
	
		Local llReturn as Boolean
		Local lnSqlOk as Integer
		Store .F. to llReturn
		Store 0 to lnSqlOk 

		* Validating parameters
		If Type('tcConnectionId') <> 'C'
			tcConnectionId = ''
		EndIf

		* Localizing connection.
		If Not Empty(tcConnectionId)
			Sele tmpSysConnections
			Seek tcConnectionId
		EndIf

		* Connection found.
		If Found()
			lnSqlOk=SqlStringConnect(tmpSysConnections.ConnectionString)

			* Connection ok.
			If lnSqlOk> 0 
				llReturn = .T.
				Sele tmpSysConnections
				Replace Handle 		with lnSqlOk,;
						Connected	with 1
				
				* Default connection saved in Sql object.
				If tmpSysConnections.Default=1
					this.Handle 		= lnSqlOk
					this.ConnectionId 	= tcConnectionId 
				EndIf
			EndIf
		EndIf
		Return(llReturn)
	EndProc

	Proc Disconnect(tcConnectionId) as Boolean;
	HelpString 'Disconnect to from database.'
	*****************************************
	
		Local llReturn as Boolean
		Store .F. to llReturn

		* Validating parameters
		If Type('tcConnectionId') <> 'C'
			tcConnectionId = ''
		EndIf

		* Localizing connection.
		If Not Empty(tcConnectionId)
			Sele tmpSysConnections
			Seek tcConnectionId
		EndIf

		* Connection found.
		If Found()
			* Disconnect from a database.
			=SqlDisconnect(tmpSysConnections.Handle)
			llReturn = .T.
			Sele tmpSysConnections
			Replace Handle 		with 0,;
					Connected	with 0

			* Default connection cleared in Sql object.
			If tmpSysConnections.Default=1
				this.Handle 		= 0
				this.ConnectionId 	= ''
			EndIf
		EndIf
		Return(llReturn)
	EndProc

	Proc CloseAllConnections as Boolean;
	HelpString 'Disconnect to from all databases.'
	**********************************************
		Sele tmpSysConnections
		Go Top
		Scan While Not Eof()
			If tmpSysConnections.Connected = 1
				Try
					=SqlDisconnect(tmpSysConnections.Handle)
				Catch
				EndTry
			EndIf
		EndScan
	EndProc
	
	Proc GetHandle(tcConnectionId as String) as Integer;
	HelpString 'Return a connection handle.'
	****************************************
		Local lnReturn as Integer
		Store 0 to lnReturn
		
		* Validating parameters
		If Type('tcConnectionId') <> 'C'
			tcConnectionId = ''
		EndIf

		* Localizing connection.
		If Not Empty(tcConnectionId)
			Sele tmpSysconnections
			Seek tcConnectionId
		EndIf

		* Connection found.
		If Found()
			lnReturn = tmpSysConnections.Handle
		EndIf
		
		Return(lnReturn)
	EndProc
	
	Proc SetDefaultConnection(tcConnectionId as String) as Boolean;
	HelpString 'Set connection as default connection of the system.'
	****************************************************************
		
		* Localizing connection.
		If Not Empty(tcConnectionId)
			Sele tmpSysConnections
			Seek tcConnectionId
		EndIf
		
		* Connection found.
		If Found()
			Sele tmpSysConnections
			Replace Default with 1 
			
			* Cleaning other connections.
			Replace Default with 0 For IdConnection <> tcConnectionId
			
			* Configuring handle in Sql Object
			this.Handle 		= tmpSysconnections.Handle
			this.ConnectionId 	= tcConnectionId
		EndIf
	EndProc
	
	Proc SetSelectParameter(tnParameter as Integer, tuValue as Variant) as Boolean; 
	HelpString 'Set Sql select parameter.'
	**************************************
		this.SetSqlParameter(tnParameter,'Select',tuValue)
	EndProc

	Proc SetInsertParameter(tnParameter as Integer, tuValue as Variant) as Boolean; 
	HelpString 'Set Sql insert parameter.'
	**************************************
		this.SetSqlParameter(tnParameter,'Insert',tuValue)
	EndProc

	Proc SetUpdateParameter(tnParameter as Integer, tuValue as Variant) as Boolean; 
	HelpString 'Set Sql update parameter.'
	**************************************
		this.SetSqlParameter(tnParameter,'Update',tuValue)
	EndProc

	Proc SetDeleteParameter(tnParameter as Integer, tuValue as Variant) as Boolean; 
	HelpString 'Set Sql delete parameter.'
	**************************************
		this.SetSqlParameter(tnParameter,'Delete',tuValue)
	EndProc

	Proc SetCommandParameter(tnParameter as Integer, tuValue as Variant) as Boolean; 
	HelpString 'Set Sql command parameter.'
	**************************************
		this.SetSqlParameter(tnParameter,'Command',tuValue)
	EndProc

	Proc SetSqlParameter(tnParameter as Integer,tcObject as String, tuValue as Variant) as Boolean; 
	HelpString 'Set Sql parameter.'
	**************************************
		Local lcParam as String
		lcParam = 'this.'+tcObject+'.Parameter'+AllTrim(Str(tnParameter))
		&lcParam = tuValue
	EndProc
	
	Proc ExecuteQuery(tcCommand as String, tcCursor as String,tcConnectionId as String) as Boolean; 
	HelpString 'Load registers from a database.'
	********************************************

		Local lnSqlOk as Integer

		Sql.Select.Command 	= tcCommand
		Sql.Select.Cursor 	= tcCursor
		lnSqlOk = Sql.Select.Execute()
		
		* Error in command
		If lnSqlOk<0
			AError(la)	
			Comuns.Message('Error in SQL query.'+chr(13)+'Query copied to clipboard.'+Chr(13)+la[1,2])
			_Cliptext = tcCommand
			Return(.F.)
		EndIf
		Return(.T.)
	EndProc

	Proc ExecuteInsert(tcTable as String, tcConfiguration as String) as Variant;
	HelpString 'Insert a register from a cursor into system database.'
	******************************************************************

		If Type('tcTable')<>'C'
			Comuns.Message('No table configured for insert.')
			Return(.F.)
		EndIf
		
		If Empty(Alias())
			Comuns.Message('No alias configured for insert.')
			Return(.F.)
		EndIf

		If Type('tcConfiguration')<>'C'
			tcConfiguration = ''
		EndIf
		
		tcConfiguration	 	= Upper(AllTrim(tcConfiguration))
		tcTable				= Lower(AllTrim(tcTable))		
		
		Local lcCommand, lcFields, lcValues, lcAlias, lcField, lcNoUse as String
		Local lnFields, lnXi, lnIDInserted as Integer
		Store '' to lcCommand, lcFields, lcValues, lcAlias
		Store '#PK_ID#' to lcNoUse
		Store Alias() to lcAlias
		Dimension laFields[1]
		
		* Verifying configuration
		If 'USE PK_ID' $ tcConfiguration 
			lcNoUse = StrTran(lcNoUse,'PK_ID','')
		EndIf
		
		If '<NOUSE>' $ tcConfiguration 
			lcNoUse = lcNoUse + StrExtract(tcConfiguration,'<NOUSE>','</NOUSE>')
		EndIf

		Sele (lcAlias) 
		lnFields = AFields(laFields,lcAlias)
		
		* Start insert command (Fields)
		For lnXi = 1 to lnFields 
			lcField 	= AllTrim(Lower(laFields[lnXi,1])) 
			
			* Don't use field
			If '#'+Upper(lcField)+'#' $ lcNoUse
				Loop
			EndIf

			lcFields 	= lcFields + lcField+','
			lcValues 	= lcValues + '<<p'+AllTrim(Str(lnXi))+'>>'+','

			Sql.SetInsertParameter(lnXi,&lcField)
		EndFor
		lcFields = IIf(Right(lcFields,1)=',',SubStr(lcFields,1,Len(lcFields)-1),lcFields)
		lcValues = IIf(Right(lcValues,1)=',',SubStr(lcValues,1,Len(lcValues)-1),lcValues)
		lcCommand = 'insert into '+tcTable+' ('+lcFields+') values ('+lcValues+')'		

		* Execute command
		Sql.Insert.Command = lcCommand
		lnSqlOk = Sql.Insert.Execute()
		
		* Error in command
		If lnSqlOk<0
			AError(la)		
			Comuns.Message('Error in SQL insert.'+chr(13)+'Insert copied to clipboard.'+Chr(13)+la[1,2])
			_Cliptext = lcCommand
			Return(.F.)
		EndIf
		
		* Getting last ID inserted.
		lnIDInserted = Sql.GetLastIDInsert()
		
		Sele (lcAlias) 
		Replace pk_id with lnIDInserted 
		Return(lnIDInserted)
	EndProc
	
	Proc ExecuteUpdate(tcTable as String, tcConfiguration as String);
	HelpString 'Update a register from a cursor into system database.'
	******************************************************************
	
		If Type('tcTable')<>'C'
			Comuns.Message('No table configured for update.')
			Return(.F.)
		EndIf
		
		If Empty(Alias())
			Comuns.Message('No alias configured for update.')
			Return(.F.)
		EndIf

		If Type('tcConfiguration')<>'C'
			tcConfiguration = ''
		EndIf
		
		tcConfiguration		= Upper(AllTrim(tcConfiguration))
		tcTable				= Lower(AllTrim(tcTable))
		
		Local lcCommand, lcFields, lcValues, lcAlias, lcField, lcNoUse as String
		Local lnFields, lnXi, lnIDInserted as Integer
		Store '' to lcCommand, lcFields, lcValues, lcAlias
		Store '#PK_ID#' to lcNoUse
		Store Alias() to lcAlias
		Dimension laFields[1]
		
		* Verifying configuration
		If 'USE PK_ID' $ tcConfiguration 
			lcNoUse = StrTran(lcNoUse,'PK_ID','')
		EndIf
		
		If '<NOUSE>' $ tcConfiguration 
			lcNoUse = lcNoUse + StrExtract(tcConfiguration,'<NOUSE>','</NOUSE>')
		EndIf

		Sele (lcAlias) 
		lnFields = AFields(laFields,lcAlias)
		
		* Start update command (Fields)
		lcCommand = 'update '+tcTable+' set '
		
		* Building fields in command
		For lnXi = 1 to lnFields 
			lcField = AllTrim(Lower(laFields[lnXi,1]))

 			* Don't use field
			If '#'+Upper(lcField)+'#' $ lcNoUse
				Loop
			EndIf

 			lcCommand = lcCommand + lcField+'='+'<<p'+AllTrim(Str(lnXi))+'>>'+','
			Sql.SetUpdateParameter(lnXi,&lcField)
		EndFor
		lcCommand = IIf(Right(lcCommand ,1)=',',SubStr(lcCommand ,1,Len(lcCommand )-1),lcCommand)
		
		* Build where for the update
		lcCommand = lcCommand + ' where pk_id = <<p'+AllTrim(Str(lnFields+1))+'>>'
		Sql.SetUpdateParameter(lnFields+1,pk_id)
		
		* Execute command
		Sql.Update.Command = lcCommand

		lnSqlOk = Sql.Update.Execute()
		
		* Error in command
		If lnSqlOk<0
			AError(la)
			Comuns.Message('Error in SQL update.'+chr(13)+'Update copied to clipboard.'+Chr(13)+la[1,2])
			_Cliptext = lcCommand
			Return(.F.)
		EndIf
		
		Return(pk_id)
	EndProc
	
	Proc ExecuteDelete(tcTable as String, tcConfiguration as String);
	HelpString 'Delete a register from a cursor into system database.'
	******************************************************************
		If Type('tcTable')<>'C'
			Comuns.Message('No table configured for delete.')
			Return(.F.)
		EndIf
		
		If Empty(Alias())
			Comuns.Message('No alias configured for delete.')
			Return(.F.)
		EndIf

		If Type('tcConfiguration')<>'C'
			tcConfiguration = ''
		EndIf
		
		tcConfiguration		= Upper(AllTrim(tcConfiguration))
		tcTable				= Lower(AllTrim(tcTable))
		
		Local lcCommand, lcAlias, lcNoUse as String
		Local luID as Variant
		Store '' to lcCommand, lcAlias
		Store '#PK_ID#' to lcNoUse
		Store Alias() to lcAlias
		
		* Verifying configuration
*!*			If 'USE PK_ID' $ tcConfiguration 
*!*				lcNoUse = StrTran(lcNoUse,'PK_ID','')
*!*			EndIf
		
		* Start delete command 
		lcCommand = 'delete from '+tcTable
		
		* Build where for the update
		lcCommand = lcCommand + ' where pk_id = <<p1>>'
		Sql.SetDeleteParameter(1,pk_id)
		
		* Execute command
		Sql.Delete.Command = lcCommand

		lnSqlOk = Sql.Delete.Execute()
		
		* Error in command
		If lnSqlOk<0
			AError(la)
			Comuns.Message('Error in SQL delete.'+chr(13)+'Delete copied to clipboard.'+Chr(13)+la[1,2])
			_Cliptext = lcCommand
			Return(.F.)
		EndIf
		
		luId = pk_id
		
		* Deleting register from the cursor
		Delete

		Return(luId)
	EndProc

	Proc ExecuteCommand(tcCommand as String, tcConnectionId as String) as Boolean; 
	HelpString 'Load registers from a database.'
	********************************************

		Local lnSqlOk as Integer

		Sql.Command.Command 	= tcCommand
		lnSqlOk = Sql.Command.Execute()
		
		* Error in command
		If lnSqlOk<0
			Comuns.Message('Error in SQL command.'+chr(13)+'Query copied to clipboard.')
			_Cliptext = tcCommand
			Return(.F.)
		EndIf
		Return(.T.)
	EndProc

	Proc GetLastIDInsert() as Variant; 
	HelpString 'Return last insert ID.'
	********************************************
		Local luRet as Variant
		Sql.ExecuteQuery('select @@identity as lastinsert','tmpLastIDInserted')
		luRet = lastinsert
		Use in tmpLastIDInserted
		Return(luRet)
	EndProc


EndDefine

* Select Class : Manage queries execution
Define Class Select as SqlObject
	Proc meInit
	***********
		this.SqlParameters = 20
	EndProc
EndDefine


* Insert Class : Manage inserts
Define Class Insert as SqlObject
	Proc meInit
	***********
		this.SqlParameters = 50
	EndProc		
EndDefine

* Update Class : Manage updates
Define Class Update as SqlObject
	Proc meInit
	***********
		this.SqlParameters = 50
	EndProc	
EndDefine

* Delete Class : Manage deletes
Define Class Delete as SqlObject
	Proc meInit
	***********
		this.SqlParameters = 5
	EndProc	
EndDefine

* Manage commands
Define Class Command as SqlObject
	Proc meInit
	***********
		this.SqlParameters = 50
	EndProc	
EndDefine


* SqlObject Class : Generic Sql class
Define Class SqlObject as Custom
	Command			= ""
	Cursor			= ""	
	SqlParameters	= 50

	Proc Init
	*********
		this.meInit()
		this.CreateParameters()
	EndProc
	
	Proc meInit
	***********
	EndProc	

	Proc Execute as Integer;
	HelpString 'Execute command.'
	*****************************
		
		* Replacing parameters.
		this.ReplaceParameters()
 
		Local lnSqlOk as Integer
		lnSqlOk=SqlExec(Sql.Handle,this.Command,this.Cursor)
				
		* Clear parameters.
		this.ClearParameters()	
		this.Command = ""
		this.Cursor = ""
		Return(lnSqlOk)
	EndProc
	
	Proc CreateParameters as Boolean;	
	HelpString 'Create Sql Parameters.'
	***********************************

		Local i as Integer
		* Create Sql Parameters.
		For i = 1 to this.SqlParameters
			this.AddProperty('Parameter'+AllTrim(Str(i)),"")
		EndFor
	EndProc	
	
	Proc ReplaceParameters as Boolean;
	HelpString 'Execute query command.'
	***********************************
		
		Local i as Integer
		Local lcParam as String
		
		* Replace paraters in command.
		For i = 1 to this.SqlParameters
			lcParam = '?Sql.'+this.Class+'.Parameter'+AllTrim(Str(i))
			this.Command=StrTran( this.Command,'<<p'+AllTrim(Str(i))+'>>',lcParam )
		EndFor
	EndProc	

	Proc ClearParameters as Boolean;
	HelpString 'Clear object parameters.'
	*************************************
		
		Local i as Integer
		Local lcParam as String
		 
		* Replace paraters in command.
		For i = 1 to this.SqlParameters
			lcParam = 'Sql.'+this.Class+'.Parameter'+AllTrim(Str(i))
			&lcParam = ""
		EndFor
	EndProc	
EndDefine	