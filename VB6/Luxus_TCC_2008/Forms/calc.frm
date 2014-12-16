VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmCalc 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Calculadora Estatistica"
   ClientHeight    =   6945
   ClientLeft      =   300
   ClientTop       =   315
   ClientWidth     =   11910
   Icon            =   "calc.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6945
   ScaleWidth      =   11910
   Begin VB.Frame Frame1 
      Enabled         =   0   'False
      Height          =   3015
      Left            =   120
      TabIndex        =   43
      Top             =   3480
      Width           =   3735
      Begin VB.CommandButton c12 
         Caption         =   "Rou"
         Height          =   375
         Left            =   1800
         TabIndex        =   56
         Top             =   2520
         Width           =   1455
      End
      Begin VB.CommandButton c10 
         Caption         =   "Coeficiente de Variaçao"
         Height          =   375
         Left            =   1800
         TabIndex        =   54
         Top             =   2040
         Width           =   1500
      End
      Begin VB.CommandButton c11 
         Caption         =   "Histograma"
         Height          =   375
         Left            =   120
         TabIndex        =   53
         Top             =   2520
         Width           =   1500
      End
      Begin VB.CommandButton c8 
         Caption         =   "Desvio Padrao"
         Height          =   375
         Left            =   120
         TabIndex        =   52
         Top             =   2040
         Width           =   1500
      End
      Begin VB.CommandButton c6 
         Caption         =   "Percentil"
         Height          =   375
         Left            =   1800
         TabIndex        =   51
         Top             =   600
         Width           =   1500
      End
      Begin VB.CommandButton c4 
         Caption         =   "Quartil-4"
         Height          =   375
         Left            =   1800
         TabIndex        =   50
         Top             =   1560
         Width           =   1500
      End
      Begin VB.CommandButton c2 
         Caption         =   "Quartil-3"
         Height          =   375
         Left            =   120
         TabIndex        =   49
         Top             =   1560
         Width           =   1500
      End
      Begin VB.CommandButton c9 
         Caption         =   "Quartil-2"
         Height          =   375
         Left            =   1800
         TabIndex        =   48
         Top             =   1080
         Width           =   1500
      End
      Begin VB.CommandButton c7 
         Caption         =   "Quartil-1"
         Height          =   375
         Left            =   120
         TabIndex        =   47
         Top             =   1080
         Width           =   1500
      End
      Begin VB.CommandButton c5 
         Caption         =   "Moda"
         Height          =   375
         Left            =   1800
         TabIndex        =   46
         Top             =   120
         Width           =   1500
      End
      Begin VB.CommandButton c3 
         Caption         =   "Mediana"
         Height          =   375
         Left            =   120
         TabIndex        =   45
         Top             =   600
         Width           =   1500
      End
      Begin VB.CommandButton C1 
         Caption         =   "Media"
         Height          =   375
         Left            =   120
         TabIndex        =   44
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.CommandButton cmdDigitar 
      Caption         =   "Digitar"
      Height          =   375
      Left            =   1920
      TabIndex        =   42
      Top             =   1680
      Width           =   1455
   End
   Begin VB.PictureBox Picture6 
      BackColor       =   &H00FFFFFF&
      Height          =   4695
      Left            =   4440
      ScaleHeight     =   4635
      ScaleWidth      =   4275
      TabIndex        =   17
      Top             =   1080
      Visible         =   0   'False
      Width           =   4335
      Begin ACTIVESKINLibCtl.SkinLabel aaa 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "calc.frx":0442
         TabIndex        =   57
         Top             =   3480
         Width           =   3975
      End
      Begin VB.Frame Media 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   39
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel Label1 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":04A0
            TabIndex        =   40
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame moda 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   37
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel lblModa 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":0500
            TabIndex        =   38
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame mediana 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   35
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel lblMediana 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":055E
            TabIndex        =   36
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame quartil1 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   33
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel q1 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":05C2
            TabIndex        =   34
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame quartil3 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   31
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel q3 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":061C
            TabIndex        =   32
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame quartil4 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   29
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel q4 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":0676
            TabIndex        =   30
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame CV 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   27
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel LBLC 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":06D0
            TabIndex        =   28
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame quartil2 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   25
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel q2 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":072A
            TabIndex        =   26
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.Frame DesvioPadrao 
         BackColor       =   &H00FFFFFF&
         Height          =   735
         Left            =   240
         TabIndex        =   23
         Top             =   3720
         Width           =   3615
         Begin ACTIVESKINLibCtl.SkinLabel DP 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "calc.frx":0784
            TabIndex        =   24
            Top             =   240
            Width           =   3375
         End
      End
      Begin VB.PictureBox Picture7 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Height          =   3375
         Left            =   3960
         ScaleHeight     =   3375
         ScaleWidth      =   3495
         TabIndex        =   18
         Top             =   0
         Width           =   3495
      End
      Begin VB.PictureBox Picture3 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   135
         Left            =   120
         ScaleHeight     =   135
         ScaleWidth      =   5700
         TabIndex        =   21
         Top             =   3120
         Width           =   5700
      End
      Begin VB.PictureBox Picture2 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   135
         Left            =   120
         ScaleHeight     =   135
         ScaleWidth      =   5580
         TabIndex        =   20
         Top             =   90
         Width           =   5580
      End
      Begin VB.PictureBox Picture1 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   2805
         Left            =   2610
         ScaleHeight     =   2805
         ScaleWidth      =   15
         TabIndex        =   19
         Top             =   360
         Width           =   15
      End
      Begin MSFlexGridLib.MSFlexGrid flex2 
         Height          =   3015
         Left            =   120
         TabIndex        =   22
         Top             =   195
         Width           =   9345
         _ExtentX        =   16484
         _ExtentY        =   5318
         _Version        =   393216
         Cols            =   5
         FixedCols       =   0
         BackColor       =   16777215
         ForeColor       =   0
         BackColorFixed  =   8421504
         ForeColorFixed  =   16777215
         BackColorBkg    =   16777215
         GridColor       =   16777215
         GridColorFixed  =   16777215
         Enabled         =   0   'False
         BorderStyle     =   0
         Appearance      =   0
         FormatString    =   "Faturamento                                  |Dias                     |Ponto Medio|Media| Fiac"
      End
   End
   Begin VB.Frame Frame11 
      Height          =   2295
      Left            =   120
      TabIndex        =   8
      Top             =   1080
      Width           =   3735
      Begin VB.CommandButton Command12 
         Caption         =   "< Volta"
         Height          =   495
         Left            =   360
         TabIndex        =   55
         Top             =   1680
         Width           =   1695
      End
      Begin VB.CommandButton cmdImp 
         Caption         =   "Importar"
         Height          =   375
         Left            =   360
         TabIndex        =   41
         Top             =   600
         Width           =   1455
      End
      Begin VB.TextBox text1 
         Height          =   375
         Left            =   480
         TabIndex        =   16
         Top             =   600
         Visible         =   0   'False
         Width           =   2895
      End
      Begin VB.CommandButton Command1 
         Cancel          =   -1  'True
         Caption         =   "Adiciona"
         Height          =   495
         Left            =   360
         TabIndex        =   15
         Top             =   1080
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Remove"
         Height          =   495
         Left            =   1320
         TabIndex        =   14
         Top             =   1080
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Limpa"
         Height          =   495
         Left            =   2280
         TabIndex        =   13
         Top             =   1080
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         ItemData        =   "calc.frx":07DE
         Left            =   360
         List            =   "calc.frx":0806
         TabIndex        =   12
         Text            =   "Escolha o mês"
         Top             =   240
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Criar"
         Height          =   495
         Left            =   2760
         TabIndex        =   11
         Top             =   1680
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.CommandButton cmdimportar 
         Caption         =   "Importar do Caixa"
         Enabled         =   0   'False
         Height          =   375
         Left            =   960
         TabIndex        =   10
         Top             =   600
         Visible         =   0   'False
         Width           =   2055
      End
      Begin VB.ComboBox cmdAno 
         Height          =   315
         Left            =   1920
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   240
         Visible         =   0   'False
         Width           =   1215
      End
   End
   Begin VB.Frame Frame5 
      Height          =   975
      Left            =   120
      TabIndex        =   4
      Top             =   0
      Width           =   12120
      Begin VB.PictureBox Picture5 
         BorderStyle     =   0  'None
         DrawStyle       =   5  'Transparent
         Height          =   495
         Left            =   600
         Picture         =   "calc.frx":086F
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   7
         Top             =   240
         Width           =   495
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
         Height          =   375
         Left            =   1560
         OleObjectBlob   =   "calc.frx":0CB1
         TabIndex        =   5
         Top             =   360
         Width           =   2175
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel15 
         Height          =   375
         Left            =   3960
         OleObjectBlob   =   "calc.frx":0D1D
         TabIndex        =   6
         Top             =   360
         Width           =   2055
      End
   End
   Begin MSChart20Lib.MSChart msc 
      Height          =   3975
      Left            =   3960
      OleObjectBlob   =   "calc.frx":0D89
      TabIndex        =   3
      Top             =   1920
      Visible         =   0   'False
      Width           =   7815
   End
   Begin MSFlexGridLib.MSFlexGrid flex1 
      Height          =   5775
      Left            =   4440
      TabIndex        =   1
      Top             =   960
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   10186
      _Version        =   393216
      FixedCols       =   0
      BackColorFixed  =   12632256
      FormatString    =   " Dias         |   Valor               "
   End
   Begin MSFlexGridLib.MSFlexGrid flex3 
      Height          =   5775
      Left            =   4800
      TabIndex        =   2
      Top             =   960
      Visible         =   0   'False
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   10186
      _Version        =   393216
      BackColor       =   -2147483628
      BackColorFixed  =   12632256
      FormatString    =   "Percent          | Valor                                        "
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   375
      Left            =   -1080
      TabIndex        =   0
      Top             =   2880
      Visible         =   0   'False
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
      _Version        =   393216
      Format          =   19202049
      CurrentDate     =   39672
      MaxDate         =   2958435
   End
End
Attribute VB_Name = "frmCalc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dias As Integer
Dim linha As Integer
Dim mes As Integer
Dim freq(10) As Long
Dim Freq_ac(10) As Long
Dim Pm(10) As Double
Dim pm_X As Double
Dim Fatu(10, 2) As Long
Dim asdf As Integer
Dim anos As Long


Private Sub C1_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Media"
Media.Visible = True
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c10_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Coeficiente de Variaçao"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = True
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c11_Click()
Command5 = True
Picture6.Visible = False
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = True
flex1.Visible = False


End Sub

Private Sub c12_Click()
Command5 = True
Picture6.Visible = False
aaa.Caption = "Mediana"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = True

End Sub

Private Sub c2_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Quartil-3"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = True
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c3_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Mediana"
Media.Visible = False
mediana.Visible = True
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False


End Sub

Private Sub c4_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Quartil-4"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = True
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c5_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Moda"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = True
moda.Caption = ""
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c6_Click()
Command5 = True
Picture6.Visible = False
aaa.Caption = "Percentil"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = True
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c7_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Quartil-1"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = True
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c8_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Desvio Padrao"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = True
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub c9_Click()
Command5 = True
Picture6.Visible = True
aaa.Caption = "Quartil-2"
Media.Visible = False
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = True
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = False

End Sub

Private Sub cmdDigitar_Click()
Combo1.Visible = True
cmdAno.Visible = False
cmdimportar.Visible = False

cmdDigitar.Visible = False
cmdImp.Visible = False

Command1.Visible = True
Command2.Visible = True
Command3.Visible = True
text1.Visible = True

End Sub

Private Sub cmdImp_Click()
Combo1.Visible = True
cmdAno.Visible = True
cmdimportar.Visible = True

cmdDigitar.Visible = False
cmdImp.Visible = False

Command1.Visible = False
Command2.Visible = False
Command3.Visible = False
text1.Visible = False

End Sub

Private Sub cmdIMPORT_Click()

End Sub

Private Sub cmdimportar_Click()
If cmdAno.Text = Empty Then Exit Sub
Call Command3_Click
Dim calc As Integer
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "caixa", conecta, adOpenKeyset, adLockOptimistic

calc = 1

While calc <= asdf
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "select sum(entrada) as lucas from caixa where data = #" & mes & "/" & calc & "/" & cmdAno.Text & "#"




If tabelas2.EOF = False And tabelas2.BOF = False Then
flex1.TextMatrix(flex1.Rows - 1, 0) = calc
flex1.TextMatrix(flex1.Rows - 1, 1) = IIf(IsNull(tabelas2!lucas), Format(0, "R$ #,##0.00;(R$#,##0.00)"), Format(tabelas2!lucas, "R$ #,##0.00;(R$#,##0.00)"))

If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "val", conecta, adOpenKeyset, adLockOptimistic
tabelas.AddNew
tabelas!dias = calc
tabelas!Val = IIf(IsNull(tabelas2!lucas), Format(0, "R$ #,##0.00;(R$#,##0.00)"), Format(tabelas2!lucas, "R$ #,##0.00;(R$#,##0.00)"))
tabelas.Update

Else
flex1.TextMatrix(flex1.Rows - 1, 0) = calc
flex1.TextMatrix(flex1.Rows - 1, 1) = Format(0, "R$ #,##0.00;(R$#,##0.00)")

If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "val", conecta, adOpenKeyset, adLockOptimistic
tabelas.AddNew
tabelas!dias = calc
tabelas!Val = 0
tabelas.Update


End If

flex1.Rows = flex1.Rows + 1
calc = calc + 1
Wend

If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "val", conecta, adOpenKeyset, adLockOptimistic

If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from val order by dias"

Command5.Enabled = True
Frame1.Enabled = True
End Sub

Private Sub Combo1_Click()
On Error GoTo error

If Combo1 = "Janeiro" Then
mes = 1
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True

text1.Enabled = True
ElseIf Combo1 = "Fevereiro" Then
mes = 2
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Março" Then
mes = 3
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Abril" Then
mes = 4
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Maio" Then
mes = 5
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Junho" Then
mes = 6
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Julho" Then
mes = 7
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Agosto" Then
mes = 8
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Setembro" Then
mes = 9
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Outubro" Then
mes = 10
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Novembro" Then
mes = 11
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
ElseIf Combo1 = "Dezembro" Then
mes = 12
Command1.Enabled = True
Command2.Enabled = True
cmdimportar.Enabled = True
text1.Enabled = True
End If

DTPicker1.Day = 27

DTPicker1.Month = mes

Dim c As Integer
While c = Empty
DTPicker1.Day = DTPicker1.Day + 1
asdf = DTPicker1.Day
Wend
c = Empty
error:
DTPicker1.Day = asdf
Call Command3_Click
End Sub

Private Sub Command1_Click()
If text1 = Clear Then
GoTo a
End If


With flex1
If dias = DTPicker1.Day Then
Command1.Enabled = False
Command5.Enabled = True
Frame1.Enabled = True
frmCalc.KeyPreview = False
Else
Command1.Enabled = True
frmCalc.KeyPreview = True
End If

conecta.Execute "insert into val(dias,val)values('" & dias & "','" & text1.Text & "')"
tabelas.Close
tabelas.Open "val", conecta, adOpenKeyset, adLockOptimistic
    tabelas.MoveLast
  .TextMatrix(linha, 0) = tabelas!dias
  .TextMatrix(linha, 1) = Format(tabelas!Val, "R$ #,##0.00;(R$#,##0.00)")
  .Rows = linha + 2
  linha = linha + 1
  dias = dias + 1
  
  End With


a:
End Sub

Private Sub Command12_Click()
Combo1.Visible = False
cmdAno.Visible = False
cmdimportar.Visible = False

cmdDigitar.Visible = True
cmdImp.Visible = True

Command1.Visible = False
Command2.Visible = False
Command3.Visible = False
text1.Visible = False

End Sub

Private Sub Command18_Click()

End Sub

Private Sub Command2_Click()
On Error GoTo a
Command5.Enabled = False
Command1.Enabled = True
Frame1.Enabled = False
With flex1
.RemoveItem (.Rows - 2)
dias = dias - 1
linha = linha - 1
End With
tabelas.MoveLast
conecta.Execute "delete * from val where dias =" & dias

a:
End Sub

Private Sub Command3_Click()
Command1.Enabled = True
frmCalc.KeyPreview = True
Command5.Enabled = False
Frame1.Enabled = False

Media.Visible = False
Picture6.Visible = False
flex2.Clear
flex2.Rows = 2
flex2.FormatString = "Faturamento                                  |Dias                     |Ponto Medio|Media| Fiac"
mediana.Visible = False
quartil1.Visible = False
quartil2.Visible = False
quartil3.Visible = False
quartil4.Visible = False
DesvioPadrao.Visible = False
CV.Visible = False
flex3.Visible = False
moda.Visible = False
msc.Visible = False
flex1.Visible = True
lamina = Clear
pm_X = Clear
flex1.Clear
flex1.Cols = 2
flex1.Rows = 2
linha = 1
dias = 1
flex1.FormatString = "Dias             |Valor              "

conecta.Execute "delete * from val"
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "val", conecta, adOpenKeyset, adLockOptimistic

End Sub

Private Sub Command4_Click()

End Sub

Private Sub Command5_Click()

Dim k As Double
Dim a As Integer
Dim H As Double
Dim AA As Double
Dim Lmax As Double
Dim Lmin As Double
Dim cont2 As Integer
Dim H1 As Double
Dim Vmax As Double
Dim Vmin As Double
Dim cont1 As Long
Dim Frq As Long
Dim d1 As Double
Dim d2 As Double
Dim Fiac As Long
Dim desvio As Double
Dim coe As Double
Dim Media As Double
tabelas.Close
tabelas.Open "select max(val) as l from val"
If tabelas!l = 0 Then GoTo m


If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "val", conecta, adOpenKeyset, adLockOptimistic

k = 1 + 3.3 * Log(DTPicker1.Day) / Log(10)

If Mid(k, 3, 1) >= 5 Then
a = 1
Else
a = 0
End If
k = Mid(k, 1, 1) + a

k = k + 1

flex2.Rows = k + 4
k = k - 1
'------------------------------------------------------------

tabelas.Close
tabelas.Open "select max(val) as l from val"
Lmax = tabelas!l

tabelas.Close
tabelas.Open " select min(val) as l from val"
Lmin = tabelas!l


AA = Lmax - Lmin

H = AA / k


cont2 = 1
While cont2 <> Empty
tra = 1

If Mid(H, cont2, 1) = Chr(44) Or Mid(H, cont2, 1) = "" Then
H1 = Mid(H, 1, cont2)
If IIf(Mid(H, cont2 + 1, 1) = "", 0, Mid(H, cont2 + 1, 1)) > 5 Then H1 = H1 + 1
cont2 = Clear
Else
cont2 = cont2 + 1
End If
Wend
H = H1
cont2 = Clear
'------------------------------------------------------------------

Vmax = Lmin + H
Vmin = Lmin

cont1 = 1





While cont1 < k + 1
volta:
'adiciona valores na serie


flex2.TextMatrix(cont1, 0) = Format(Vmin, "R$#,##0.00;(R$#,##0.00)") & "  I-  " & Format(Vmax, "R$#,##0.00;(R$#,##0.00)")
Fatu(cont1, 1) = Vmin
Fatu(cont1, 2) = Vmax

'calcula o ponto medio
Pm(cont1) = (Vmax + Vmin) / 2



'seleciona numeros da frequencia
tabelas.Close
tabelas.Open "select count(val) as l from val where val between " & Vmin & " and " & Vmax
Frq = tabelas!l


tabelas.Close
tabelas.Open "select count(val) as l from val where val=" & Vmax
If tabelas!l <> Frq Then
Frq = Frq - tabelas!l
End If

flex2.TextMatrix(cont1, 1) = Frq
freq(cont1) = Frq

Fiac = Fiac + Frq
Freq_ac(cont1) = Fiac

soma_frec = soma_frec + Frq

'atribui novos valores para as varaveis
Vmin = Vmax
Vmax = Vmax + H
cont1 = cont1 + 1
Wend

If soma_frec < DTPicker1.Day Then GoTo volta


'Boss one(1) media
cont1 = 1
While cont1 <> Empty
Media = Media + (Pm(cont1) * freq(cont1))
cont1 = cont1 + 1
If cont1 >= 8 Then cont1 = Empty
Wend
Media = Media / DTPicker1.Day
Label1.Caption = Format(Media, "R$#,##0.00;(R$#,##0.00)")
'K.O Winneeeeeer FATALITY


'Boss Two(2)moda
cont1 = 1
Dim n As Integer
While cont1 <> Empty
If freq(cont1) >= n Then
n = freq(cont1)
c = cont1
End If
cont1 = cont1 + 1
If cont1 >= 8 Then cont1 = Empty
Wend
d1 = freq(c) - freq(c - 1)
d2 = freq(c) - freq(c + 1)
moda = Fatu(c, 1) + ((d1 / (d1 + d2)) * H)
lblModa.Caption = Format(moda, "R$#,##0.00;(R$#,##0.00)")
'K.O Flawless Victory


'boss three(3) mediana
cont1 = 1
While cont1 <> Empty
If Freq_ac(cont1) >= (DTPicker1.Day / 2) Then
n = cont1
cont1 = Empty
Else
cont1 = cont1 + 1
End If
Wend
Dim mediana As Double
mediana = Fatu(n, 1) + ((((DTPicker1.Day / 2) - Freq_ac(n - 1)) * H) / freq(n))
lblMediana.Caption = Format(mediana, "R$#,##0.00;(R$#,##0.00)")
'K.O Perfect

'boss Four(4) quartil
cont1 = 1
While cont1 <> Empty
If Freq_ac(cont1) >= (DTPicker1.Day / 4) Then
n = cont1
cont1 = Empty
Else
cont1 = cont1 + 1
End If
Wend
Dim quartil As Double
quartil = Fatu(n, 1) + ((((DTPicker1.Day / 4) - Freq_ac(n - 1)) * H) / freq(n))
q1.Caption = Format(quartil, "R$#,##0.00;(R$#,##0.00)")
q2.Caption = Format(mediana, "R$#,##0.00;(R$#,##0.00)")

'quartil 3
cont1 = 1
While cont1 <> Empty
If Freq_ac(cont1) >= ((3 * DTPicker1.Day) / 4) Then
n = cont1
cont1 = Empty
Else
cont1 = cont1 + 1
End If
Wend
Dim quartil3 As Double
quartil3 = Fatu(n, 1) + ((((3 * DTPicker1.Day) / 4) - Freq_ac(n - 1)) * H) / freq(n)
q3.Caption = Format(quartil3, "R$#,##0.00;(R$#,##0.00)")

tabelas.Close
tabelas.Open "select max(val) as l from val"

q4.Caption = Format(tabelas!l, "R$#,##0.00;(R$#,##0.00)")
'perferct victory

'boss five(5) Percentil
Dim mendonça As Double
cont1 = 1
While cont1 <= 100
mendonça = (cont1 * DTPicker1.Day) / 100
cont2 = 1
While cont2 <> Empty
If Freq_ac(cont2) >= mendonça Then
n = cont2
cont2 = Empty
Else
cont2 = cont2 + 1
If cont2 >= 8 Then cont2 = Empty
End If
Wend
flex3.Rows = cont1 + 1
flex3.TextMatrix(cont1, 0) = "Percentil-" & cont1
flex3.TextMatrix(cont1, 1) = Format(CCur(Fatu(n, 1) + ((mendonça - Freq_ac(n - 1)) * H) / freq(n)), "R$#,##0.00;(R$#,##0.00)")
cont1 = cont1 + 1
Wend

r = 8
While r > 4
If freq(r) = 0 Then
Fatu(r, 1) = Clear
Fatu(r, 2) = Clear
Pm(r) = Clear
r = r - 1
Else
GoTo a
End If
Wend
a:

'MsgBox Fatu(1, 1) & "-" & Fatu(1, 2) & "-" & Fatu(2, 1) & "-" & Fatu(2, 2) & "-" & Fatu(3, 1) & "-" & Fatu(3, 2) & "-" & Fatu(4, 1) & "-" & Fatu(4, 2) & "-" & Fatu(5, 1) & "-" & Fatu(5, 2) & "-" & Fatu(6, 1) & "-" & Fatu(6, 2) & "-" & Fatu(7, 1) & "-" & Fatu(7, 2) & "-" & Fatu(8, 1) & "-" & Fatu(8, 2)
 ' The lost Boss, "6" Gimijou
Dim lamina As Double
cont1 = 1
While cont1 <> Empty
If Pm(cont1) <> 0 Then
pm_X = pm_X + ((Pm(cont1) - Media) ^ 2)
End If
cont1 = cont1 + 1
If cont1 >= 8 Then cont1 = Empty

Wend


lamina = Sqr((pm_X / DTPicker1.Day))
DP.Caption = Format(lamina, "R$#,##0.00;(R$#,##0.00)")
LBLC.Caption = Format((lamina / Media), "#,#0.0%;(#,#0.0%)")

lamina = Clear
pm_X = Clear

'Total
flex2.Rows = flex2.Rows + 1
flex2.Row = k + 5
flex2.Col = 0
flex2.CellBackColor = &H808080
flex2.CellForeColor = vbWhite

flex2.Row = k + 5
flex2.Col = 1
flex2.CellBackColor = &H808080
flex2.CellForeColor = vbWhite


flex2.TextMatrix(k + 5, 0) = "Total"
flex2.TextMatrix(k + 5, 1) = soma_frec

Command5.Enabled = False

cont1 = 1
While cont1 <> Empty
'If Fatu(cont1, 1) = 0 Then GoTo Y
msc.RowCount = cont1
msc.Row = cont1
msc.RowLabel = Fatu(cont1, 1) & "-|" & Fatu(cont1, 2)
msc.data = freq(cont1)
'Y:
cont1 = cont1 + 1
If cont1 > 8 Then cont1 = Clear '
Wend
Exit Sub
m: MsgBox "Não há valor neste mês para realizar o calculo", vbInformation

End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
Command1 = True
text1 = Clear
End If
End Sub
Private Sub ano()
        If tabelas.State = adStateOpen Then tabelas.Close
        tabelas.Open "Caixa", conecta, adOpenKeyset, adLockOptimistic
        
    
        If tabelas.EOF = False And tabelas.BOF = False Then
        tabelas.MoveFirst
        If tabelas.EOF = False And tabelas.BOF = False Then
        Dim ContANo As Long
        Dim t As Long
        While tabelas.EOF = False
        If Year(tabelas!data) <= t Then
        Else
        cmdAno.AddItem (Year(tabelas!data))
        t = Year(tabelas!data)
        End If
        tabelas.MoveNext
        Wend
        End If
        End If
End Sub

Private Sub Form_Load()
               
                actskin4.ApplySkin Me.hWnd

                Dim d As Object
                For Each d In Me.Controls
                If TypeOf d Is CommandButton Then actskin2.ApplySkin (d.hWnd)
                Next
                
                
                If Combo1 = "Escolha o mês" Then
                Command1.Enabled = False
                Command2.Enabled = False
                Command5.Enabled = False
                Frame1.Enabled = False
                text1.Enabled = False
            
                End If
                Call ano
            
                

If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Val", conecta, adOpenKeyset, adLockOptimistic
linha = 1
dias = 1
flex2.Cols = 2
flex1.Cols = 2
Command3 = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
Call Command3_Click
End Sub

Private Sub lblquart_Click()

End Sub

Private Sub SkinLabel11_DragDrop(Source As Control, x As Single, Y As Single)

End Sub

Private Sub SkinLabel9_DragDrop(Source As Control, x As Single, Y As Single)

End Sub

Private Sub SkinLabel6_DragDrop(Source As Control, x As Single, Y As Single)

End Sub

Private Sub Text1_Change()
If Not IsNumeric(text1) Then text1 = Clear
If KeyAscii Then text1 = Clear

End Sub



