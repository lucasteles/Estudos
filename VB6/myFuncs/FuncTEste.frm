VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmCLIENTES 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Functions Teste"
   ClientHeight    =   5175
   ClientLeft      =   2580
   ClientTop       =   2745
   ClientWidth     =   7860
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5175
   ScaleWidth      =   7860
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command4 
      Caption         =   "Limpar"
      Height          =   495
      Left            =   5520
      TabIndex        =   17
      Top             =   4560
      Width           =   2175
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Excluir"
      Height          =   495
      Left            =   2880
      TabIndex        =   15
      Top             =   4560
      Width           =   2535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Salvar"
      Height          =   495
      Left            =   120
      TabIndex        =   14
      Top             =   4560
      Width           =   2655
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   4215
      Left            =   0
      TabIndex        =   0
      Top             =   120
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   7435
      _Version        =   393216
      Style           =   1
      Tabs            =   2
      TabHeight       =   520
      TabCaption(0)   =   "Cadastro"
      TabPicture(0)   =   "FuncTEste.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label2"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Label3"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Label4"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Label5"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Label6"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "txtCODIGO"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "txtRG"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "txtCEP"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "txtBAIRRO"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "txtNOME"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "txtLOGRADOURO"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "Command3"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).ControlCount=   13
      TabCaption(1)   =   "Lista"
      TabPicture(1)   =   "FuncTEste.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "txtBusca"
      Tab(1).Control(1)=   "MSFlexGrid1"
      Tab(1).Control(2)=   "Label7"
      Tab(1).ControlCount=   3
      Begin VB.TextBox txtBusca 
         Height          =   375
         Left            =   -74040
         TabIndex        =   18
         Top             =   480
         Width           =   4575
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   6840
         TabIndex        =   16
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox txtLOGRADOURO 
         Height          =   375
         Left            =   1080
         TabIndex        =   13
         Tag             =   "m(CLI<logradouro>),S"
         Top             =   1680
         Width           =   5895
      End
      Begin VB.TextBox txtNOME 
         Height          =   375
         Left            =   1080
         TabIndex        =   12
         Tag             =   "M(CLI<nome>),S,O"
         Top             =   1080
         Width           =   5655
      End
      Begin VB.TextBox txtBAIRRO 
         Height          =   375
         Left            =   1080
         TabIndex        =   11
         Tag             =   "m(CLI<bairro>),S"
         Top             =   3240
         Width           =   2175
      End
      Begin VB.TextBox txtCEP 
         Height          =   375
         Left            =   1080
         TabIndex        =   10
         Tag             =   "m(CLI<cep>),S"
         Top             =   2640
         Width           =   2175
      End
      Begin VB.TextBox txtRG 
         Height          =   375
         Left            =   1080
         TabIndex        =   9
         Tag             =   "m(CLI<rg>),S"
         Top             =   2160
         Width           =   2175
      End
      Begin VB.TextBox txtCODIGO 
         Height          =   375
         Left            =   1080
         TabIndex        =   2
         Tag             =   "O,PK,S,M(CLI<Codigo>)"
         Top             =   600
         Width           =   2175
      End
      Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
         Height          =   3135
         Left            =   -75000
         TabIndex        =   1
         Top             =   960
         Width           =   7575
         _ExtentX        =   13361
         _ExtentY        =   5530
         _Version        =   393216
         FocusRect       =   2
         HighLight       =   2
         FillStyle       =   1
         SelectionMode   =   1
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Nome"
         Height          =   195
         Left            =   -74640
         TabIndex        =   19
         Top             =   600
         Width           =   420
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Bairro"
         Height          =   195
         Left            =   240
         TabIndex        =   8
         Top             =   3360
         Width           =   405
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "CEP"
         Height          =   195
         Left            =   240
         TabIndex        =   7
         Top             =   2760
         Width           =   315
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "RG"
         Height          =   195
         Left            =   240
         TabIndex        =   6
         Top             =   2280
         Width           =   240
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Endereço"
         Height          =   195
         Left            =   240
         TabIndex        =   5
         Top             =   1680
         Width           =   690
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Nome"
         Height          =   195
         Left            =   240
         TabIndex        =   4
         Top             =   1200
         Width           =   420
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Codigo"
         Height          =   195
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   495
      End
   End
End
Attribute VB_Name = "frmCLIENTES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Call salvar(Me, "clientes", vbMsgYes)
Call carlist

End Sub

Private Sub Command1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Call MoveOnClick(Me, Command1.Name, Button, X, Y)
End Sub

Private Sub Command2_Click()
If Me.txtCODIGO = Empty Then Exit Sub
Call Deletar("clientes", "codigo=" & Me.txtCODIGO, vbMsgYes)
Call carlist
LIMPAR (Me)
End Sub

Private Sub Command2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Call MoveOnClick(Me, Command2.Name, Button, X, Y)
End Sub

Private Sub Command3_Click()
Call Mostrar(Me, "select * from clientes where nome like '" & Replace(Me.txtNOME, "'", "''") & "%'", "cli")
End Sub

Private Sub Command4_Click()
LIMPAR (Me)
End Sub




Private Sub Command4_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Call MoveOnClick(Me, Command4.Name, Button, X, Y)
End Sub

Private Sub Form_Load()
 Formata (Me)
 Call carlist
End Sub

Private Sub carlist()
    Call listar(Me, Me.MSFlexGrid1.Name, "select * from clientes", "codigo,nome,bairro,rg", "Código " & _
        "|Nome  " & Space(50) & "|Bairro " & Space(30) & "|RG" & Space(30), vbListradoYes)
End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Call getXY(X, Y)
End Sub

Private Sub MSFlexGrid1_DblClick()
Call Mostrar(Me, "select * from clientes where codigo =" & MSFlexGrid1.TextMatrix(MSFlexGrid1.Row, 0), "CLI")
    Me.SSTab1.Tab = 0
End Sub

Private Sub MSFlexGrid1_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
    Call MSFlexGrid1_DblClick
End If
End Sub

Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Call MoveOnClick(Me, Picture1.Name, Button, X, Y)

End Sub

Private Sub txtBusca_Change()
    Dim lcSQL As String
    lcSQL = "select * from clientes where nome like '" & Trim(Me.txtBusca) & "%'"
    
    Call listar(Me, Me.MSFlexGrid1.Name, lcSQL, "codigo,nome,bairro,rg", "Código " & _
        "|Nome  " & Space(50) & "|Bairro " & Space(30) & "|RG" & Space(30), vbListradoYes)
End Sub
