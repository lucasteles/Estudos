VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{D27CDB6B-AE6D-11CF-96B8-444553540000}#1.0#0"; "Flash9f.ocx"
Object = "{3050F1C5-98B5-11CF-BB82-00AA00BDCE0B}#4.0#0"; "mshtml.tlb"
Begin VB.Form asdf 
   Caption         =   "Form2"
   ClientHeight    =   7020
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8175
   LinkTopic       =   "Form2"
   ScaleHeight     =   7020
   ScaleWidth      =   8175
   StartUpPosition =   3  'Windows Default
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   2400
      OleObjectBlob   =   "asdf.frx":0000
      Top             =   6720
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   6615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   11668
      _Version        =   393216
      Tab             =   2
      TabHeight       =   520
      TabCaption(0)   =   "PV"
      TabPicture(0)   =   "asdf.frx":0234
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "SkinLabel1"
      Tab(0).Control(1)=   "SkinLabel2"
      Tab(0).Control(2)=   "SkinLabel3"
      Tab(0).Control(3)=   "SkinLabel4"
      Tab(0).Control(4)=   "flex1"
      Tab(0).Control(5)=   "Command1"
      Tab(0).Control(6)=   "txtSaldo"
      Tab(0).Control(7)=   "txtJuros"
      Tab(0).Control(8)=   "txtParcelas"
      Tab(0).Control(9)=   "txtA"
      Tab(0).Control(10)=   "Command2"
      Tab(0).ControlCount=   11
      TabCaption(1)   =   "Tab 1"
      TabPicture(1)   =   "asdf.frx":0250
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Command3"
      Tab(1).Control(1)=   "flash"
      Tab(1).ControlCount=   2
      TabCaption(2)   =   "Tab 2"
      TabPicture(2)   =   "asdf.frx":026C
      Tab(2).ControlEnabled=   -1  'True
      Tab(2).Control(0)=   "Scriptlet1"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).ControlCount=   1
      Begin VB.CommandButton Command3 
         Caption         =   "Command3"
         Height          =   1335
         Left            =   -73560
         TabIndex        =   13
         Top             =   2760
         Width           =   855
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Reiniciar"
         Height          =   495
         Left            =   -67800
         TabIndex        =   11
         Top             =   960
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtA 
         BackColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   -69360
         TabIndex        =   9
         Text            =   "5000"
         Top             =   1080
         Width           =   1455
      End
      Begin VB.TextBox txtParcelas 
         Enabled         =   0   'False
         Height          =   375
         Left            =   -72960
         TabIndex        =   8
         Text            =   " 1"
         Top             =   1080
         Width           =   1455
      End
      Begin VB.TextBox txtJuros 
         BackColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   -71160
         TabIndex        =   7
         Text            =   "2"
         Top             =   1080
         Width           =   1455
      End
      Begin VB.TextBox txtSaldo 
         Height          =   375
         Left            =   -74640
         TabIndex        =   6
         Text            =   "27000"
         Top             =   1080
         Width           =   1455
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Calcular"
         Height          =   495
         Left            =   -67800
         TabIndex        =   5
         Top             =   960
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid flex1 
         Height          =   4455
         Left            =   -74760
         TabIndex        =   1
         Top             =   1920
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   7858
         _Version        =   393216
         Cols            =   6
         FixedCols       =   0
         BackColor       =   12632256
         BackColorFixed  =   33023
         BackColorBkg    =   0
         GridColor       =   255
         FormatString    =   "      N      |       Juros        |       Amortizaçao     |          Parcela       |        Saldo     |"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   255
         Left            =   -70800
         OleObjectBlob   =   "asdf.frx":0288
         TabIndex        =   2
         Top             =   720
         Width           =   1455
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   255
         Left            =   -72840
         OleObjectBlob   =   "asdf.frx":02F2
         TabIndex        =   3
         Top             =   720
         Width           =   1695
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   255
         Left            =   -74400
         OleObjectBlob   =   "asdf.frx":0370
         TabIndex        =   4
         Top             =   720
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   -69360
         OleObjectBlob   =   "asdf.frx":03D8
         TabIndex        =   10
         Top             =   720
         Width           =   1455
      End
      Begin ShockwaveFlashObjectsCtl.ShockwaveFlash flash 
         Height          =   2895
         Left            =   -72240
         TabIndex        =   12
         Tag             =   "C:\Documents and Settings\LT\Meus documentos\inutilitarios\BARATA.exe"
         Top             =   720
         Width           =   3015
         _cx             =   5318
         _cy             =   5106
         FlashVars       =   ""
         Movie           =   "C:\Documents and Settings\LT\Meus documentos\inutilitarios\BARATA.exe"
         Src             =   "C:\Documents and Settings\LT\Meus documentos\inutilitarios\BARATA.exe"
         WMode           =   "Window"
         Play            =   -1  'True
         Loop            =   -1  'True
         Quality         =   "High"
         SAlign          =   ""
         Menu            =   -1  'True
         Base            =   ""
         AllowScriptAccess=   ""
         Scale           =   "ShowAll"
         DeviceFont      =   0   'False
         EmbedMovie      =   0   'False
         BGColor         =   ""
         SWRemote        =   ""
         MovieData       =   ""
         SeamlessTabbing =   -1  'True
         Profile         =   0   'False
         ProfileAddress  =   ""
         ProfilePort     =   0
         AllowNetworking =   "all"
         AllowFullScreen =   "false"
      End
      Begin MSHTMLCtl.Scriptlet Scriptlet1 
         Height          =   1095
         Left            =   360
         TabIndex        =   14
         Top             =   600
         Width           =   1335
         Scrollbar       =   0   'False
         URL             =   "about:blank"
      End
   End
End
Attribute VB_Name = "asdf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim juros As Double
Dim Parcela As Double
Dim e As Double
Dim r As Double
Dim t As Double
Dim y As Double
Dim u As Double
Dim i As Double
Dim o As Double
Dim s As Double



Private Sub Command1_Click()
txtSaldo.Enabled = False


juros = (txtJuros / 100) * txtSaldo
Parcela = txtA + juros

If s = Empty Then
s = txtSaldo
e = s - txtA
Else
e = e - txtA
End If

If e <= 0 Then
Command1.Visible = False
e = 0
Command2.Visible = True

End If

flex1.Rows = flex1.Rows + 1

flex1.TextMatrix(r, 0) = txtParcelas
flex1.TextMatrix(r, 1) = juros
flex1.TextMatrix(r, 2) = txtA
flex1.TextMatrix(r, 3) = Parcela
flex1.TextMatrix(r, 4) = e



t = txtParcelas + 1
txtParcelas = t




u = u + juros
i = i + txtA
o = o + Parcela


flex1.TextMatrix(r + 1, 0) = "Total"
flex1.TextMatrix(r + 1, 1) = u
flex1.TextMatrix(r + 1, 2) = i
flex1.TextMatrix(r + 1, 3) = o



r = r + 1



End Sub

Private Sub Command2_Click()
Command1.Visible = True
Command2.Visible = False
flex1.Clear
e = Clear
s = Clear
r = Clear
u = Clear
i = Clear
o = Clear
y = Clear
Parcela = Clear
txtA = Clear
juros = Clear
txtParcelas = Clear
txtJuros = Clear
txtSaldo = Clear

End Sub

Private Sub Command3_Click()
Shell "C:\Documents and Settings\LT\Meus documentos\inutilitarios\Dancer.exe", vbNormalFocus
'C:\Documents and Settings\LT\Meus documentos\inutilitarios\BARATA.exe
End Sub

Private Sub Form_Load()
Skin1.LoadSkin (App.Path & "\WinVistaBlue II.skn") ' app.patch indica que o skin esta na mesma página que o projeto
Skin1.ApplySkin Me.hWnd ' aplica o skin
r = 1
Dim c As String
c = App.Path & "\ht.html"
MsgBox c
Scriptlet1.URL = "C:\Documents and Settings\LT\Desktop\Pasta do Curso (infob27)\Linguagem de Programassao\vb\Parcelamento price\ht.html"
End Sub



