VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmB2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Busca Produtos"
   ClientHeight    =   4584
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   6120
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4584
   ScaleWidth      =   6120
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame4 
      Caption         =   "Busca"
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4095
      Begin VB.TextBox txtbuscas 
         Height          =   315
         Left            =   1800
         MaxLength       =   50
         TabIndex        =   4
         Top             =   360
         Width           =   2175
      End
      Begin VB.ComboBox cmbBusca 
         Height          =   315
         ItemData        =   "frmB2.frx":0000
         Left            =   240
         List            =   "frmB2.frx":000D
         TabIndex        =   3
         Text            =   "Nome"
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2040
      TabIndex        =   1
      Top             =   4080
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   4080
      Width           =   1815
   End
   Begin MSFlexGridLib.MSFlexGrid flexClientes 
      Height          =   2895
      Left            =   120
      TabIndex        =   5
      Top             =   1080
      Width           =   5895
      _ExtentX        =   10393
      _ExtentY        =   5101
      _Version        =   393216
      Cols            =   4
      BackColorFixed  =   14737632
      BackColorBkg    =   12632256
      FormatString    =   "Codigo           | Nome                                         |Tipo                   | Cor              "
   End
End
Attribute VB_Name = "frmB2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()

frmPedidos.txtCodprod = flexClientes.TextMatrix(flexClientes.Row, 0)
frmPedidos.mskqtd.PromptInclude = False
frmPedidos.mskqtd = 1
frmPedidos.mskqtd.PromptInclude = True
frmPedidos.Timer2.Enabled = True
Unload Me


End Sub
Private Sub Command2_Click()
Unload Me
End Sub






Private Sub flexClientes_DblClick()
frmPedidos.txtCodprod = flexClientes.TextMatrix(flexClientes.Row, 0)
frmPedidos.mskqtd.PromptInclude = False
frmPedidos.mskqtd = 1
frmPedidos.mskqtd.PromptInclude = True
frmPedidos.Timer2.Enabled = True

Unload Me


End Sub

Private Sub Form_Load()
            Call Produtos
           actskin.ApplySkin Me.hWnd
            
             actskin2.ApplySkin (Command1.hWnd)
             actskin2.ApplySkin (Command2.hWnd)
           
             
            Call carregar_lista

End Sub
Private Sub carregar_lista()
 With flexClientes
             If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "m_designe", conecta, adOpenKeyset, adLockOptimistic
            Dim cont1 As Integer
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "select * from m_designe where codigo=" & tabelas!cod_modelo
            .TextMatrix(cont1, 2) = tabelas2!tipo
            .TextMatrix(cont1, 3) = tabelas!cor
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
           If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "select * from m_designe where codigo=" & tabelas!cod_modelo
            .TextMatrix(cont1, 2) = tabelas2!tipo
            .TextMatrix(cont1, 3) = tabelas!cor
            Else
            cont1 = Clear
            End If
            Wend
            
             End If
            End With
           


           
End Sub
Private Sub Form_Unload(Cancel As Integer)
frmPedidos.Enabled = True

End Sub

Private Sub txtbuscas_Change()
   If cmbBusca.Text = "Nome" Then
             tabelas.Close
             
             tabelas.Open "select * from produtos where nome like '" & Replace(Replace(txtbuscas, "'", "''"), Chr(34), "") & "%' order by codigo"
              Call carregar_lista
            ElseIf cmbBusca.Text = "Codigo" Then
             tabelas.Close
             tabelas.Open "select * from produtos where codigo like '" & Replace(Replace(txtbuscas, "'", "''"), Chr(34), "") & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca.Text = "Tipo" Then
            tabelas.Close
             tabelas.Open "select * from produtos where tipo like '" & Replace(Replace(txtbuscas, "'", "''"), Chr(34), "") & "%' order by codigo"
            Call carregar_lista
            End If
End Sub
