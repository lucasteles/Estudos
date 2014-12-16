Attribute VB_Name = "Module1"
Global Conecta As ADODB.Connection
Global Tabelas As Recordset
Global img As ADODB.Recordset
Global Banco As String
Global tb As String

Function BanK(URLbank As String)
Set Conecta = New ADODB.Connection
Set Tabelas = New Recordset
Set img = New Recordset
Banco = "Provider=microsoft.jet.oledb.4.0; data source= " & URLbank
On Error GoTo fim:
Conecta.Open Banco
tb = "tb_exe"
Exit Function
fim:
    MsgBox "caminho do banco acces invalido", vbCritical, "Erro ao conectar"
    End
End Function

