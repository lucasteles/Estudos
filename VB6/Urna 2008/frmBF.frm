VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
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
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2040
      TabIndex        =   5
      Top             =   3120
      Width           =   1575
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   3255
      Left            =   4920
      TabIndex        =   4
      Top             =   0
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   5741
      _Version        =   393216
      Tabs            =   1
      TabHeight       =   520
      TabCaption(0)   =   "Foto"
      TabPicture(0)   =   "frmBF.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Image1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      Begin VB.Image Image1 
         Height          =   2655
         Left            =   120
         Stretch         =   -1  'True
         Top             =   480
         Width           =   2175
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   3120
      Width           =   1815
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   5280
      OleObjectBlob   =   "frmBF.frx":001C
      Top             =   3000
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
      Pattern         =   "*.GIF;*.BMP;*.JPG"
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

If Right(File1.Path, 1) = "\" Then
  frmCad.Text4.Text = File1.Path & File1.FileName
Else
  frmCad.Text4.Text = File1.Path & "\" & File1.FileName
End If
Unload Me
  frmCad.Enabled = True
  frmCad.Command4 = True
End Sub

Private Sub Command2_Click()
Unload Me
frmCad.Enabled = True
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
Skin1.LoadSkin (App.Path & "\AniMode.skn") ' app.patch indica que o skin esta na mesma página que o projeto
             Skin1.ApplySkin Me.hWnd ' aplica o skin

Dir1.Path = App.Path

End Sub

Private Sub Form_Unload(Cancel As Integer)
frmCad.Enabled = True
End Sub
