VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form frmMAIN 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Lucas Teles [Autorun]  =P"
   ClientHeight    =   6960
   ClientLeft      =   150
   ClientTop       =   480
   ClientWidth     =   12930
   DrawMode        =   16  'Merge Pen
   DrawStyle       =   5  'Transparent
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   13.5
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMAIN.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6960
   ScaleWidth      =   12930
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Mini 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   615
      Left            =   12240
      ScaleHeight     =   615
      ScaleWidth      =   735
      TabIndex        =   13
      Top             =   6360
      Width           =   735
      Begin VB.Image Image3 
         Height          =   495
         Left            =   0
         MouseIcon       =   "frmMAIN.frx":08CA
         MousePointer    =   99  'Custom
         Picture         =   "frmMAIN.frx":0BD4
         Stretch         =   -1  'True
         Top             =   0
         Width           =   615
      End
   End
   Begin VB.PictureBox som 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Height          =   615
      Left            =   0
      ScaleHeight     =   615
      ScaleWidth      =   735
      TabIndex        =   12
      Top             =   6360
      Width           =   735
      Begin VB.Image Image2 
         Height          =   495
         Left            =   0
         MouseIcon       =   "frmMAIN.frx":13989
         MousePointer    =   99  'Custom
         Picture         =   "frmMAIN.frx":13C93
         Stretch         =   -1  'True
         Top             =   0
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.Image Image1 
         Height          =   495
         Left            =   0
         MouseIcon       =   "frmMAIN.frx":1A4E5
         MousePointer    =   99  'Custom
         Picture         =   "frmMAIN.frx":1A7EF
         Stretch         =   -1  'True
         Top             =   0
         Width           =   615
      End
   End
   Begin VB.Timer Timer4 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   9480
      Top             =   360
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   360
      Top             =   360
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   120
      Top             =   3840
   End
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   120
      Top             =   3360
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   495
      Left            =   10000
      OleObjectBlob   =   "frmMAIN.frx":29676
      TabIndex        =   10
      Top             =   360
      Width           =   2535
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   0
      OleObjectBlob   =   "frmMAIN.frx":296F3
      Top             =   2880
   End
   Begin Project1.TelesBar TelesBar1 
      Height          =   1575
      Left            =   6480
      TabIndex        =   0
      Top             =   1200
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   "Firefox Portable "
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   6255
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   35
   End
   Begin Project1.TelesBar TelesBar2 
      Height          =   1575
      Left            =   240
      TabIndex        =   1
      Top             =   1200
      Width           =   6255
      _ExtentX        =   6800
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   " Pen-Drive "
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   6255
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   35
   End
   Begin Project1.TelesBar TelesBar5 
      Height          =   1575
      Left            =   6480
      TabIndex        =   2
      Top             =   4560
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   "Jdownloader "
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   6255
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   35
   End
   Begin Project1.TelesBar TelesBar3 
      Height          =   1575
      Left            =   6480
      TabIndex        =   3
      Top             =   2880
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   "Process Explorer "
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   6255
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   35
   End
   Begin Project1.TelesBar TelesBar6 
      Height          =   1575
      Left            =   240
      TabIndex        =   4
      Top             =   4560
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   "PC Wizard"
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   6255
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   35
   End
   Begin Project1.TelesBar TelesBar4 
      Height          =   1575
      Left            =   240
      TabIndex        =   5
      Top             =   2880
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   "Visual Fox Pro "
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   6255
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   35
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   6975
      Left            =   0
      MouseIcon       =   "frmMAIN.frx":29927
      ScaleHeight     =   6975
      ScaleWidth      =   12975
      TabIndex        =   6
      Top             =   0
      Width           =   12975
      Begin VB.Timer Timer5 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   3240
         Top             =   6240
      End
      Begin Project1.TelesGif TelesGif1 
         Height          =   615
         Left            =   720
         TabIndex        =   14
         Top             =   6120
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   1085
         Stretch         =   0   'False
         BackColor       =   0
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Close"
         BeginProperty Font 
            Name            =   "@Arial Unicode MS"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   10440
         TabIndex        =   8
         Top             =   6360
         Width           =   1575
      End
      Begin VB.Frame Frame1 
         Height          =   855
         Left            =   120
         TabIndex        =   7
         Top             =   120
         Width           =   12615
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   375
            Left            =   600
            OleObjectBlob   =   "frmMAIN.frx":29C31
            TabIndex        =   9
            Top             =   240
            Width           =   3015
         End
      End
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   327682
   End
   Begin WMPLibCtl.WindowsMediaPlayer WindowsMediaPlayer1 
      Height          =   735
      Left            =   840
      TabIndex        =   11
      Top             =   6960
      Width           =   3495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   6165
      _cy             =   1296
   End
   Begin VB.Menu mnuV 
      Caption         =   "View"
      Visible         =   0   'False
      Begin VB.Menu mnuOpen 
         Caption         =   "Open"
      End
      Begin VB.Menu mnuPEN 
         Caption         =   "Pen-Drive"
      End
      Begin VB.Menu mnuFirefox 
         Caption         =   "Firefox"
      End
      Begin VB.Menu mnuFox 
         Caption         =   "FoxPro"
      End
      Begin VB.Menu mnuProc 
         Caption         =   "Process Explorer"
      End
      Begin VB.Menu mnuPC 
         Caption         =   "PC Wizard"
      End
      Begin VB.Menu mnuJd 
         Caption         =   "JDownloader"
      End
      Begin VB.Menu t 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSair 
         Caption         =   "Sair"
      End
   End
End
Attribute VB_Name = "frmMAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim lnCONT As Integer
Dim lncor(3) As Long
Dim ARQ As String
Private WithEvents SysTray As CSysTray
Attribute SysTray.VB_VarHelpID = -1


Private Sub Command1_Click()
   Unload Me
End Sub

Private Sub Form_Load()
    Set SysTray = New CSysTray
    Set SysTray.SourceWindow = Me
    SysTray.ChangeIcon App.Path & "\ico.ico"
    SysTray.ToolTip = Me.CAPTION
    
    
    Skin1.LoadSkin App.Path & "\30.skn"
    Skin1.ApplySkin Me.hwnd
    
    Dim lcCAMINHO As String
    lcCAMINHO = App.Path & "\images\"
    TelesBar1.imagem = lcCAMINHO & "firefox.jpg"
    TelesBar2.imagem = lcCAMINHO & "open.ico"
    TelesBar2.texto = TelesBar2.texto & "(" & Mid(App.Path, 1, 2) & ")"
    TelesBar3.imagem = lcCAMINHO & "PE.ico"
    TelesBar4.imagem = lcCAMINHO & "Foxpro.jpg"
    TelesBar5.imagem = lcCAMINHO & "JD.ico"
    TelesBar6.imagem = lcCAMINHO & "PW.ico"
    WindowsMediaPlayer1.URL = lcCAMINHO & "m1.mp3"
    
    TelesGif1.File = lcCAMINHO & "gif1.gif"
    TelesGif1.OpenGif
    
    TelesGif1.Top = 8900
    SkinLabel1.Top = -250
    SkinLabel2.Left = 13000
    Timer3.Enabled = True
    
    ARQ = Replace(App.Path, "\ini", "")
End Sub




Private Sub Form_Unload(Cancel As Integer)
    Cancel = True
    Me.Enabled = False
    Timer1.Enabled = False
    Timer2.Enabled = True
End Sub



Private Sub Image1_Click()
     WindowsMediaPlayer1.Controls.Pause
     TelesGif1.Pause
     Timer5.Enabled = False
     Image2.Visible = True
     Image1.Visible = False
End Sub

Private Sub Image2_Click()
     WindowsMediaPlayer1.Controls.Play
     TelesGif1.Play
     Timer5.Enabled = True
    Image2.Visible = False
     Image1.Visible = True
End Sub

Private Sub Image3_Click()
SysTray.MinToSysTray
End Sub

Private Sub mnuFirefox_Click()
Call TelesBar1_click
End Sub

Private Sub mnuFox_Click()
    Call TelesBar4_click
End Sub

Private Sub mnuJd_Click()
    Call TelesBar5_click
End Sub

Private Sub mnuOpen_Click()
    Me.WindowState = vbNormal
    Me.Show
    App.TaskVisible = True
    SysTray.RemoveFromSysTray
End Sub

Private Sub mnuPC_Click()
    Call TelesBar6_click
End Sub

Private Sub mnuPEN_Click()
 Call TelesBar2_click
End Sub

Private Sub mnuProc_Click()
    Call TelesBar3_click
End Sub

Private Sub mnuSair_Click()
    Unload Me
End Sub





Private Sub SysTray_RButtonUp()
    PopupMenu Me.mnuV
End Sub

Private Sub TelesBar1_click()
        Shell ARQ & "\FirefoxPortable\FirefoxPortable.exe", vbNormalFocus
End Sub


Private Sub TelesBar2_click()
Shell "explorer " & Mid(App.Path, 1, 3), vbMaximizedFocus
End Sub
Private Sub TelesBar3_click()
Shell ARQ & "\procexp.exe"
End Sub
Private Sub TelesBar4_click()
Shell ARQ & "\Microsoft Visual FoxPro 9\vfp9.exe", vbNormalFocus
End Sub

Private Sub TelesBar5_click()
    Shell ARQ & "\JDownloader\JDownloader.exe", vbNormalFocus
End Sub
Private Sub TelesBar6_click()
        Shell ARQ & "\pc wizard\PC Wizard.exe", vbNormalFocus
End Sub

Private Sub Timer1_Timer()
    lnCONT = lnCONT + 1
    SetTrans Me, CByte(lnCONT)
    If lnCONT = 220 Then
        Timer1.Enabled = False
    End If
End Sub

Private Sub Timer2_Timer()
    lnCONT = lnCONT - 1
    SetTrans Me, CByte(lnCONT)
    If lnCONT = 20 Then
        Timer2.Enabled = False
        SysTray.RemoveFromSysTray
        End
    End If
End Sub

Private Sub Timer3_Timer()
    If SkinLabel1.Top < 240 Then
        SkinLabel1.Top = SkinLabel1.Top + 2
    Else
        Timer3.Enabled = False
        Timer4.Enabled = True
    End If
    
End Sub

Private Sub Timer4_Timer()
        If SkinLabel2.Left > 10000 Then
            SkinLabel2.Left = SkinLabel2.Left - 20
        Else
            Timer4.Enabled = False
            Timer5.Enabled = True
        End If
End Sub

Private Sub Timer5_Timer()
        If TelesGif1.Top > 6300 Then
            TelesGif1.Top = TelesGif1.Top - 5
        Else
            Timer5.Enabled = False
        End If
End Sub
