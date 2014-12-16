VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmHistoricoEstoque 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Clientes"
   ClientHeight    =   5820
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   15270
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5820
   ScaleWidth      =   15270
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Buscar"
      Height          =   375
      Left            =   9720
      TabIndex        =   19
      Top             =   720
      Width           =   615
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   255
      Left            =   5880
      OleObjectBlob   =   "frmHistoricoEstoque.frx":0000
      TabIndex        =   17
      Top             =   840
      Width           =   615
   End
   Begin MSComCtl2.DTPicker dt2 
      Height          =   375
      Left            =   8160
      TabIndex        =   16
      Top             =   720
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      _Version        =   393216
      Format          =   203882497
      CurrentDate     =   39743
   End
   Begin MSComCtl2.DTPicker dt1 
      Height          =   375
      Left            =   6480
      TabIndex        =   15
      Top             =   720
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
      _Version        =   393216
      Format          =   203882497
      CurrentDate     =   39743
   End
   Begin MSFlexGridLib.MSFlexGrid flex 
      Height          =   4215
      Left            =   120
      TabIndex        =   13
      Top             =   1320
      Width           =   15135
      _ExtentX        =   26696
      _ExtentY        =   7435
      _Version        =   393216
      Cols            =   11
      BackColorFixed  =   14737632
      BackColorBkg    =   16777215
      FormatString    =   $"frmHistoricoEstoque.frx":0068
   End
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   0
      ScaleHeight     =   675
      ScaleWidth      =   15135
      TabIndex        =   4
      Top             =   5880
      Width           =   15135
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmHistoricoEstoque.frx":014A
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   11
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmHistoricoEstoque.frx":06D4
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   10
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmHistoricoEstoque.frx":0F9E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   9
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmHistoricoEstoque.frx":1C68
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   8
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmHistoricoEstoque.frx":2932
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   7
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmHistoricoEstoque.frx":31FC
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   5
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Label lblh 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "Luxus System"
         Height          =   195
         Left            =   1080
         TabIndex        =   6
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   14655
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   4680
         Top             =   360
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmHistoricoEstoque.frx":3EC6
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   13080
         OleObjectBlob   =   "frmHistoricoEstoque.frx":3F28
         TabIndex        =   2
         Top             =   120
         Width           =   1215
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   360
         OleObjectBlob   =   "frmHistoricoEstoque.frx":3F94
         TabIndex        =   3
         Top             =   120
         Width           =   1455
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel asdf 
      Height          =   375
      Left            =   1200
      OleObjectBlob   =   "frmHistoricoEstoque.frx":4004
      TabIndex        =   12
      Top             =   720
      Width           =   3255
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   375
      Left            =   120
      OleObjectBlob   =   "frmHistoricoEstoque.frx":406A
      TabIndex        =   14
      Top             =   720
      Width           =   975
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
      Height          =   255
      Left            =   7920
      OleObjectBlob   =   "frmHistoricoEstoque.frx":40D2
      TabIndex        =   18
      Top             =   840
      Width           =   615
   End
End
Attribute VB_Name = "frmHistoricoEstoque"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
If tabelas4.State = adStateOpen Then tabelas4.Close
tabelas4.Open "select * from historico_estoque where data between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
Call carrega_lista_porfavor
End Sub

Private Sub Form_Load()
Call Hist_estoque
If tabelas4.State = adStateOpen Then tabelas4.Close
tabelas4.Open "select * from Historico_estoque where cod_estoque=" & algo
actskin.ApplySkin Me.hWnd
actskin2.ApplySkin Frame5.hWnd
Call carrega_lista_porfavor

Call Peças
tabelas.Close
tabelas.Open "select * from peças where codigo=" & algo
If tabelas.EOF = False And tabelas.BOF = False Then
asdf.Caption = tabelas!nome
End If
End Sub

Private Sub carrega_lista_porfavor()
Dim cont As Long
With flex
.Rows = 2
While tabelas4.EOF = False
cont = cont + 1
.TextMatrix(cont, 0) = tabelas4!data
.TextMatrix(cont, 1) = tabelas4!ND
.TextMatrix(cont, 2) = tabelas4!qtd_entrada
.TextMatrix(cont, 3) = Format(tabelas4!entrada_medio, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(cont, 4) = Format(tabelas4!valor_entrada, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(cont, 5) = tabelas4!qtd_saida
.TextMatrix(cont, 6) = Format(tabelas4!saida_medio, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(cont, 7) = Format(tabelas4!valor_saida, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(cont, 8) = tabelas4!Qtd_atual
.TextMatrix(cont, 9) = Format(tabelas4!atual_medio, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(cont, 10) = Format(tabelas4!valor_atual, "R$ #,##0.00;(R$#,##0.00)")
.Rows = .Rows + 1
tabelas4.MoveNext
Wend
If .TextMatrix(.Rows - 1, 0) = Empty Then .RemoveItem (.Rows - 1)

End With
End Sub

Private Sub Timer1_Timer()
  If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub
