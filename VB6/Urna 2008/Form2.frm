VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   11115
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15240
   LinkTopic       =   "Form2"
   ScaleHeight     =   11115
   ScaleWidth      =   15240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   840
      Top             =   5280
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Urna 2008              Informática Manhã"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   2040
      TabIndex        =   0
      Top             =   9480
      Width           =   4335
   End
   Begin VB.Image Image2 
      Height          =   1950
      Left            =   600
      Picture         =   "Form2.frx":0000
      Top             =   120
      Width           =   1920
   End
   Begin VB.Image Image1 
      Height          =   1815
      Left            =   0
      Picture         =   "Form2.frx":C342
      Top             =   9360
      Width           =   1680
   End
   Begin VB.Image Image3 
      Height          =   11175
      Left            =   0
      Picture         =   "Form2.frx":E7FF
      Stretch         =   -1  'True
      Top             =   0
      Width           =   15255
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyPress(KeyAscii As Integer)
If KeyAscii = 16 Then Unload Me
End Sub

Private Sub Form_Load()
On Error Resume Next
               Form1.Visible = False
               If tabela.State = adStateOpen Then tabela.Close
               tabela.Open "travar", conecta, adOpenKeyset, adLockOptimistic
               
 
End Sub

Private Sub Form_Unload(Cancel As Integer)
Unload Form1
End Sub

Private Sub Timer1_Timer()
            On Error Resume Next
            tabela.MoveFirst
            If tabela!travar = 1 Then
            Form1.Visible = True
            Form1.Show
            Call destravar
            Form1.lblNome.Caption = tabela!Nome
            Form1.lblCurso.Caption = tabela!Curso & " - Turma " & tabela!Turma
            Timer1.Enabled = False
            Form2.Visible = False
            Form1.Enabled = True
            End If
End Sub
