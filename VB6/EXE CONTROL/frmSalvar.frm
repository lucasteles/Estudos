VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmSalvar 
   Caption         =   "Salvar"
   ClientHeight    =   3555
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9435
   LinkTopic       =   "Form2"
   ScaleHeight     =   3555
   ScaleWidth      =   9435
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture3 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   3960
      MouseIcon       =   "frmSalvar.frx":0000
      MousePointer    =   99  'Custom
      Picture         =   "frmSalvar.frx":030A
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   13
      Top             =   2280
      Width           =   495
   End
   Begin VB.TextBox txtFile 
      Height          =   375
      Left            =   840
      TabIndex        =   12
      Top             =   2280
      Width           =   3015
   End
   Begin VB.Frame Frame1 
      Caption         =   "FOTO"
      Height          =   2775
      Left            =   5160
      TabIndex        =   6
      Top             =   120
      Width           =   4095
      Begin VB.PictureBox Picture1 
         Height          =   1815
         Left            =   840
         ScaleHeight     =   1755
         ScaleWidth      =   1875
         TabIndex        =   9
         Top             =   720
         Width           =   1935
         Begin VB.Image Image1 
            Height          =   1815
            Left            =   0
            Stretch         =   -1  'True
            Top             =   0
            Width           =   1935
         End
      End
      Begin VB.TextBox txtURL 
         Height          =   375
         Left            =   840
         TabIndex        =   8
         Top             =   240
         Width           =   3015
      End
      Begin VB.PictureBox Picture2 
         BackColor       =   &H00808080&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   2880
         MouseIcon       =   "frmSalvar.frx":0614
         MousePointer    =   99  'Custom
         Picture         =   "frmSalvar.frx":091E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   7
         Top             =   720
         Width           =   495
      End
      Begin MSComDlg.CommonDialog cd 
         Left            =   120
         Top             =   960
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Label Label1 
         Caption         =   "Caminho"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "CANCELAR"
      Height          =   495
      Left            =   7320
      TabIndex        =   5
      Top             =   3000
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   495
      Left            =   5640
      TabIndex        =   4
      Top             =   3000
      Width           =   1575
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "frmSalvar.frx":0C28
      TabIndex        =   2
      Top             =   120
      Width           =   615
   End
   Begin VB.TextBox txtDesc 
      Height          =   1335
      Left            =   960
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   720
      Width           =   3015
   End
   Begin VB.TextBox txtNome 
      Height          =   375
      Left            =   960
      TabIndex        =   0
      Top             =   120
      Width           =   3015
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   6720
      OleObjectBlob   =   "frmSalvar.frx":0C8E
      Top             =   4920
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "frmSalvar.frx":0EC2
      TabIndex        =   3
      Top             =   720
      Width           =   855
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "frmSalvar.frx":0F32
      TabIndex        =   11
      Top             =   2400
      Width           =   615
   End
End
Attribute VB_Name = "frmSalvar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

If txtNome = Empty Or txtFile = Empty Then
    MsgBox "Digite um nome", vbCritical
    Exit Sub
End If

If UCase(Right(txtFile, 4)) <> ".EXE" Then
    MsgBox "Nome de Arquivo(exe) invalido", vbCritical
End If

On Error GoTo aaa
Image1.Picture = LoadPicture(txtURL)

Tabelas.AddNew
Tabelas!ds_nome = txtNome
Tabelas!ds_descricao = txtDesc
Tabelas!ds_url = txtURL
Tabelas!ds_file = txtFile
Tabelas.Update

Unload Me
Unload frmMAin
frmMAin.Show
Exit Sub
aaa:
MsgBox "Caminho de imagem invalido", vbCritical
    
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Skin1.LoadSkin (App.Path & "\31.skn")
Skin1.ApplySkin Me.hWnd

If Tabelas.State = adStateOpen Then Tabelas.Close
Tabelas.Open tb, Conecta, adOpenKeyset, adLockOptimistic
End Sub

Private Sub Picture2_Click()
On Error GoTo error
    cd.InitDir = App.Path
    cd.Filter = "Fichiers Image|*.gif;*.gif;*.bmp;*.jpg;*.jpeg"
    cd.ShowOpen
    txtURL = cd.FileName
    Image1.Picture = LoadPicture(cd.FileName)
    Exit Sub
error:
    MsgBox "erro ao carregar imagem", vbCritical
End Sub

Private Sub Picture3_Click()
On Error GoTo error
    cd.InitDir = App.Path
    cd.Filter = "Fichiers Executables|*.exe"
    cd.ShowOpen
    txtFile = cd.FileName
    Exit Sub
error:
    MsgBox "Este arquivo nao e valido", vbCritical
End Sub

