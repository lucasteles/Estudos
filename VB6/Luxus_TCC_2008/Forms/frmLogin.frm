VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Login"
   ClientHeight    =   1560
   ClientLeft      =   7545
   ClientTop       =   4305
   ClientWidth     =   4080
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   921.699
   ScaleMode       =   0  'User
   ScaleWidth      =   3830.899
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text2 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1200
      PasswordChar    =   "*"
      TabIndex        =   10
      Top             =   1080
      Visible         =   0   'False
      Width           =   2325
   End
   Begin VB.TextBox Text1 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1200
      PasswordChar    =   "*"
      TabIndex        =   7
      Top             =   1560
      Visible         =   0   'False
      Width           =   2325
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   255
      Left            =   480
      OleObjectBlob   =   "frmLogin.frx":0000
      TabIndex        =   5
      Top             =   120
      Width           =   615
   End
   Begin VB.CommandButton Command3 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   390
      Left            =   2760
      TabIndex        =   4
      Top             =   1080
      Width           =   1140
   End
   Begin VB.CommandButton Command2 
      Caption         =   "OK"
      Height          =   390
      Left            =   360
      TabIndex        =   3
      Top             =   1080
      Width           =   1140
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Trocar senha"
      Height          =   390
      Left            =   1560
      TabIndex        =   2
      Top             =   1080
      Width           =   1140
   End
   Begin VB.TextBox txtUserName 
      Height          =   345
      Left            =   1200
      TabIndex        =   0
      Text            =   "Administrador"
      Top             =   120
      Width           =   2325
   End
   Begin VB.TextBox txtPassword 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1200
      PasswordChar    =   "*"
      TabIndex        =   1
      Text            =   "123"
      Top             =   600
      Width           =   2325
   End
   Begin ACTIVESKINLibCtl.Skin Skin5 
      Left            =   3840
      OleObjectBlob   =   "frmLogin.frx":0068
      Top             =   -240
   End
   Begin ACTIVESKINLibCtl.Skin Skin4 
      Left            =   3360
      OleObjectBlob   =   "frmLogin.frx":029C
      Top             =   240
   End
   Begin ACTIVESKINLibCtl.Skin Skin3 
      Left            =   4200
      OleObjectBlob   =   "frmLogin.frx":04D0
      Top             =   -720
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   255
      Left            =   480
      OleObjectBlob   =   "frmLogin.frx":0704
      TabIndex        =   6
      Top             =   600
      Width           =   615
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
      Height          =   375
      Left            =   0
      OleObjectBlob   =   "frmLogin.frx":076C
      TabIndex        =   8
      Top             =   1080
      Visible         =   0   'False
      Width           =   1215
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "frmLogin.frx":07E8
      TabIndex        =   9
      Top             =   1560
      Visible         =   0   'False
      Width           =   1695
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim ts As Integer

Private Sub Command1_Click()
If ts = Empty Then
SkinLabel4.Visible = True
SkinLabel3.Visible = True
Text1.Visible = True
Text2.Visible = True
ts = 1
Command1.Top = 1276
Command2.Top = 1276
Command3.Top = 1276
frmLogin.Height = 3090
Command2.Visible = False
ElseIf ts = 1 Then
If Text1 = Empty Then
MsgBox "Digite uma nova senha", vbInformation
Else
tabelas.Close
tabelas.Open "select * from usuarios where login= '" & txtUserName & "'"
If tabelas.EOF = False And tabelas.BOF = False Then
If txtPassword <> tabelas!senha Or txtPassword <> Text2 Then
MsgBox "senha invalida", vbExclamation
Else
tabelas!senha = Text1
tabelas.Update
Command3 = True
MsgBox "Senha trocada com sucesso!", vbInformation
End If
Else
MsgBox "Nome de usuario incorreto", vbExclamation
End If
End If
End If

End Sub

Private Sub Command2_Click()
tabelas.Close
tabelas.Open "select * from usuarios where login= '" & Replace(txtUserName, "'", "''") & "'"
If tabelas.EOF = False And tabelas.BOF = False Then
If txtPassword <> tabelas!senha Then
MsgBox "senha invalida", vbExclamation
Exit Sub
Else
Dim teste As String
teste = txtUserName
Unload Me
mdiLUxus.Show
tabelas.Close
tabelas.Open "select * from usuarios where login= '" & teste & "'"
Call CarregarMenuRibbon
nome = tabelas!nome

If tabelas!Contas_a_receber = True Then
Call Car
tabelas.Close
tabelas.Open "select * from contas_a_receber where data_venc= #" & Format(Date, "mm/dd/yyyy") & "# and pago=0"
If tabelas.EOF = False And tabelas.BOF = False Then
If tabelas!data_venc = Date Then MsgBox "A contas a recerber Hoje", vbInformation
End If


tabelas.Close
tabelas.Open "select * from contas_a_receber where data_venc < #" & Format(Date, "mm/dd/yyyy") & "# and pago=0"
If tabelas.EOF = False And tabelas.BOF = False Then
If tabelas!data_venc < Date Then MsgBox "A contas a receber atrasadas", vbExclamation
End If
End If
'-------------
Call Usuarios
tabelas.Close
tabelas.Open "select * from usuarios where login= '" & teste & "'"

If tabelas!Contas_a_pagar = True Then
Call Cap
tabelas.Close
tabelas.Open "select * from contas_a_pagar where dt_venc= #" & Format(Date, "mm/dd/yyyy") & "# and pago=0"
If tabelas.EOF = False And tabelas.BOF = False Then
If tabelas!dt_venc = Date Then MsgBox "A contas a pagar Hoje", vbInformation
End If


tabelas.Close
tabelas.Open "select * from contas_a_pagar where dt_venc < #" & Format(Date, "mm/dd/yyyy") & "# and pago=0"
If tabelas.EOF = False And tabelas.BOF = False Then
If tabelas!dt_venc < Date Then MsgBox "A contas a pagar atrasadas", vbExclamation
End If
Call Usuarios
tabelas.Close
tabelas.Open "select * from usuarios where login= '" & teste & "'"
If tabelas!CustusFixos = True Then
Call CF
If tabelas.EOF = False And tabelas.BOF = False Then
If Month(tabelas!dt_vencimento) < Month(Date) Then
If MsgBox("E preciso atualizar os Custus fixos, Deseja fazer isso agora?", vbInformation + vbYesNo) = vbYes Then frmCustosfixos.Show
End If
End If
End If
End If
End If
'-------------------------

Call Usuarios
tabelas.Close
tabelas.Open "select * from usuarios where login= '" & teste & "'"

If tabelas!CustusFixos = True Then
Call CF
tabelas.Close
tabelas.Open "select * from CustusFixos where dt_vencimento= #" & Format(Date, "mm/dd/yyyy") & "# and pendente=0"
If tabelas.EOF = False And tabelas.BOF = False Then
If tabelas!dt_vencimento = Date Then MsgBox "A Contas Fixas a pagar Hoje", vbInformation
End If


tabelas.Close
tabelas.Open "select * from CustusFixos where dt_vencimento < #" & Format(Date, "mm/dd/yyyy") & "# and pendente=0"
If tabelas.EOF = False And tabelas.BOF = False Then
If tabelas!dt_vencimento < Date Then MsgBox "A contas a pagar Contas Fixas atrasadas", vbExclamation
End If

Call CF
If tabelas.EOF = False And tabelas.BOF = False Then
If Month(tabelas!dt_vencimento) < Month(Date) Then
If MsgBox("E preciso atualizar os Custus fixos, Deseja fazer isso agora?", vbInformation + vbYesNo) = vbYes Then frmCustosfixos.Show
End If
End If
End If




Else
MsgBox "Nome de usuario invalido", vbCritical
Exit Sub
End If
If tabelas.State = adStateOpen Then tabelas.Close

Call crash1

End Sub

Private Sub Command3_Click()
If ts = 1 Then
SkinLabel4.Visible = False
SkinLabel3.Visible = False
Text1.Visible = False
Text2.Visible = False
ts = 0
Command1.Top = 638
Command2.Top = 638
Command3.Top = 638
frmLogin.Height = 1995
Command2.Visible = True
Else
End
End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then Command2 = True
End Sub

Private Sub Form_Load()
 Skin3.LoadSkin (App.Path & "\43.skn")
 Set actskin2 = Skin3
      
 Skin4.LoadSkin (App.Path & "\WinMediaPlayer11.skn")
 Set actskin3 = Skin4
 
 Skin5.LoadSkin (App.Path & "\finevector.skn")
 Set actskin4 = Skin5
  
Call abrir_banco

actskin4.ApplySkin Me.hWnd
actskin2.ApplySkin Command1.hWnd
actskin2.ApplySkin Command2.hWnd
actskin2.ApplySkin Command3.hWnd


Dim pasta As New FileSystemObject
If Not pasta.FolderExists(App.Path & "\modelos") = True Then
pasta.CreateFolder (App.Path & "\modelos")
End If


Call Usuarios
End Sub

Private Sub CarregarMenuRibbon()

With mdiLUxus.Ribbon
.ImageList = mdiLUxus.vbalImageList1

'--Menu dos tab
If tabelas!clientes = False And tabelas!tranp = False And tabelas!Forne = False And tabelas!desig = False And tabelas!Modelos = False And tabelas!Peças = False And tabelas!Produtos = False And tabelas!tipos = False And tabelas!Usuarios = False Then
Else
.AddTab "tabCadastros", "Cadastros"
End If

If tabelas!Pedidos = False And tabelas!estoque = False And tabelas!calculadora = False And tabelas!pedc = False And tabelas!pedm = False And tabelas!Pedt = False And tabelas!contp = False And tabelas!contT = False Then
Else
.AddTab "tbControle", "Controle"
End If

If tabelas!Contas_a_receber = False And tabelas!caixa = False And tabelas!Contas_a_pagar = False Then
Else
.AddTab "tbFina", "Financeiro"
End If

.AddTab "tbHELP", "Help"


'--------------------------------Cria os Sub Menus(Cat)------------------------------------------
'--Cria o SubMenu Para Carregar os Skins
If tabelas!clientes = False And tabelas!tranp = False And tabelas!Forne = False And tabelas!desig = False And tabelas!Usuarios = False Then
Else
.AddCat "catBasico", "tabCadastros", "Cadastros Basicos", False
End If

If tabelas!Modelos = False And tabelas!Peças = False And tabelas!Produtos = False And tabelas!tipos = False Then
Else
.AddCat "catAvanc", "tabCadastros", "Cadastros Avançados", False
End If

If tabelas!Pedidos = False And tabelas!pedm = False And tabelas!Pedt = False Then
Else
.AddCat "catvendas", "tbControle", "Pedidos", False
End If

If tabelas!estoque = False And tabelas!calculadora = False And tabelas!contp = False And tabelas!contT = False Then
Else
.AddCat "catControle", "tbControle", "Controle", False
End If

If tabelas!Contas_a_receber = False And tabelas!caixa = False And tabelas!Contas_a_pagar = False Then
Else
.AddCat "catFina", "tbFina", "Caixa", False
End If
.AddCat "catHelp", "tbHELP", "Help", False
'--------------------------------Cria os Botões(Button)------------------------------------------
'--Cria o Item do Sub Pra Carregar as Cores do Caption dos Novos Skins

If tabelas!clientes = True Then .AddButton "btClientes", "catBasico", "Clientes", 140, False
If tabelas!Forne = True Then .AddButton "btFornecedores", "catBasico", "Fornecedores", 493, False
If tabelas!desig = True Then .AddButton "btDesigne", "catBasico", "Designer", 481, False
If tabelas!tranp = True Then .AddButton "btTrans", "catBasico", "Transportadora", 29, False
If tabelas!Usuarios = True Then .AddButton "btUsu", "catBasico", "Usuarios", 442, False


If tabelas!Modelos = True Then .AddButton "btModelos", "catAvanc", "Modelos", 475, False
If tabelas!Peças = True Then .AddButton "btPeças", "catAvanc", "Peças", 250, False
If tabelas!Produtos = True Then .AddButton "btProdutos", "catAvanc", "Produtos", 232, False
If tabelas!tipos = True Then .AddButton "bttipo", "catAvanc", "Tipo/Cor", 510, False

'-

If tabelas!Pedidos = True Then .AddButton "btPedidos", "catvendas", "Pedido de venda", 456, False
If tabelas!estoque = True Then .AddButton "btEstoque", "catControle", "Estoque", 447, False
If tabelas!pedc = True Then .AddButton "btpedc", "catvendas", "Pedido de compra", 449, False
If tabelas!pedm = True Then .AddButton "btpedm", "catvendas", "Pedido de Modelo", 59, False
If tabelas!Pedt = True Then .AddButton "btPedt", "catvendas", "Pedido de transporte", 101, False
If tabelas!contp = True Then .AddButton "btContP", "catControle", "Controle de Produção", 330, False
If tabelas!contT = True Then .AddButton "btcontT", "catControle", "Controle de Transporte", 463, False
If tabelas!calculadora = True Then .AddButton "btCalc", "catControle", "Calculadora Estatistica", 467, False




'-
If tabelas!caixa = True Then .AddButton "btCaixa", "catFina", "Livro Caixa", 445, False
If tabelas!Contas_a_receber = True Then .AddButton "btContas_a_Receber", "catFina", "Contas a Receber", 446, False
If tabelas!Contas_a_pagar = True Then .AddButton "btContas_a_Pagar", "catFina", "Contas a Pagar", 448, False
If tabelas!CustusFixos = True Then .AddButton "btCustos", "catFina", "Custus Fixos", 503, False

.AddButton "vbCad", "catHelp", "Cadastros", 103, False
.AddButton "vbFin", "catHelp", "Financeiro", 103, False
.AddButton "vbCont", "catHelp", "Controle", 103, False



.Refresh
End With

End Sub

