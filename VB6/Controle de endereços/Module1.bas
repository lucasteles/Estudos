Attribute VB_Name = "Module1"
Global Conecta As ADODB.Connection
Global Tabelas As Recordset
Global Banco As String
Function Abrir_Banco()
Set Conecta = New ADODB.Connection
Set Tabelas = New Recordset
Banco = "Provider=microsoft.jet.oledb.4.0; data source=Banco.mdb"
Conecta.Open Banco
End Function

