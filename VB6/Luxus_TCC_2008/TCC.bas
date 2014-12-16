Attribute VB_Name = "Module1"
Global conecta As ADODB.Connection
Global banco As String
Global status As String
Global caminho As String
Global forn As Boolean
Global algo As Integer
Global B_designe As Boolean
Global tabelas As ADODB.Recordset
Global tabelas2 As ADODB.Recordset
Global tabelas3 As ADODB.Recordset
Global tabelas4 As ADODB.Recordset
Global tabelas5 As ADODB.Recordset
Global nome As String
Global prim As Integer
Global wer As Long
Global actskin As Skin
Global actskin2 As Skin
Global actskin3 As Skin
Global actskin4 As Skin
Global PU(21) As Boolean

Function abrir_banco()
        
         Set conecta = New ADODB.Connection
         Set tabelas = New ADODB.Recordset
         Set tabelas2 = New ADODB.Recordset
         Set tabelas3 = New ADODB.Recordset
        Set tabelas4 = New ADODB.Recordset
        Set tabelas5 = New ADODB.Recordset

         Set tab2 = New ADODB.Recordset
         banco = "provider=microsoft.jet.oledb.4.0;data source=tcc.mdb"
         conecta.Open banco
End Function

Function crash1()
         'MsgBox "Informaçoes " & status & " com sucesso", vbInformation
         Unload frmola
         frmola.Show
End Function

Function clientes()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from clientes order by codigo"
End Function

Function Forne()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Fornecedores", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from fornecedores order by codigo"

End Function

Function desi()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "designe", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from designe order by codigo"

End Function

Function trans()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "transportadora", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from transportadora order by codigo"

End Function

Function Modelos()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "M_designe", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from M_designe order by codigo"
End Function

Function Produtos()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Produtos", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Produtos order by codigo"
End Function

Function Pedidos()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Vendas", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Vendas order by Num_Pedido"
End Function

Function Itens()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "itens_vendas", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from itens_vendas order by NumPedido"
End Function

Function tipos()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "tipos", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from tipos"
End Function

Function cores()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "cores", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from cores"
End Function
Function Peças()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Peças", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Peças order by codigo"
End Function
Function Preços()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Preços", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Preços"
End Function


Function estoque()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "estoque", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from estoque order by codigo"
End Function

Function calc()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "val", conecta, adOpenKeyset, adLockOptimistic
End Function

Function Usuarios()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Usuarios", conecta, adOpenKeyset, adLockOptimistic
End Function

Function Permissoes()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Usu_permissao", conecta, adOpenKeyset, adLockOptimistic
End Function


Function caixa()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from caixa order by codigo"

End Function
Function Car()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Contas_a_receber", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Contas_a_receber order by codigo"
End Function

Function Cap()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Contas_a_pagar", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Contas_a_pagar order by codigo"
End Function

Function CF()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "CustusFixos", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from CustusFixos order by codigo"
End Function

Function Ped_Comp()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Ped_Comp", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Ped_Comp order by codigo"
End Function
Function ped_comp_Itens()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Ped_comp_Itens", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Ped_comp_Itens order by Cod_Ped"
End Function

Function Ped_Des()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Ped_Des", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Ped_Des order by codigo"
End Function
Function Pedido_trans()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Pedido_trans", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Pedido_trans order by Codigo"
End Function

Function Hist_estoque()
If tabelas4.State = adStateOpen Then tabelas4.Close
tabelas4.Open "Historico_estoque", conecta, adOpenKeyset, adLockOptimistic
If tabelas4.State = adStateOpen Then tabelas4.Close
tabelas4.Open "select * from Historico_estoque order by numero"
End Function

Function Produçao()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Produçao", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Produçao order by Codigo"
End Function

Function Transporte()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Transportes", conecta, adOpenKeyset, adLockOptimistic
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from Transportes order by codigo"
End Function

