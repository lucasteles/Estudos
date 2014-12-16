Attribute VB_Name = "FUNCTIONS"
''''''''''''''''''''''''''''''
'''FUNCTIOS BY LUCAS TELES''''
'''''''''''V. 1.4'''''''''''''
''''''''''''''''''''''''''''''

''''''''''''''''''''''''''''''
''' INCLUIR NOS OBJECT.TAG  ''
''''''''''''''''''''''''''''''
'''"O"=OBRIGATORIO/'''
'''"S"=SALVAR ( OS NAME DO OBJETOS DEVEM SEGUIR O PADRAO xxxDATABASEFIELD/
'''"N"=MAO DESATIVA A MASKARA
'''"+" = AO POE ASPAS NO SALVAR
'''"FD" =FORMATA SALVAR COMO DATA DO FOX PRO
'''"PK"=CHAVE PRIMARIA DA TABELA PRINCIPAL DO FORM A QUE NAO PODE SE REPETIR/
'''"M(INDEX<FIELD>)"=INDICA OS CAMPOS QUE DEVEM SER EXIBIDOS ONDE "FIELD" CORRESPONDE AO NOME DO CAMPO
    'E O  PARAMETRO INDEX INDICA O TAGINDEX USADO NA HORA QUE FOI CHAMADA A FUNÇAO, E UMA FORMA DE DIFERENCIAR
    'BUSCAS SEM HAVER PROBLEMAS

    
Public CONECTA As New ADODB.Connection
Public tabelas As New ADODB.RECORDSET

Dim X As Long
Dim Y As Long

Public Enum listrado
    vbListradoYes = 1
    vbListradoNo = 0
End Enum

Public Enum MsgYesNo
    vbMsgYes = 1
    vbMsgNo = 0
End Enum

Function BANCO()
    CONECTA.Open "provider=microsoft.jet.oledb.4.0  ; Data source=" & App.Path & "\vendas.mdb"
    
    'CONECTA.Open "Provider=SQLNCLI; " & _
                  "Initial Catalog=funcs teste; " & _
                  "Data Source=(local)\SQLEXPRESS; " & _
                  "integrated security=SSPI; persist security info=True;"

 'CONECTA.Open "Provider=Microsoft.SQLSERVER.CE.OLEDB.3.5; Data Source=" & App.Path & "\VENDAS.SDF"  '; Persist Security Info=FALSE;"

'CONECTA.Open "Provider=vfpoledb;Data Source=" & App.Path & "\FDB\VENDAS.dbc;Collating Sequence=machine;"
 
 'CONECTA.ConnectionString = "DRIVER=SQL SERVER;SERVER=BATCAVERNA\SQLEXPRESS;UID=;PWD=;DATABASE=funcs teste;"
 'CONECTA.Open
End Function


Function RBYF(RECORDSET As ADODB.RECORDSET, INDEXCOLUNM As Variant)
    On Error GoTo TRATAR
    RBYF = IIf(IsNull(RECORDSET.FIELDS(INDEXCOLUNM)), Empty, RECORDSET.FIELDS(INDEXCOLUNM))
   Exit Function
TRATAR:
    RBYF = "ERROR"
End Function

Function LIMPAR(loFORM As Object)
    Call Desativar(loFORM)
    Dim loLIMPA As Object
    For Each loLIMPA In loFORM
        If TypeOf loLIMPA Is TextBox Then
            loLIMPA = Clear
        ElseIf TypeOf loLIMPA Is CheckBox Then
            loLIMPA = 0
        ElseIf TypeOf loLIMPA Is OptionButton Then
            loLIMPA = False
        ElseIf TypeOf loLIMPA Is MaskEdBox Then
            loLIMPA.PromptInclude = False
            loLIMPA = Clear
            loLIMPA.PromptInclude = True
        End If
    Next
    Call Ativar(loFORM)
End Function

Function Cobj(loFORM As Object, objName As String) As Object
    Dim PROC As Object
    For Each PROC In loFORM
        If PROC.Name = objName Then
            Set Cobj = PROC
            Exit For
        End If
    Next
        
End Function

   
Function STREXTRACT(lcSTRING As String, lcINIT As String, lcFIM As String, Optional lnOCORRENCIA As Integer = 1) As String
    Dim lnCONT As Integer
    Dim lnSTRING As Integer
    Dim lnINIT As Integer
    Dim lnFIM As Integer
   
    
    If lcFIM = "" Then
        lnFIM = Len(lcSTRING)
    End If
    
    lnSTRING = 0
    For lnCONT = 1 To lnOCORRENCIA
        Do While lnSTRING < Len(lcSTRING)
            If lcINIT = "" Then
                lnINIT = 1
                Exit Do
             End If
            a = Mid(lcSTRING, lnSTRING + 1, Len(lcINIT))
            If Mid(lcSTRING, lnSTRING + 1, Len(lcINIT)) = lcINIT Then
                lnINIT = Len(lcINIT) + (lnSTRING + 1)
                Exit Do
            End If
            lnSTRING = lnSTRING + 1
        Loop
        lnSTRING = lnSTRING + Len(lcINIT)
        Do While lnSTRING < Len(lcSTRING)
            If lcFIM = "" Then
                lnFIM = Len(lcSTRING) - lnINIT + 1
                Exit Do
            End If
            a = Mid(lcSTRING, lnSTRING + 1, Len(lcFIM))
            If Mid(lcSTRING, lnSTRING + 1, Len(lcFIM)) = lcFIM Then
                lnFIM = (lnSTRING + 1) - lnINIT
                Exit Do
            End If
            lnSTRING = lnSTRING + 1
        Loop
    Next
    STREXTRACT = Trim(Mid(lcSTRING, lnINIT, lnFIM))
End Function

Function STRREMOVE(lcSTRING As String, lcINIT As String, lcFIM As String, Optional lnOCORRENCIA As Integer = 1) As String
    Dim lnCONT As Integer
    Dim lnSTRING As Integer
    Dim lnINIT As Integer
    Dim lnFIM As Integer
   
    
    If lcFIM = "" Then
        lnFIM = Len(lcSTRING)
    End If
    
    lnSTRING = 0
    For lnCONT = 1 To lnOCORRENCIA
        Do While lnSTRING < Len(lcSTRING)
            If lcINIT = "" Then
                lnINIT = 1
                Exit Do
             End If
            a = Mid(lcSTRING, lnSTRING + 1, Len(lcINIT))
            If Mid(lcSTRING, lnSTRING + 1, Len(lcINIT)) = lcINIT Then
                lnINIT = Len(lcINIT) + (lnSTRING)
                STRREMOVE = Mid(lcSTRING, 1, lnINIT)
                Exit Do
            End If
            lnSTRING = lnSTRING + 1
        Loop
        lnSTRING = lnSTRING + Len(lcINIT)
        Do While lnSTRING < Len(lcSTRING)
            If lcFIM = "" Then
                lnFIM = Len(lcSTRING) - lnINIT + 1
                Exit Do
            End If
            a = Mid(lcSTRING, lnSTRING + 1, Len(lcFIM))
            If Mid(lcSTRING, lnSTRING + 1, Len(lcFIM)) = lcFIM Then
                lnFIM = (lnSTRING + 1)
                STRREMOVE = STRREMOVE & Mid(lcSTRING, lnFIM)
                Exit Do
            End If
            lnSTRING = lnSTRING + 1
        Loop
    Next
    If STRREMOVE = Empty Then STRREMOVE = lcSTRING
End Function

Function OCCURS(cSTRING As String, searched As String) As Integer
         Dim CONT As Integer
         Dim qtd As Integer
         qtd = 0
         For CONT = 1 To Len(cSTRING)
            If Mid(cSTRING, CONT, Len(searched)) = searched Then
                qtd = qtd + 1
            End If
         Next
         OCCURS = qtd
End Function
Function Formata(loFORM As Object)
    Dim OBJ As Object
    For Each OBJ In loFORM
        If OCCURS(UCase(STRREMOVE(UCase(OBJ.Tag), "M(", ")")), "O") > 0 Then
            OBJ.BackColor = RGB(255, 255, 200)
        End If
    Next
End Function

Function Mostrar(loFORM As Object, QUERIE As String, TagIndex As String)
        Dim adoMOSTRAR As New ADODB.RECORDSET
        Dim OBJ As Object
        
        On Error Resume Next
        If adoMOSTRAR.State = adStateOpen Then adoMOSTRAR.Close
        adoMOSTRAR.Open STREXTRACT(UCase(QUERIE), "FROM ", " ") + " ", CONECTA, adOpenKeyset, adLockOptimistic
        adoMOSTRAR.Close
        adoMOSTRAR.Open QUERIE
          
          
        If adoMOSTRAR.EOF = True Or adoMOSTRAR.BOF = True Then
             For Each OBJ In loFORM
                If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "M") > 0 And OCCURS(STREXTRACT(UCase(OBJ.Tag), "M(", ")"), UCase(TagIndex)) > 0 Then
                    OBJ.Text = Empty
                End If
            Next
        Else
            For Each OBJ In loFORM
                If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "M") > 0 Then
                    If OCCURS(STREXTRACT(UCase(OBJ.Tag), "M(", ")"), UCase(TagIndex)) > 0 Then
                        OBJ.Text = RBYF(adoMOSTRAR, STREXTRACT(UCase(OBJ.Tag), UCase(TagIndex) & "<", ">"))
                    End If
                End If
            Next
        End If
        
        If adoMOSTRAR.State = adStateOpen Then adoMOSTRAR.Close
        Set adoMOSTRAR = Nothing
End Function
Function Deletar(Tabela As String, Optional Condicao As String, Optional MSG As MsgYesNo)
        Dim cond As String
        If Not Condicao = Empty Then
            cond = " where " & Condicao
        End If
        CONECTA.Execute "delete from " & Tabela & cond
        
        If MSG = vbMsgYes Then
            MsgBox "Informaçoes excluidas com sucesso", vbInformation
        End If
            
End Function
Function listar(loFORM As Object, GridName As String, QUERIE As String, DBFIELDS As String, FIELDS As String, Optional Zebrado As listrado, Optional GridBackColor1 As ColorConstants, Optional GridBackColor2 As ColorConstants, Optional GridForeColor1 As ColorConstants, Optional GridForeColor2 As ColorConstants)
        Dim adoLISTA As New ADODB.RECORDSET
        Dim Tabela As String
        Dim QTcampos As Integer
        Dim COLUMNCONT As Integer
        Dim grade As Object
        Dim CAMPOS As String
        Dim listrar As Integer
        
        listrar = 1
        QUERIE = UCase(QUERIE) & " "
        
         If GridBackColor1 = Empty Then
            GridBackColor1 = vbWhite
        End If
        
        If GridBackColor2 = Empty Then
            GridBackColor2 = RGB(230, 230, 230)
        End If
        
        If GridForeColor1 = Empty Then
            GridForeColor1 = vbBlack
        End If
        
        If GridForeColor2 = Empty Then
            GridForeColor2 = vbBlack
        End If
        
        
        If adoLISTA.State = adStateOpen Then adoLISTA.Close
        Tabela = STREXTRACT(QUERIE, "FROM ", " ")
        adoLISTA.Open Tabela, CONECTA, adOpenKeyset, adLockOptimistic
        adoLISTA.Close
        adoLISTA.Open QUERIE
        Set grade = Cobj(loFORM, GridName)
        grade.FormatString = FIELDS
        If adoLISTA.EOF = True Or adoLISTA.BOF = True Then
            grade.Rows = 1
            grade.Rows = 2
            GoTo fim
        End If
        adoLISTA.MoveFirst
        QTcampos = OCCURS(DBFIELDS, ",") + 1
        CAMPOS = "," & UCase(DBFIELDS) & ","
        grade.Rows = 1
        Do Until adoLISTA.EOF = True
             grade.Rows = grade.Rows + 1
             For COLUMNCONT = 0 To QTcampos - 1
                grade.TextMatrix(grade.Rows - 1, COLUMNCONT) = RBYF(adoLISTA, STREXTRACT(UCase(CAMPOS), ",", ",", COLUMNCONT + 1))
                If Zebrado = vbListradoYes Then
                    If COLUMNCONT <> QTcampos - 1 Then
                        grade.Col = COLUMNCONT + 1
                        grade.Row = listrar
                        If listrar = Int(listrar / 2) * 2 Then
                            grade.CellBackColor = GridBackColor2
                            grade.CellForeColor = GridForeColor2
                        Else
                            grade.CellBackColor = GridBackColor1
                            grade.CellForeColor = GridForeColor1
                        End If
                     End If
                End If
             Next
             listrar = listrar + 1
             adoLISTA.MoveNext
        Loop
        
fim:
        If adoLISTA.State = adStateOpen Then adoLISTA.Close
        Set adoLISTA = Nothing
End Function

Function salvar(loFORM As Object, Table As String, Optional MSG As MsgYesNo)
         Dim adoALTERAR As New ADODB.RECORDSET
         Dim OBJ As Object
         Dim FieldAlt As String
         Dim CodAlt As Object
         Dim QUERIE As String
         Dim VALUES As String
         
         
         If MSG = Empty Then
            MSG = vbMsgNo
         End If
         
         For Each OBJ In loFORM
            If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "O") > 0 Then
                If OBJ = Empty Then
                    MsgBox "Preencha os campos obrigatorios!", vbCritical
                    GoTo fim
                End If
            End If
            If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "PK") > 0 Then
                If Not OBJ = Empty Then
                    If adoALTERAR.State = adStateOpen Then adoALTERAR.Close
                    adoALTERAR.Open Table, CONECTA, adOpenKeyset, adLockOptimistic
                    If adoALTERAR.State = adStateOpen Then adoALTERAR.Close
                    adoALTERAR.Open "select * from " & Table & " where " & Right(OBJ.Name, Len(OBJ.Name) - 3) & _
                                    "= " & OBJ
                    FieldAlt = Right(OBJ.Name, Len(OBJ.Name) - 3)
                    Set CodAlt = OBJ
                End If
            End If
        Next
        If adoALTERAR.State = adStateClosed Then GoTo salvar
        If adoALTERAR.RecordCount > 0 Then
         
            For Each OBJ In loFORM
                If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "S") > 0 And OBJ.Name <> CodAlt.Name Then
                   If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "+") > 0 Then
                        QUERIE = QUERIE & Right(OBJ.Name, Len(OBJ.Name) - 3) & " = " & IIf(OCCURS(OBJ.Tag, "FD") > 0, "CTOD('" & OBJ & "')", OBJ) & ","
                    Else
                        QUERIE = QUERIE & Right(OBJ.Name, Len(OBJ.Name) - 3) & " = '" & IIf(OCCURS(OBJ.Tag, "FD") > 0, "CTOD('" & OBJ & "')", OBJ) & "',"
                    End If
                End If
            Next
            If QUERIE = Empty Then GoTo fim
            QUERIE = "update " & Table & " set " & Left(QUERIE, Len(QUERIE) - 1) & _
                     " where " & FieldAlt & " = " & CodAlt
            
            CONECTA.Execute QUERIE
            
            
            If MSG = vbMsgYes Then
                MsgBox "Informações alteradas com sucesso", vbInformation
            End If
            GoTo fim
            
        Else
salvar:
             For Each OBJ In loFORM
                If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "S") > 0 Then
                    QUERIE = QUERIE & Right(OBJ.Name, Len(OBJ.Name) - 3) & ","
                    If OCCURS(STRREMOVE(UCase(OBJ.Tag), "M(", ")"), "+") > 0 Then
                        VALUES = VALUES & IIf(OCCURS(OBJ.Tag, "FD") > 0, "CTOD('" & OBJ & "')", OBJ) & ","
                    Else
                        VALUES = VALUES & "'" & IIf(OCCURS(OBJ.Tag, "FD") > 0, "CTOD('" & OBJ & "')", OBJ) & "',"
                    End If
                End If
            Next
             QUERIE = "insert into " & Table & "(" & Left(QUERIE, Len(QUERIE) - 1) & _
                            ") values(" & Left(VALUES, Len(VALUES) - 1) & ")"
             CONECTA.Execute QUERIE
              If MSG = vbMsgYes Then
                MsgBox "Informações Salvas com sucesso", vbInformation
              End If
           
        End If
fim:
        If adoALTERAR.State = adStateOpen Then adoALTERAR.Close
        Set adoALTERAR = Nothing
End Function
Function Ativar(loFORM As Object)
    Dim loMask As Object
    For Each loMask In loFORM
        If TypeOf loMask Is MaskEdBox Then
            loMask.PromptInclude = True
            loMask = Replace(loMask, "''", "'")
         ElseIf TypeOf loMask Is TextBox Then
           loMask = Replace(loMask, "''", "'")
        End If
    Next
End Function
Function Desativar(loFORM As Object)
    Dim loMask As Object
    For Each loMask In loFORM
        If TypeOf loMask Is MaskEdBox And OCCURS(STRREMOVE(UCase(loMask.Tag), "M(", ")"), "N") = 0 Then
            loMask.PromptInclude = False
            loMask = Replace(loMask, "'", "''")
            loMask = Replace(loMask, Chr(34), "")
        ElseIf TypeOf loMask Is TextBox Then
            loMask = Replace(loMask, "'", "''")
            loMask = Replace(loMask, Chr(34), "")
        End If
    Next
End Function
Function ADD(loFORM As Object, GridName As String, VALUES As String)
    Dim OBJ As Object
    Dim Xi As Integer
    
    Set OBJ = Cobj(loFORM, GridName)
    
    If OBJ.Rows = 2 Then
        For Xi = 1 To OBJ.Cols
            If OBJ.TextMatrix(OBJ.Rows - 1, Xi - 1) <> Empty Then Exit For
        Next
        If Xi - 1 = OBJ.Cols Then OBJ.Rows = 1
    End If
    
    OBJ.Rows = OBJ.Rows + 1
    
    VALUES = "," & VALUES & ","
    For Xi = 1 To OBJ.Cols
        OBJ.TextMatrix(OBJ.Rows - 1, Xi - 1) = STREXTRACT(VALUES, ",", ",", Xi)
    Next
    
End Function
Function REMOVE(loFORM As Object, GridName As String)
    Dim OBJ As Object
    Set OBJ = Cobj(loFORM, GridName)
    
    If OBJ.Rows = 2 Then
        OBJ.Rows = 1
        OBJ.Rows = 2
    Else
        OBJ.RemoveItem (OBJ.Row)
    End If
End Function
Function INSERT(Table As String, FIELDS As String, VALUES As String, Optional Autoformat As Boolean = True)
        Dim QUERIE As String
        If Autoformat Then
            VALUES = "'" & Replace(VALUES, ",", "','") & "'"
        End If
        
        QUERIE = "INSERT INTO " & Table & "(" & FIELDS & ") VALUES(" & VALUES & ")"
        CONECTA.Execute QUERIE
End Function

Function SAIR()
    Set CONECTA = Nothing
    Set tabelas = Nothing
End Function

Function getXY(FormX As Single, FormY As Single)
    X = Val(FormX)
    Y = Val(FormY)
End Function

Function MoveOnClick(loFORM As Object, ObjectName As String, Button As Integer, MouseX As Single, mouseY As Single)
    Set OBJ = Cobj(loFORM, ObjectName)
    Dim DefX As Long
    Dim DefY As Long
    DefX = X
    DefY = Y
    Call getXY(X + Val(MouseX), Y + Val(mouseY))
    If Button = vbRightButton And (X + OBJ.Width) <= loFORM.Width And X >= 0 And (Y + OBJ.Height + ((OBJ.Height / 100) * 65)) <= loFORM.Height And Y >= 0 Then
        Call OBJ.Move(X, Y)
    Else
        X = DefX
        Y = DefY
    End If
    
End Function
