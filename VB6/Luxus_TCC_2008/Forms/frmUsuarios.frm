VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmUsuarios 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Usuarios"
   ClientHeight    =   5805
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   7500
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5805
   ScaleWidth      =   7500
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   0
      ScaleHeight     =   675
      ScaleWidth      =   8295
      TabIndex        =   10
      Top             =   5760
      Width           =   8295
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmUsuarios.frx":0000
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   16
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmUsuarios.frx":0CCA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   15
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmUsuarios.frx":1594
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   14
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmUsuarios.frx":225E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   13
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmUsuarios.frx":2F28
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   12
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmUsuarios.frx":37F2
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   11
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Label lblh 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "Luxus System"
         Height          =   195
         Left            =   1080
         TabIndex        =   17
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   4935
      Left            =   120
      TabIndex        =   4
      Top             =   720
      Width           =   7335
      Begin VB.CommandButton Command2 
         Caption         =   "Busca"
         Height          =   375
         Left            =   2400
         TabIndex        =   40
         Top             =   1920
         Width           =   615
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Busca"
         Height          =   375
         Left            =   2400
         TabIndex        =   39
         Top             =   1200
         Width           =   615
      End
      Begin VB.TextBox txtConfSenha 
         Height          =   375
         IMEMode         =   3  'DISABLE
         Left            =   120
         PasswordChar    =   "*"
         TabIndex        =   35
         Top             =   3240
         Width           =   2175
      End
      Begin VB.TextBox txtLogin 
         Height          =   375
         Left            =   120
         TabIndex        =   32
         Top             =   1920
         Width           =   2175
      End
      Begin VB.TextBox txtSenha 
         Height          =   375
         IMEMode         =   3  'DISABLE
         Left            =   120
         PasswordChar    =   "*"
         TabIndex        =   31
         Top             =   2520
         Width           =   2175
      End
      Begin VB.Frame Frame3 
         Caption         =   "."
         Height          =   4575
         Left            =   3240
         TabIndex        =   18
         Top             =   240
         Width           =   3975
         Begin VB.CheckBox chkpedM 
            Caption         =   "Pedidos de Modelos"
            Height          =   495
            Left            =   1920
            TabIndex        =   49
            Top             =   2400
            Width           =   1815
         End
         Begin VB.CheckBox chkPedT 
            Caption         =   "Pedidos de Transporte"
            Height          =   495
            Left            =   1920
            TabIndex        =   48
            Top             =   2760
            Width           =   1935
         End
         Begin VB.CheckBox chkContProd 
            Caption         =   "Controle de Produçao"
            Height          =   495
            Left            =   1920
            TabIndex        =   47
            Top             =   3120
            Width           =   1935
         End
         Begin VB.CheckBox chkContTrans 
            Caption         =   "Controle de Transporte"
            Height          =   495
            Left            =   1920
            TabIndex        =   46
            Top             =   3480
            Width           =   1935
         End
         Begin VB.CheckBox chkPedC 
            Caption         =   "Pedidos de Compra"
            Height          =   495
            Left            =   1920
            TabIndex        =   45
            Top             =   2040
            Width           =   1695
         End
         Begin VB.CheckBox chkCAixa 
            Caption         =   "Livro Caixa"
            Height          =   375
            Left            =   1920
            TabIndex        =   44
            Top             =   720
            Width           =   1455
         End
         Begin VB.CheckBox chkCAR 
            Caption         =   "Contas a Pagar"
            Height          =   375
            Left            =   1920
            TabIndex        =   43
            Top             =   1080
            Width           =   1455
         End
         Begin VB.CheckBox chkCAP 
            Caption         =   "Contas a Receber"
            Height          =   375
            Left            =   1920
            TabIndex        =   42
            Top             =   1440
            Width           =   1695
         End
         Begin VB.CheckBox chkCF 
            Caption         =   "Custus Fixos"
            Height          =   375
            Left            =   1920
            TabIndex        =   41
            Top             =   1800
            Width           =   1455
         End
         Begin VB.CheckBox chkestoque 
            Caption         =   "Estoque"
            Height          =   255
            Left            =   240
            TabIndex        =   38
            Top             =   3600
            Width           =   1695
         End
         Begin VB.CheckBox chkPedidos 
            Caption         =   "Pedidos"
            Height          =   375
            Left            =   240
            TabIndex        =   37
            Top             =   3240
            Width           =   1095
         End
         Begin VB.CheckBox chkUsu 
            Caption         =   "Usuarios"
            Height          =   375
            Left            =   1920
            TabIndex        =   28
            Top             =   360
            Width           =   1455
         End
         Begin VB.CheckBox chkCalc 
            Caption         =   "Calculadora Estatistica"
            Height          =   375
            Left            =   240
            TabIndex        =   27
            Top             =   3960
            Width           =   1575
         End
         Begin VB.CheckBox chkForne 
            Caption         =   "Fornecedores"
            Height          =   375
            Left            =   240
            TabIndex        =   26
            Top             =   720
            Width           =   1935
         End
         Begin VB.CheckBox chkDesi 
            Caption         =   "Designe"
            Height          =   375
            Left            =   240
            TabIndex        =   25
            Top             =   1080
            Width           =   2175
         End
         Begin VB.CheckBox chkTrans 
            Caption         =   "Transportadora"
            Height          =   375
            Left            =   240
            TabIndex        =   24
            Top             =   1440
            Width           =   1815
         End
         Begin VB.CheckBox chkMod 
            Caption         =   "Modelos "
            Height          =   375
            Left            =   240
            TabIndex        =   23
            Top             =   1800
            Width           =   1935
         End
         Begin VB.CheckBox chkPeças 
            Caption         =   "Peças"
            Height          =   375
            Left            =   240
            TabIndex        =   22
            Top             =   2160
            Width           =   2055
         End
         Begin VB.CheckBox chkProd 
            Caption         =   "Produtos"
            Height          =   375
            Left            =   240
            TabIndex        =   21
            Top             =   2520
            Width           =   1935
         End
         Begin VB.CheckBox chkTipo 
            Caption         =   "Tipos/Cores"
            Height          =   375
            Left            =   240
            TabIndex        =   20
            Top             =   2880
            Width           =   2175
         End
         Begin VB.CheckBox chkClientes 
            Caption         =   "Clientes"
            Height          =   375
            Left            =   240
            TabIndex        =   19
            Top             =   360
            Width           =   1815
         End
      End
      Begin VB.CommandButton cmdnovo 
         Caption         =   "Novo"
         Height          =   495
         Left            =   1560
         TabIndex        =   8
         Top             =   3960
         Width           =   855
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   495
         Left            =   840
         TabIndex        =   7
         Top             =   3960
         Width           =   735
      End
      Begin VB.CommandButton cmdExclu 
         Caption         =   "Excluir"
         Height          =   495
         Left            =   120
         TabIndex        =   6
         Top             =   3960
         Width           =   735
      End
      Begin VB.TextBox txtNome 
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   1200
         Width           =   2175
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmUsuarios.frx":3D7C
         TabIndex        =   9
         Top             =   960
         Width           =   2655
      End
      Begin MSMask.MaskEdBox codigo 
         Height          =   375
         Left            =   120
         TabIndex        =   29
         Top             =   480
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         Enabled         =   0   'False
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmUsuarios.frx":3DE2
         TabIndex        =   30
         Top             =   240
         Width           =   735
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmUsuarios.frx":3E4C
         TabIndex        =   33
         Top             =   2280
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmUsuarios.frx":3EB4
         TabIndex        =   34
         Top             =   1680
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmUsuarios.frx":3F1C
         TabIndex        =   36
         Top             =   3000
         Width           =   2175
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6975
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   6480
         Top             =   120
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmUsuarios.frx":3F98
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   4080
         OleObjectBlob   =   "frmUsuarios.frx":3FFA
         TabIndex        =   2
         Top             =   120
         Width           =   2055
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmUsuarios.frx":4068
         TabIndex        =   3
         Top             =   120
         Width           =   1455
      End
   End
End
Attribute VB_Name = "frmUsuarios"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As Integer

Private Sub Tirar()
Dim o As Object
        For Each o In Me.Controls
        If TypeOf o Is TextBox Then o = Replace(Replace(o, "'", "''"), Chr(34), "")

        Next
End Sub
Private Sub por()
Dim o As Object
        For Each o In Me.Controls
        If TypeOf o Is TextBox Then o = Replace(o, "''", "'")
        Next
End Sub


Private Sub carregar_lista()
 With flexClientes
            
            Dim cont1 As Integer
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
            .TextMatrix(cont1, 2) = tabelas!Login
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
             
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
            .TextMatrix(cont1, 2) = tabelas!Login

            Else
            cont1 = Clear
            End If
            Wend
            
             End If
            End With
           
End Sub




Private Sub flexClientes_Click()
            
            tabelas.Close
            tabelas.Open "select * from usuarios where codigo=" & flexClientes.TextMatrix(flexClientes.Row, 0)
            
            codigo = tabelas!codigo
            txtLogin = tabelas!Login
            txtNome = tabelas!nome
            txtSenha = tabelas!senha
            
            tabelas.Close
            tabelas.Open "select * from usu_permissao where cod_usuario=" & codigo
            
            Frame2.Visible = True
            Frame1.Visible = False
            TabStrip1.MultiSelect = True
            actskin2.ApplySkin (TabStrip1.hWnd)
            txtbuscas = Clear
            
End Sub

Private Sub flexClientes_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
 lblh.Caption = "Clique em um registro para levalo a outra aba"
            pctluxus.Visible = False
            pctBuscar.Visible = True
End Sub









Private Sub chkCAixa_Click()
If chkCAixa = 1 Then PU(13) = True Else PU(13) = False

End Sub

Private Sub chkCalc_Click()
If chkCalc = 1 Then PU(11) = True Else PU(11) = False
End Sub

Private Sub chkCAP_Click()
If chkCAP = 1 Then PU(15) = True Else PU(15) = False

End Sub

Private Sub chkCAR_Click()
If chkCAR = 1 Then PU(14) = True Else PU(14) = False

End Sub

Private Sub chkCF_Click()
If chkCF = 1 Then PU(16) = True Else PU(16) = False
End Sub

Private Sub chkClientes_Click()
If chkClientes = 1 Then PU(1) = True Else PU(1) = False
End Sub

Private Sub chkContProd_Click()
If chkContProd = 1 Then PU(20) = True Else PU(20) = False

End Sub

Private Sub chkContTrans_Click()
If chkContTrans = 1 Then PU(21) = True Else PU(21) = False

End Sub

Private Sub chkDesi_Click()
If chkDesi = 1 Then PU(3) = True Else PU(3) = False
End Sub


Private Sub chkestoque_Click()
If chkestoque = 1 Then PU(10) = True Else PU(10) = False
End Sub

Private Sub chkForne_Click()
If chkForne = 1 Then PU(2) = True Else PU(2) = False
End Sub

Private Sub chkMod_Click()
If chkMod = 1 Then PU(5) = True Else PU(5) = False
End Sub

Private Sub chkPeças_Click()
If chkPeças = 1 Then PU(6) = True Else PU(6) = False
End Sub

Private Sub chkPedC_Click()
If chkPedC = 1 Then PU(17) = True Else PU(17) = False

End Sub

Private Sub chkPedidos_Click()
If chkPedidos = 1 Then PU(9) = True Else PU(9) = False

End Sub

Private Sub chkpedM_Click()
If chkpedM = 1 Then PU(18) = True Else PU(18) = False

End Sub

Private Sub chkPedT_Click()
If chkPedT = 1 Then PU(19) = True Else PU(19) = False

End Sub

Private Sub chkProd_Click()
If chkProd = 1 Then PU(7) = True Else PU(7) = False
End Sub

Private Sub chkTipo_Click()
If chkTipo = 1 Then PU(8) = True Else PU(8) = False
End Sub

Private Sub chkTrans_Click()
If chkTrans = 1 Then PU(4) = True Else PU(4) = False
End Sub

Private Sub chkUsu_Click()
If chkUsu = 1 Then PU(12) = True Else PU(12) = False
End Sub

Private Sub cmdExclu_Click()
Call Tirar
        If txtLogin = "Administrador" And txtNome = "Administrador" Then
        MsgBox "O administrador nao pode ser deletedo ou alterado"
        Exit Sub
        End If
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If codigo = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
          
           conecta.Execute "delete * from usuarios where codigo=" & codigo
           cmdNovo = True
           status = "excluidos"
           Call crash1
           Call Usuarios
           End If
           End If
         Call por
End Sub

Private Sub cmdExclu_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exclui um Registro"
pctExcluir.Visible = True
pctluxus.Visible = False
pctNovo.Visible = False
pctSalvar.Visible = False
End Sub

Private Sub cmdnovo_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Limpa todas as caixas de texto"
pctNovo.Visible = True
pctluxus.Visible = False
pctSalvar.Visible = False
End Sub

Private Sub cmdSalvar_Click()
Call Tirar
        If txtLogin = "Administrador" And txtNome = "Administrador" Then
        MsgBox "O administrador nao pode ser deletedo ou alterado"
        Exit Sub
        End If
        If txtNome = Empty Or txtLogin = Empty Or txtSenha = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        If txtSenha <> txtConfSenha Then
        MsgBox "Senhas ncompativeis", vbExclamation
        Exit Sub
        End If
        
     'codigo autometico
        If codigo = Empty Then
        If tabelas.EOF = False And tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 1
        Dim b As Long
        While b = Empty
        
        tabelas.Close
        tabelas.Open "select * from usuarios where codigo=" & a
        If tabelas.BOF = False Or tabelas.EOF = False Then
        a = a + 1
        Else
        b = 1
        End If
        Wend
        Else
        a = 1
        End If
        codigo = a
        b = Clear
        End If
         Call Usuarios
         
     
         
        tabelas.Close
        tabelas.Open "select * from Usuarios where codigo=" & codigo
        If tabelas.BOF = False And tabelas.EOF = False Then
        If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
        status = "alteradas"
        Call salvar
        Call Usuarios
        End If
        Else
        
        
            tabelas.Close
         tabelas.Open "Select * from usuarios where login='" & txtLogin & "'"
         If tabelas.EOF = False And tabelas.BOF = False Then
         MsgBox "Login invalido", vbInformation
         GoTo fim
         End If
         
        
        status = "salvas"
        Call salvar
fim:
        Call Usuarios
        End If
        End If
        Call por
End Sub


Private Sub cmdSalvar_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Salva um cadastro"
pctSalvar.Visible = True
pctluxus.Visible = False
pctExcluir.Visible = False
pctNovo.Visible = False
End Sub


Private Sub cmdNovo_Click()
         txtNome = Clear
         txtLogin = Clear
         txtSenha = Clear
            codigo = Clear
            txtConfSenha = Clear
         Dim check As Object
         
         For Each check In Me.Controls
         If TypeOf check Is CheckBox Then check = 0
         Next
          actskin.ApplySkin Me.hWnd
End Sub


Private Sub Command1_Click()
Call Tirar
            
            If txtNome = Empty Then
            MsgBox "Digite um nome para busca-lo", vbExclamation
            Else
            tabelas.Close
            tabelas.Open "select * from usuarios where nome like '" & Replace(txtNome, "'", "''") & "%'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
           Call mostrar
            End If
            End If
           
            Call Usuarios
            Call por

End Sub

Private Sub Command2_Click()
            Call Tirar
            
            If txtLogin = Empty Then
            MsgBox "Digite um login para busca-lo", vbExclamation
            Else
            tabelas.Close
            tabelas.Open "select * from usuarios where login ='" & Replace(txtLogin, "'", "''") & "'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            End If
            End If
            
            Call Usuarios
            Call por
End Sub

Private Sub Form_Activate()
Call Usuarios
End Sub
Private Sub mostrar()
codigo = tabelas!codigo
 txtNome = tabelas!nome
txtLogin = tabelas!Login
txtSenha = tabelas!senha
  PU(1) = tabelas!clientes
  If PU(1) = True Then chkClientes = 1
  
 PU(2) = tabelas!Forne
 If PU(2) = True Then chkForne = 1
  
  PU(3) = tabelas!desig
  If PU(3) = True Then chkDesi = 1
  
 PU(4) = tabelas!tranp
 If PU(4) = True Then chkTrans = 1
  
 PU(5) = tabelas!Modelos
 If PU(5) = True Then chkMod = 1
  
 PU(6) = tabelas!Peças
 If PU(6) = True Then chkPeças = 1
  
 PU(7) = tabelas!Produtos
 If PU(7) = True Then chkProd = 1
  
 PU(8) = tabelas!tipos
 If PU(8) = True Then chkTipo = 1
  
 PU(9) = tabelas!Pedidos
 If PU(9) = True Then chkPedidos = 1
  
 PU(10) = tabelas!estoque
 If PU(10) = True Then chkestoque = 1
  
 PU(11) = tabelas!calculadora
 If PU(11) = True Then chkCalc = 1
  
 PU(12) = tabelas!Usuarios
 If PU(12) = True Then chkUsu = 1
  
 PU(13) = tabelas!caixa
 If PU(13) = True Then chkCAixa = 1
  
 PU(14) = tabelas!Contas_a_pagar
 If PU(14) = True Then chkCAR = 1
  
 PU(15) = tabelas!Contas_a_receber
 If PU(15) = True Then chkCAP = 1
  
PU(16) = tabelas!CustusFixos
If PU(16) = True Then chkCF = 1

PU(17) = tabelas!pedc
If PU(17) = True Then chkPedC = 1

PU(18) = tabelas!pedm
If PU(18) = True Then chkpedM = 1
 
PU(19) = tabelas!Pedt
If PU(19) = True Then chkPedT = 1

PU(20) = tabelas!contp
If PU(20) = True Then chkContProd = 1

PU(21) = tabelas!contT
If PU(21) = True Then chkContTrans = 1
 


  

End Sub


Private Sub salvar()
If status = "salvas" Then
tabelas.AddNew
End If
tabelas!codigo = codigo
tabelas!nome = txtNome
tabelas!senha = txtSenha
tabelas!Login = txtLogin
tabelas!clientes = PU(1)
tabelas!Forne = PU(2)
tabelas!desig = PU(3)
tabelas!tranp = PU(4)
tabelas!Modelos = PU(5)
tabelas!Peças = PU(6)
tabelas!Produtos = PU(7)
tabelas!tipos = PU(8)
tabelas!Pedidos = PU(9)
tabelas!estoque = PU(10)
tabelas!calculadora = PU(11)
tabelas!Usuarios = PU(12)
tabelas!caixa = PU(13)
tabelas!Contas_a_pagar = PU(14)
tabelas!Contas_a_receber = PU(15)
tabelas!CustusFixos = PU(16)
tabelas!pedc = PU(17)
tabelas!pedm = PU(18)
tabelas!Pedt = PU(19)
tabelas!contp = PU(20)
tabelas!contT = PU(21)



tabelas.Update

Call crash1
Call Usuarios
status = Clear
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            SendKeys "{Tab}"
            End If

End Sub


Private Sub Form_Load()

           
            actskin.ApplySkin Me.hWnd

             actskin2.ApplySkin (cmdSalvar.hWnd)
             actskin2.ApplySkin (cmdNovo.hWnd)
             actskin2.ApplySkin (cmdExclu.hWnd)
            ' actskin2.ApplySkin (TabStrip1.hWnd)
             actskin2.ApplySkin (Frame5.hWnd)
         
            
            Call Usuarios
           
            
            
End Sub

Private Sub Form_Unload(Cancel As Integer)
            If tabelas.State = adStateOpen Then tabelas.Close
End Sub

Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
End Sub

Private Sub Frame2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
End Sub




Private Sub TabStrip1_Click()
Select Case TabStrip1.SelectedItem.Index
Case Is = 1
Frame1.Visible = False
Frame2.Visible = True
Case Is = 2
Frame1.Visible = True
Frame2.Visible = False
End Select
Call carregar_lista
End Sub

Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub



Private Sub txtbuscas_Change()
              If cmbBusca = "R. Social" Then
            tabelas.Close
            tabelas.Open "select * from fornecedores where razaosocial like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "Telefone" Then
             tabelas.Close
             tabelas.Open "select * from fornecedores where telefone like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "CNPJ" Then
            tabelas.Close
             tabelas.Open "select * from fornecedores where cnpj like '" & txtbuscas & "%' order by codigo"
            End If
End Sub
