VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMAin 
   Caption         =   "EXE MANEGEMENT       By. LUCAS  XD"
   ClientHeight    =   6600
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   8430
   Icon            =   "EXECONTROL.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6600
   ScaleWidth      =   8430
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog cd 
      Left            =   3960
      Top             =   3120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000008&
      BorderStyle     =   0  'None
      Height          =   6615
      Left            =   0
      ScaleHeight     =   6615
      ScaleWidth      =   8415
      TabIndex        =   0
      Top             =   0
      Width           =   8415
      Begin VB.PictureBox Picture3 
         BackColor       =   &H00FF8080&
         Height          =   1095
         Left            =   120
         Picture         =   "EXECONTROL.frx":1068F
         ScaleHeight     =   1035
         ScaleWidth      =   4275
         TabIndex        =   7
         Top             =   5400
         Width           =   4335
         Begin VB.CommandButton Command2 
            Caption         =   "Iniciar"
            Height          =   615
            Left            =   240
            TabIndex        =   9
            Top             =   240
            Width           =   1935
         End
         Begin VB.CommandButton cmdSair 
            Caption         =   "Sair"
            Height          =   615
            Left            =   2280
            TabIndex        =   8
            Top             =   240
            Width           =   1935
         End
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H80000012&
         Height          =   735
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   8175
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   735
            Left            =   120
            OleObjectBlob   =   "EXECONTROL.frx":62675
            TabIndex        =   6
            Top             =   120
            Width           =   7935
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BeginProperty Font 
               Name            =   "Arial Black"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   675
            Left            =   0
            TabIndex        =   5
            Top             =   0
            Width           =   180
         End
      End
      Begin VB.Timer Timer2 
         Interval        =   5000
         Left            =   120
         Top             =   6240
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   1200
         Top             =   6240
      End
      Begin VB.TextBox txtDescriçao 
         Height          =   1455
         Left            =   4560
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   3
         Top             =   5040
         Width           =   3735
      End
      Begin VB.PictureBox Picture2 
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H000000FF&
         Height          =   3615
         Left            =   4680
         ScaleHeight     =   3555
         ScaleWidth      =   3555
         TabIndex        =   2
         Top             =   1200
         Width           =   3615
         Begin VB.Image Image1 
            Height          =   3615
            Left            =   0
            Stretch         =   -1  'True
            Top             =   0
            Width           =   3615
         End
      End
      Begin VB.ListBox lstEXE 
         Height          =   4155
         Left            =   240
         TabIndex        =   1
         Top             =   1200
         Width           =   4095
      End
      Begin VB.Image Image2 
         Height          =   6615
         Left            =   0
         Stretch         =   -1  'True
         Top             =   0
         Width           =   8415
      End
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   4920
      OleObjectBlob   =   "EXECONTROL.frx":626FD
      Top             =   5640
   End
   Begin VB.Menu mnuQrc 
      Caption         =   "Arquivo"
      Begin VB.Menu mnuInc 
         Caption         =   "&Incuir"
      End
      Begin VB.Menu mnuExc 
         Caption         =   "&Excluir"
      End
      Begin VB.Menu asdf 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSair 
         Caption         =   "&Sair"
      End
   End
   Begin VB.Menu aaa 
      Caption         =   "aaa"
      Enabled         =   0   'False
      Visible         =   0   'False
      Begin VB.Menu q 
         Caption         =   "m1"
      End
      Begin VB.Menu qq 
         Caption         =   "m2"
      End
      Begin VB.Menu qqq 
         Caption         =   "m3"
      End
      Begin VB.Menu qqqq 
         Caption         =   "m4"
      End
      Begin VB.Menu qqqqq 
         Caption         =   "m5"
      End
      Begin VB.Menu qqqqqq 
         Caption         =   "m6"
      End
   End
End
Attribute VB_Name = "frmMAin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dnID(999) As Integer
Dim dcURL As String


Private Sub cmdSair_Click()
Unload Me
End Sub

Private Sub Command2_Click()
On Error GoTo ss
If Not dcURL = Empty Then
    Dim a As String
    Dim c As Integer
    Dim ww As String
   
    c = 1
    
    While c > 0
        ww = Mid(dcURL, (Len(dcURL) - (c - 1)), 1)
        'MsgBox ww
    
        If ww = "\" Then
             a = Mid(dcURL, (Len(dcURL) - (c - 2)), Len(dcURL))
            c = 0
           ' MsgBox a
        Else
            c = c + 1
        End If
    Wend

    cd.InitDir = dcURL
    cd.FileName = a
    cd.Filter = "Fichiers Executables|" & a
    SendKeys Chr(13)
    cd.ShowOpen
    
    Shell dcURL, vbNormalFocus
    
End If
Unload Me
Exit Sub
ss:
    MsgBox "O arquivo nao pode ser encontrado em: " & dcURL

End Sub

Private Sub Command2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbRightButton Then
    PopupMenu aaa
End If

End Sub

Private Sub Form_Load()
Skin1.LoadSkin (App.Path & "\31.skn")
Skin1.ApplySkin Me.hWnd

BanK (App.Path & "\exe.mdb")

If Tabelas.State = adStateOpen Then Tabelas.Close
Tabelas.Open tb, Conecta, adOpenKeyset, adLockOptimistic

If img.State = adStateOpen Then img.Close
img.Open tb, Conecta, adOpenKeyset, adLockOptimistic

If img.EOF = False And img.BOF = False Then
    img.MoveFirst
    Me.Image2.Picture = LoadPicture(img!ds_url)
End If

If Tabelas.EOF = False And Tabelas.BOF = False Then
    For c = 1 To Tabelas.RecordCount
        dnID(c) = Tabelas!pk_id
        lstEXE.AddItem (Tabelas!ds_nome)
        Tabelas.MoveNext
    Next
End If
End Sub

Private Sub lstEXE_Click()
    If Tabelas.State = adStateOpen Then Tabelas.Close
    Tabelas.Open "select * from tb_exe where pk_id=" & dnID(lstEXE.ListIndex + 1)
    txtDescriçao = Tabelas!ds_descricao
    txtNome = Tabelas!ds_file
    
    On Error GoTo o
    Image1.Picture = LoadPicture(Tabelas!ds_url)
    dcURL = Tabelas!ds_file
    Exit Sub
    
o:
Image1.Picture = LoadPicture("")
MsgBox "imagem nao encontrada em: " & Tabelas!ds_url, vbCritical
End Sub

Private Sub mnuExc_Click()
Conecta.Execute "delete * from tb_exe where pk_id=" & dnID(lstEXE.ListIndex + 1)
Unload Me
frmMAin.Show
End Sub

Private Sub mnuInc_Click()
frmSalvar.Show
End Sub

Private Sub mnuSair_Click()
Call cmdSair_Click
End Sub

Private Sub q_Click()
On Error GoTo ss
If Not dcURL = Empty Then
    Shell dcURL
End If
Exit Sub
ss:
    MsgBox "O arquivo nao pode ser encontrado em: " & dcURL
End Sub

Private Sub qq_Click()
On Error GoTo ss
If Not dcURL = Empty Then
    Shell dcURL, vbHide
End If
Exit Sub
ss:
    MsgBox "O arquivo nao pode ser encontrado em: " & dcURL
End Sub

Private Sub qqq_Click()
On Error GoTo ss
If Not dcURL = Empty Then
    Shell dcURL, vbMaximizedFocus
End If
Exit Sub
ss:
    MsgBox "O arquivo nao pode ser encontrado em: " & dcURL
End Sub

Private Sub qqqq_Click()
On Error GoTo ss
If Not dcURL = Empty Then
    Shell dcURL, vbMinimizedFocus
End If
Exit Sub
ss:
    MsgBox "O arquivo nao pode ser encontrado em: " & dcURL
End Sub

Private Sub qqqqq_Click()
On Error GoTo ss
If Not dcURL = Empty Then
    Shell dcURL, vbMinimizedNoFocus
End If
Exit Sub
ss:
    MsgBox "O arquivo nao pode ser encontrado em: " & dcURL
End Sub

Private Sub qqqqqq_Click()
On Error GoTo ss
If Not dcURL = Empty Then
    Shell dcURL, vbNormalNoFocus
End If
Exit Sub
ss:
    MsgBox "O arquivo nao pode ser encontrado em: " & dcURL
End Sub

Private Sub Timer1_Timer()
If Frame1.Left < 8000 Then
Frame1.Left = Frame1.Left + 25
Else
Frame1.Left = -8000
End If

End Sub

Private Sub Timer2_Timer()
On Error GoTo Y

If img.EOF = False And img.BOF = False Then

Y:
    img.MoveNext
    If img.EOF = True Or img.BOF = True Then
        img.MoveFirst
    End If
Me.Image2.Picture = LoadPicture(img!ds_url)

End If
End Sub

Private Sub txtDescriçao_DblClick()
    On Error GoTo error
    cd.InitDir = App.Path
    cd.Filter = "Fichiers Executables|*.exe"
    cd.ShowOpen
    Shell cd.FileName
    Exit Sub
error:
    MsgBox "Este arquivo nao e valido", vbCritical
End Sub
