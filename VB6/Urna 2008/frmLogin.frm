VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Urna"
   ClientHeight    =   2130
   ClientLeft      =   2835
   ClientTop       =   3435
   ClientWidth     =   4230
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1258.474
   ScaleMode       =   0  'User
   ScaleWidth      =   3971.741
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   390
      Left            =   1320
      TabIndex        =   2
      Top             =   1560
      Width           =   1140
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   390
      Left            =   2640
      TabIndex        =   3
      Top             =   1560
      Width           =   1140
   End
   Begin VB.TextBox txtPassword 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1410
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   885
      Width           =   2325
   End
   Begin VB.Label lbl1 
      AutoSize        =   -1  'True
      Caption         =   "Senha inicial= 123456"
      Height          =   195
      Left            =   2400
      TabIndex        =   5
      Top             =   1320
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Image Image1 
      Height          =   615
      Left            =   120
      Picture         =   "frmLogin.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Digite a senha  para acessar essa opção "
      Height          =   195
      Index           =   0
      Left            =   840
      TabIndex        =   4
      Top             =   360
      Width           =   2940
   End
   Begin VB.Label lblLabels 
      Caption         =   "&Password:"
      Height          =   270
      Index           =   1
      Left            =   360
      TabIndex        =   0
      Top             =   900
      Width           =   1080
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
           Form1.Show
            Unload Me
End Sub

Private Sub cmdOK_Click()
         
            If txtPassword = tabela!senha Then
            If tabela!senha = 123456 Then MsgBox "Esta senha não é segura, deve trocala o mais breve possivel!", vbExclamation, "Urna"
            
            fim = 1
            Unload Me
            Else
            MsgBox "ERRADO!", vbCritical, "Acesso Negado"
            txtPassword = Clear
            End If
            
End Sub




Private Sub Form_KeyPress(KeyAscii As Integer)
 If KeyAscii = 13 Then cmdOK = True
End Sub

Private Sub Form_Load()
                 focu = 1
                
               If tabela.State = adStateOpen Then tabela.Close
               tabela.Open "senha", conecta, adOpenKeyset, adLockOptimistic
               If tabela!senha = 123456 Then lbl1.Visible = True
End Sub

Private Sub lbl2_Click(Index As Integer)

End Sub

Private Sub Form_Unload(Cancel As Integer)
           
          
            Call destravar
            Form1.cmdconf.Enabled = True
            Form1.Command3.Enabled = True
            Form1.Command2.Enabled = True
End Sub

