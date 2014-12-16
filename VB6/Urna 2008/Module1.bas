Attribute VB_Name = "Module1"
Global conecta As ADODB.Connection
Global banco As String
Global tabela As ADODB.Recordset
Global fim As Integer
Global focu As Integer



Function conectar_banco()
         Set conecta = New ADODB.Connection
         Set tabela = New ADODB.Recordset
         conecta.Open banco
End Function

Function travar()
              Form1.Command5.Enabled = False
               Form1.Command12.Enabled = False
               Form1.Command13.Enabled = False
              Form1.Command14.Enabled = False
              Form1.Command9.Enabled = False
              Form1.Command10.Enabled = False
              Form1.Command11.Enabled = False
              Form1.Command6.Enabled = False
              Form1.Command7.Enabled = False
              Form1.Command8.Enabled = False
              Form1.t1.Enabled = False
              Form1.t2.Enabled = False
              Form1.KeyPreview = False
              
End Function

Function destravar()
            Form1.Command5.Enabled = True
            Form1.Command12.Enabled = True
             Form1.Command13.Enabled = True
             Form1.Command14.Enabled = True
             Form1.Command9.Enabled = True
             Form1.Command10.Enabled = True
             Form1.Command11.Enabled = True
             Form1.KeyPreview = True
             Form1.Command6.Enabled = True
             Form1.Command7.Enabled = True
             Form1.Command8.Enabled = True
             Form1.t1.Enabled = True
             Form1.t2.Enabled = True
            Form1.Command3.Enabled = True
           Form1.cmdconf.Enabled = True
           Form1.Command2.Enabled = True
            
End Function

