VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form MyFuncs 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "MyFuncs"
   ClientHeight    =   5370
   ClientLeft      =   1995
   ClientTop       =   2745
   ClientWidth     =   9345
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5370
   ScaleWidth      =   9345
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command7 
      Caption         =   "Buscar"
      Height          =   375
      Left            =   2520
      TabIndex        =   25
      Top             =   240
      Width           =   735
   End
   Begin VB.Frame Frame2 
      Caption         =   "PRODUTO"
      Height          =   1815
      Left            =   120
      TabIndex        =   16
      Top             =   3480
      Width           =   3855
      Begin VB.CommandButton Command8 
         Caption         =   "REM"
         Height          =   375
         Left            =   2880
         TabIndex        =   26
         Top             =   1320
         Width           =   735
      End
      Begin VB.CommandButton Command6 
         Caption         =   "ADD"
         Height          =   375
         Left            =   1920
         TabIndex        =   24
         Top             =   1320
         Width           =   735
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   2280
         TabIndex        =   18
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox TXTNOMEPROD 
         Height          =   375
         Left            =   960
         TabIndex        =   17
         Tag             =   "M(2<NOME>),"
         Top             =   840
         Width           =   2535
      End
      Begin MSMask.MaskEdBox TXTFK_RODUTO 
         Height          =   375
         Left            =   960
         TabIndex        =   19
         Tag             =   "M(2<CODIGO>)"
         Top             =   360
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox TXTQTD 
         Height          =   375
         Left            =   960
         TabIndex        =   23
         Top             =   1320
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "QTD"
         Height          =   195
         Left            =   120
         TabIndex        =   22
         Top             =   1320
         Width           =   345
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Nome"
         Height          =   195
         Left            =   120
         TabIndex        =   21
         Top             =   840
         Width           =   420
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Codigo"
         Height          =   195
         Left            =   120
         TabIndex        =   20
         Top             =   360
         Width           =   495
      End
   End
   Begin MSMask.MaskEdBox txtNUMERO 
      Height          =   375
      Left            =   1200
      TabIndex        =   12
      Tag             =   "O,S,M(3<NUMERO>),PK"
      Top             =   240
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   6
      Mask            =   "######"
      PromptChar      =   "_"
   End
   Begin MSMask.MaskEdBox txtDATA 
      Height          =   375
      Left            =   1200
      TabIndex        =   11
      Tag             =   "O,N,S,M(3<DATA>)"
      Top             =   720
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   10
      Mask            =   "##/##/####"
      PromptChar      =   "_"
   End
   Begin VB.Frame Frame1 
      Caption         =   "Cliente"
      Height          =   2175
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   3975
      Begin VB.TextBox txtLogradouro 
         Height          =   375
         Left            =   960
         TabIndex        =   14
         Tag             =   "m(1<logradouro>),1"
         Top             =   1320
         Width           =   2535
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   2280
         TabIndex        =   13
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox txtNome 
         Height          =   375
         Left            =   960
         TabIndex        =   6
         Tag             =   "m(1<nome>),1"
         Top             =   840
         Width           =   2535
      End
      Begin MSMask.MaskEdBox txtFK_CLIENTE 
         Height          =   375
         Left            =   960
         TabIndex        =   15
         Tag             =   "o,m(1<CODIGO>,3<FK_CLIENTE>),S"
         Top             =   360
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Endereço"
         Height          =   195
         Left            =   120
         TabIndex        =   8
         Top             =   1320
         Width           =   690
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Nome"
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   840
         Width           =   420
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Codigo"
         Height          =   195
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Width           =   495
      End
   End
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   4215
      Left            =   4320
      TabIndex        =   3
      Top             =   120
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   7435
      _Version        =   393216
      Cols            =   3
      FormatString    =   "CODIGO       |NOME                                       |QTD           "
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Salva"
      Height          =   495
      Left            =   7440
      TabIndex        =   2
      Top             =   4560
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Exclui"
      Height          =   495
      Left            =   6000
      TabIndex        =   1
      Top             =   4560
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Limpa"
      Height          =   495
      Left            =   4320
      TabIndex        =   0
      Top             =   4560
      Width           =   1575
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Data"
      Height          =   195
      Left            =   240
      TabIndex        =   10
      Top             =   720
      Width           =   345
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "N. Pedido"
      Height          =   195
      Left            =   240
      TabIndex        =   9
      Top             =   240
      Width           =   705
   End
End
Attribute VB_Name = "MyFuncs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Call LIMPAR(Me)
Me.MSFlexGrid1.Rows = 1
Me.MSFlexGrid1.Rows = 2
End Sub

Private Sub Command2_Click()
Call Desativar(Me)
Call Deletar("ITENS", " FK_PEDIDO= " & Me.txtNUMERO)
Call Deletar("PEDIDOS", " NUMERO= " & Me.txtNUMERO, vbMsgYes)
Call Command1_Click
Call Ativar(Me)
End Sub

Private Sub Command3_Click()
Dim CONT As Integer
Call Desativar(Me)
Call salvar(Me, "pedidos", vbMsgYes)
Call Deletar("ITENS", " FK_PEDIDO=" & txtNUMERO, vbMsgNo)
For CONT = 1 To Me.MSFlexGrid1.Rows - 1
    Call INSERT("ITENS", "FK_PRODUTO,QUANTIDADE,FK_PEDIDO", MSFlexGrid1.TextMatrix(CONT, 0) & "," & _
    TXTQTD & "," & txtNUMERO, False)
Next
Call Ativar(Me)
End Sub

Private Sub Command4_Click()
Call Desativar(Me)
Call Mostrar(Me, "select * from clientes where codigo = " & Me.txtFK_CLIENTE, "1")
Call Ativar(Me)
End Sub

Private Sub Command5_Click()
Call Desativar(Me)
Call Mostrar(Me, "select * from PRODUTOS where codigo = " & Me.TXTFK_RODUTO, "2")
Call Ativar(Me)
End Sub

Private Sub Command6_Click()
Dim VALORES As String
Call Desativar(Me)
VALORES = TXTFK_RODUTO & "," & TXTNOMEPROD & "," & TXTQTD
Call ADD(Me, Me.MSFlexGrid1.Name, VALORES)
Call Ativar(Me)
End Sub

Private Sub Command7_Click()
Dim QUERIE As String
Call Desativar(Me)
Me.txtDATA.PromptInclude = False
Call Mostrar(Me, "SELECT * FROM PEDIDOS WHERE NUMERO=" & txtNUMERO, "3")

QUERIE = "SELECT " & _
             "ITE.FK_PRODUTO," & _
             "PRO.NOME," & _
             "ITE.QUANTIDADE" & _
         " FROM ITENS AS ITE " & _
         " LEFT JOIN PRODUTOS AS PRO ON PRO.CODIGO=ITE.FK_PRODUTO " & _
         "WHERE ITE.FK_PEDIDO = " & txtNUMERO

Call listar(Me, MSFlexGrid1.Name, QUERIE, "FK_PRODUTO,NOME,QUANTIDADE", _
            "CODIGO     |NOME               |QTD     ", vbListradoYes)
            
Me.txtDATA.PromptInclude = True
Command4 = True
Call Ativar(Me)
End Sub

Private Sub Command8_Click()
 Call REMOVE(Me, Me.MSFlexGrid1.Name)
End Sub

Private Sub Form_Load()
Call Formata(Me)
End Sub

Private Sub TXTFK_RODUTO_LostFocus()
Call Command5_Click
End Sub
