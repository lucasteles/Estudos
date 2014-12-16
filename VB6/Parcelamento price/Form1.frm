VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{29E17A53-D1DF-4C06-915A-A5DE740F8B1D}#1.0#0"; "AniGIF.ocx"
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form Form1 
   Caption         =   "Parcelamento Sistema PRICE"
   ClientHeight    =   6150
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6150
   ScaleWidth      =   11880
   StartUpPosition =   3  'Windows Default
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
      Height          =   255
      Left            =   3720
      OleObjectBlob   =   "Form1.frx":0442
      TabIndex        =   9
      Top             =   1320
      Width           =   1455
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
      Height          =   255
      Left            =   1920
      OleObjectBlob   =   "Form1.frx":04AC
      TabIndex        =   8
      Top             =   1320
      Width           =   1695
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "Form1.frx":0528
      TabIndex        =   7
      Top             =   1320
      Width           =   1095
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   3840
      OleObjectBlob   =   "Form1.frx":0590
      Top             =   600
   End
   Begin AniGIF.AnimatedGIF AnimatedGIF1 
      Height          =   1050
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   2130
      _ExtentX        =   3757
      _ExtentY        =   1852
      AutoSize        =   -1  'True
      AutoStart       =   -1  'True
      BackColor       =   12648447
      FileName        =   ""
      OctetsFile      =   ""
      Transparent     =   -1  'True
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   390
         Left            =   1320
         OleObjectBlob   =   "Form1.frx":07C4
         TabIndex        =   6
         Top             =   1920
         Width           =   1095
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Calcular"
      Height          =   495
      Left            =   5400
      TabIndex        =   4
      Top             =   1680
      Width           =   735
   End
   Begin VB.TextBox txtSaldo 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Text            =   "27000"
      Top             =   1680
      Width           =   1455
   End
   Begin VB.TextBox txtJuros 
      BackColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   3600
      TabIndex        =   2
      Text            =   "2"
      Top             =   1680
      Width           =   1455
   End
   Begin VB.TextBox txtParc 
      Height          =   375
      Left            =   1800
      TabIndex        =   1
      Text            =   "6"
      Top             =   1680
      Width           =   1455
   End
   Begin MSFlexGridLib.MSFlexGrid mfgPArc 
      Height          =   3855
      Left            =   120
      TabIndex        =   0
      Top             =   2280
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   6800
      _Version        =   393216
      Cols            =   6
      FixedCols       =   0
      BackColor       =   12632256
      BackColorFixed  =   33023
      BackColorBkg    =   0
      GridColor       =   255
      FormatString    =   "      n      |       Juros        |       Amortizaçao     |          Parcela       |        Saldo     |"
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
      Height          =   735
      Left            =   2760
      OleObjectBlob   =   "Form1.frx":083E
      TabIndex        =   10
      Top             =   240
      Width           =   3135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim saldo As Double
Dim juros As Double
Dim Parcela As Double
Dim k As Double
Dim Vj As Double
Dim amort As Double
Dim AmortT As Double
Dim JurosT As Double
Dim ParcelaT As Double
Dim color As Integer


Private Sub Command1_Click()

If txtParc = Empty Or txtJuros = Empty Or txtSaldo = Empty Then
 MsgBox "Digite todos os Campos", vbCritical
Else

If txtJuros = 0 Then
'MsgBox " Digite o juros palhaço", vbCritical

With mfgPArc
Parcela = 1
.Rows = txtParc + 2

saldo = txtSaldo - (txtSaldo / txtParc)
While Parcela <= txtParc
.TextMatrix(Parcela, 3) = Format((txtSaldo / txtParc), "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 0) = Parcela
.TextMatrix(Parcela, 1) = Format("0", "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 2) = Format(txtSaldo / txtParc, "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 4) = Format(saldo, "R$ #,##0.00;($#,##0.00)")
saldo = saldo - (txtSaldo / txtParc)
Parcela = Parcela + 1
Wend
.TextMatrix(Parcela, 3) = Format((txtParc * (txtSaldo / txtParc)), "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 0) = "TOTAL:"
.TextMatrix(Parcela, 1) = Format("0", "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 2) = Format((txtParc * (txtSaldo / txtParc)), "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 4) = Format("0", "R$ #,##0.00;($#,##0.00)")

End With


Else



juros = (txtJuros / 100)
k = (juros * (1 + juros) ^ txtParc) / ((1 + juros) ^ txtParc - 1)
With mfgPArc
.Rows = txtParc + 2

Parcela = 1
saldo = txtSaldo
While Parcela <= txtParc

Vj = juros * saldo
JurosT = JurosT + Vj

amort = (k * txtSaldo) - Vj
AmortT = AmortT + amort

saldo = saldo - amort

.TextMatrix(Parcela, 3) = Format(k * txtSaldo, "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 0) = Parcela
.TextMatrix(Parcela, 1) = Format(Vj, "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 2) = Format(amort, "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 4) = Format(saldo, "R$ #,##0.00;($#,##0.00)")
Parcela = Parcela + 1
Wend
.TextMatrix(Parcela, 3) = Format((k * txtSaldo) * txtParc, "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 0) = "TOTAL:"
.TextMatrix(Parcela, 1) = Format(JurosT, "R$ #,##0.00;($#,##0.00)")
.TextMatrix(Parcela, 2) = Format(AmortT, "R$ #,##0.00;($#,##0.00)")

End With

End If
End If
JurosT = Clear
AmortT = Clear
Call COR
End Sub
Private Sub COR()
Dim linhas As Integer
linhas = 1

While linhas < mfgPArc.Rows
mfgPArc.Row = linhas
mfgPArc.Col = 3
mfgPArc.CellBackColor = &H808080
mfgPArc.CellForeColor = &HFFFFFF

mfgPArc.Row = linhas
mfgPArc.Col = 4
mfgPArc.CellBackColor = &H808080
mfgPArc.CellForeColor = &HFFFFFF

mfgPArc.Row = linhas
mfgPArc.Col = 2
mfgPArc.CellBackColor = &H808080
mfgPArc.CellForeColor = &HFFFFFF

mfgPArc.Row = linhas
mfgPArc.Col = 1
mfgPArc.CellBackColor = &H808080
mfgPArc.CellForeColor = &HFFFFFF

mfgPArc.Row = linhas
mfgPArc.Col = 0
mfgPArc.CellBackColor = &H808080
mfgPArc.CellForeColor = &HFFFFFF

linhas = linhas + 2
Wend
End Sub
Private Sub Form_Load()
AnimatedGIF1.FileName = App.Path & "\people_085.gif"

Skin1.LoadSkin (App.Path & "\PowerFormOrage.skn") ' app.patch indica que o skin esta na mesma página que o projeto
Skin1.ApplySkin Me.hWnd ' aplica o skin
End Sub
