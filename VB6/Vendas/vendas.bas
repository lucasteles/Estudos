Attribute VB_Name = "Module1"
Global conecta As ADODB.Connection
Global banco As String
Global status As String
Global tabelas As ADODB.Recordset


Function abrir_banco()
         Set conecta = New ADODB.Connection
         Set tabelas = New ADODB.Recordset
         banco = "provider=microsoft.jet.oledb.4.0; data source= bd1.mdb"
         conecta.Open banco
End Function

Function crash1()
         MsgBox "Informaçoes " & status & " com sucesso", vbInformation, "LUCAS"
End Function

