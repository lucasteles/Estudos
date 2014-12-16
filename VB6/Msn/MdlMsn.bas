Attribute VB_Name = "Msn"
Global conectar As ADODB.Connection
Global Tabelas As ADODB.Recordset
Global stat As ADODB.Recordset
Global usu As ADODB.Recordset
Global banco As String
Global cod_usuario As Integer
Global nome_usuario As String
Global cod_rec(999) As Integer
Global nome_rec(999) As String
Global TABcod(999) As Currency
Global status As Bin
Global cont As Integer
Global Codigos(999) As Integer
Global Nome_tab As String
Global Rec_tab As String
Global Rec As Long
Public Enum Bin
VbOn = 1
VbOff = 0
End Enum


Function abrir_banco()

Set conectar = New ADODB.Connection

        banco = "provider=microsoft.jet.oledb.4.0;data source=" & App.Path & "\msnBD.mdb"
        conectar.Open banco
Set stat = New ADODB.Recordset
Set Tabelas = New ADODB.Recordset
Set usu = New ADODB.Recordset
End Function
