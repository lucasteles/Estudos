VERSION 5.00
Begin VB.Form frmBF 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Buscar Foto"
   ClientHeight    =   3570
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7410
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3570
   ScaleWidth      =   7410
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000009&
      Height          =   2415
      Left            =   4920
      ScaleHeight     =   2355
      ScaleWidth      =   2355
      TabIndex        =   5
      Top             =   360
      Width           =   2415
      Begin VB.Image Image1 
         Height          =   2055
         Left            =   0
         Picture         =   "frmBF.frx":0000
         Stretch         =   -1  'True
         Top             =   0
         Width           =   2415
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2040
      TabIndex        =   4
      Top             =   3120
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   3120
      Width           =   1815
   End
   Begin VB.DirListBox Dir1 
      Height          =   2565
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   2295
   End
   Begin VB.FileListBox File1 
      Height          =   2820
      Left            =   2520
      Pattern         =   "*.GIF;*.BMP;*.jpeg;*.jpg;*.png"
      TabIndex        =   1
      Top             =   120
      Width           =   2295
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2295
   End
End
Attribute VB_Name = "frmBF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
On Error GoTo w
If Right(File1.Path, 1) = "\" Then
  caminho = File1.Path & File1.FileName
 
Else
  caminho = File1.Path & "\" & File1.FileName
End If


If Right(File1.Path, 1) = "\" Then
  frmMdisig.Image1.Picture = LoadPicture(File1.Path & File1.FileName)
Else
  frmMdisig.Image1.Picture = LoadPicture(File1.Path & "\" & File1.FileName)
End If
Unload Me
Exit Sub
w:
MsgBox "A imagem nao pode ser encontrada!", vbExclamation
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Dir1_Change()
File1.Path = Dir1.Path

End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive
End Sub

Private Sub File1_Click()
If Right(File1.Path, 1) = "\" Then
  Image1.Picture = LoadPicture(File1.Path & File1.FileName)
Else
  Image1.Picture = LoadPicture(File1.Path & "\" & File1.FileName)
End If

End Sub

Private Sub Form_Load()
         actskin.ApplySkin Me.hWnd
            
             actskin2.ApplySkin (Command1.hWnd)
             actskin2.ApplySkin (Command2.hWnd)
             
            

End Sub

Private Sub Form_Unload(Cancel As Integer)
frmMdisig.Enabled = True

End Sub

