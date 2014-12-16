VERSION 5.00
Begin VB.Form frmSplash 
   BackColor       =   &H80000009&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   2925
   ClientLeft      =   5625
   ClientTop       =   4845
   ClientWidth     =   6510
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmSplash.frx":08CA
   ScaleHeight     =   2925
   ScaleWidth      =   6510
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer5 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   4440
      Top             =   120
   End
   Begin VB.Timer Timer3 
      Interval        =   10
      Left            =   4920
      Top             =   120
   End
   Begin VB.Timer Timer2 
      Interval        =   10
      Left            =   5520
      Top             =   120
   End
   Begin VB.Timer Timer1 
      Interval        =   7000
      Left            =   4920
      Top             =   600
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Impact"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   510
      Left            =   4440
      TabIndex        =   0
      Top             =   1680
      Width           =   75
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000005&
      X1              =   -360
      X2              =   1080
      Y1              =   1800
      Y2              =   3360
   End
   Begin VB.Image Image2 
      Height          =   615
      Left            =   120
      Picture         =   "frmSplash.frx":5724
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image Image1 
      Height          =   2415
      Left            =   5520
      Picture         =   "frmSplash.frx":4AAD2
      Stretch         =   -1  'True
      Top             =   240
      Width           =   3975
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cont As Integer
Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
    Unload Me
    frmLogin.Show

End Sub

Private Sub Form_Load()
   
    
cont = 1
End Sub



Private Sub Timer1_Timer()
 Unload Me
frmLogin.Show
  
Unload Me


End Sub

Private Sub WindowsMediaPlayer1_OpenStateChange(ByVal NewState As Long)

End Sub

Private Sub Timer2_Timer()
If Image1.Left > 2200 Then Image1.Left = Image1.Left - 20
If Image1.Left = 2200 Then
Timer5.Enabled = True
End If

End Sub

Private Sub Timer3_Timer()
If Image2.Height < 2175 Then
Image2.Height = Image2.Height + 10
Image2.Width = Image2.Width + 10
End If
End Sub


Private Sub Timer4_Timer()
End Sub

Private Sub Timer5_Timer()

If Label1.Caption = "Syste" Then Label1.Caption = "System"

If Label1.Caption = "Syst" Then Label1.Caption = "Syste"


If Label1.Caption = "Sys" Then Label1.Caption = "Syst"


If Label1.Caption = "Sy" Then Label1.Caption = "Sys"


If Label1.Caption = "S" Then Label1.Caption = "Sy"

If Label1.Caption = "" Then Label1.Caption = "S"


End Sub
