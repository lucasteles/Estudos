VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmPROD 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "PRODUTOS"
   ClientHeight    =   4155
   ClientLeft      =   4515
   ClientTop       =   2745
   ClientWidth     =   3660
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4155
   ScaleWidth      =   3660
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command5 
      Caption         =   "Command5"
      Height          =   375
      Left            =   3000
      TabIndex        =   12
      Top             =   3720
      Width           =   375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Salvar"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   3600
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Excluir"
      Height          =   495
      Left            =   960
      TabIndex        =   1
      Top             =   3600
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Limpar"
      Height          =   495
      Left            =   1800
      TabIndex        =   0
      Top             =   3600
      Width           =   855
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   3375
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   5953
      _Version        =   393216
      Style           =   1
      Tabs            =   2
      TabHeight       =   520
      TabCaption(0)   =   "Cadastro"
      TabPicture(0)   =   "frmPROD.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label2"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label1"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "TXTCODIGO"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Command3"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "txtNOME"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).ControlCount=   5
      TabCaption(1)   =   "Lista"
      TabPicture(1)   =   "frmPROD.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "txtBusca"
      Tab(1).Control(1)=   "MSFlexGrid1"
      Tab(1).Control(2)=   "Label7"
      Tab(1).ControlCount=   3
      Begin VB.TextBox txtNOME 
         Height          =   375
         Left            =   720
         TabIndex        =   6
         Tag             =   "M(P<nome>),S,O"
         Top             =   1080
         Width           =   2535
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   2040
         TabIndex        =   5
         Top             =   480
         Width           =   735
      End
      Begin VB.TextBox txtBusca 
         Height          =   375
         Left            =   -74040
         TabIndex        =   4
         Top             =   480
         Width           =   2295
      End
      Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
         Height          =   2265
         Left            =   -75000
         TabIndex        =   7
         Top             =   960
         Width           =   3255
         _ExtentX        =   5741
         _ExtentY        =   3995
         _Version        =   393216
         FocusRect       =   2
         HighLight       =   2
         FillStyle       =   1
         SelectionMode   =   1
      End
      Begin MSMask.MaskEdBox TXTCODIGO 
         Height          =   375
         Left            =   720
         TabIndex        =   11
         Tag             =   "PK,o,m(P<CODIGO>),S"
         Top             =   480
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Codigo"
         Height          =   195
         Left            =   120
         TabIndex        =   10
         Top             =   480
         Width           =   495
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Nome"
         Height          =   195
         Left            =   120
         TabIndex        =   9
         Top             =   1080
         Width           =   420
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Nome"
         Height          =   195
         Left            =   -74640
         TabIndex        =   8
         Top             =   600
         Width           =   420
      End
   End
End
Attribute VB_Name = "frmPROD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
 Call Desativar(Me)
 Call salvar(Me, "PRODUTOS", vbMsgYes)
 Call LIMPAR(Me)
 Call Form_Load
 Call Ativar(Me)
End Sub

Private Sub Command2_Click()
    Call Desativar(Me)
    Call Deletar("PRODUTOS", " CODIGO= " & Me.TXTCODIGO, vbMsgYes)
    Call LIMPAR(Me)
    Call Form_Load
    Call Ativar(Me)
End Sub

Private Sub Command3_Click()
    Call Desativar(Me)
    Call Mostrar(Me, "SELECT * FROM PRODUTOS WHERE CODIGO=" & TXTCODIGO, "P")
    Call Ativar(Me)
End Sub

Private Sub Command4_Click()
    Call LIMPAR(Me)
End Sub




Private Sub Form_Load()
    Call Formata(Me)
    Call listar(Me, Me.MSFlexGrid1.Name, "SELECT * FROM PRODUTOS", "CODIGO,NOME", "Código  |Nome" & Space(30), vbListradoYes _
                , RGB(200, 255, 200), vbWhite, vbBlack, vbBlack)
End Sub

Private Sub MSFlexGrid1_DblClick()
    Call Desativar(Me)
    Call Mostrar(Me, "SELECT * FROM PRODUTOS WHERE CODIGO=" & MSFlexGrid1.TextMatrix(MSFlexGrid1.Row, 0), "P")
    Me.SSTab1.Tab = 0
    Call Ativar(Me)
End Sub

Private Sub MSFlexGrid1_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call MSFlexGrid1_DblClick
    End If
End Sub

Private Sub txtBusca_Change()
        Call listar(Me, Me.MSFlexGrid1.Name, "SELECT * FROM PRODUTOS WHERE NOME LIKE '" & Me.txtBusca & "%'", "CODIGO,NOME", "Código  |Nome" & Space(30), vbListradoYes _
                , RGB(200, 255, 200), vbWhite, vbBlack, vbBlack)

End Sub
