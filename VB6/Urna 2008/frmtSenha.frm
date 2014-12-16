VERSION 5.00
Begin VB.Form frmtSenha 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Login"
   ClientHeight    =   4170
   ClientLeft      =   2835
   ClientTop       =   3435
   ClientWidth     =   3300
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2463.774
   ScaleMode       =   0  'User
   ScaleWidth      =   3098.521
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txt3 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   600
      PasswordChar    =   "*"
      TabIndex        =   4
      Top             =   2880
      Width           =   2295
   End
   Begin VB.TextBox txt1 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   600
      PasswordChar    =   "*"
      TabIndex        =   0
      Top             =   1440
      Width           =   2325
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   390
      Left            =   600
      TabIndex        =   2
      Top             =   3600
      Width           =   1140
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   390
      Left            =   1800
      TabIndex        =   3
      Top             =   3600
      Width           =   1140
   End
   Begin VB.TextBox txt2 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   600
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   2160
      Width           =   2325
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Confirme a nova senha"
      Height          =   195
      Index           =   3
      Left            =   240
      TabIndex        =   8
      Top             =   2640
      Width           =   1635
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Digite a nova senha"
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   7
      Top             =   1920
      Width           =   1425
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Trocar senha"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Index           =   1
      Left            =   1080
      TabIndex        =   6
      Top             =   360
      Width           =   1590
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Digite a senha antiga"
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   5
      Top             =   1200
      Width           =   1500
   End
   Begin VB.Image Image1 
      Height          =   615
      Left            =   240
      Picture         =   "frmtSenha.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "frmtSenha"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub cmdOK_Click()
If txt1 = Empty Or txt2 = Empty Or txt3 = Empty Then
MsgBox "Preencha os campos", vbCritical, "ERRADO"
Else
           tabela.MoveFirst
           If tabela!senha = txt1 And txt2 = txt3 Then
           If Len(txt2) < 6 Or Len(txt3) < 6 Then
           MsgBox "O minimo de caracteres é de seis(6) numeros", vbInformation, "Urna"
           Else
          conecta.Execute "update senha set senha='" & txt3 & "'"
           MsgBox "Operação realizada com sucesso", vbInformation, "URNA"
           Unload Me
           End If
           Else
           MsgBox "A senha antiga esta incorreta ou não a compatibilidade na confirmaçaçao de nova senha!", vbCritical, "ERRADO"
           txt1 = Clear
           txt2 = Clear
           txt3 = Clear
           End If
           End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   If KeyAscii = 13 Then cmdOK = True
End Sub

Private Sub Form_Load()
            focu = 2

            tabela.Close
            tabela.Open "senha", conecta
End Sub

Private Sub Form_Unload(Cancel As Integer)
If tabela!senha = 123456 Then frmLogin.lbl1.Visible = True Else frmLogin.lbl1.Visible = False
frmLogin.Show
focu = 1
End Sub
