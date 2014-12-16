Attribute VB_Name = "Module1"
Global conecta As ADODB.Connection
Global banco As String
Global tabela As ADODB.Recordset
Global tabelas As ADODB.Recordset
Global image As String
Public V_Status As ADODB.Recordset
Public vqvotos As ADODB.Recordset


Function conectar_banco()
         
         Set conecta = New ADODB.Connection
         Set tabela = New ADODB.Recordset
         Set V_Status = New ADODB.Recordset
         Set vqvotos = New ADODB.Recordset
         Set tabelas = New ADODB.Recordset
         banco = "provider=microsoft.jet.oledb.4.0; data source = bd1.mdb"
         conecta.Open banco
End Function


Function zerar()
If MsgBox("deseja realmente Zerar?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
             If MsgBox("Tem certeza?", vbQuestion + vbYesNo + vbDefaultButton2) = vbYes Then
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic
            conecta.Execute "update cand set votos=0"
            conecta.Execute "update Matriculas set voto=0"
            MsgBox " Eleiçao zerada", vbInformation
            With MDIForm1
                .Toolbar1.Buttons.Item(2).Enabled = True
                .Toolbar1.Buttons.Item(3).Enabled = True
                .Toolbar1.Buttons.Item(4).Enabled = True
                .Toolbar1.Buttons.Item(5).Enabled = True

            End With
                        End If
            End If
End Function
