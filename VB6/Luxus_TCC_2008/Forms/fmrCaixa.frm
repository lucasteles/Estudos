VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmCaixa 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Caixa"
   ClientHeight    =   4785
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   10980
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4785
   ScaleWidth      =   10980
   Begin VB.CommandButton Command2 
      Caption         =   "Imprimir Relatotio"
      Height          =   255
      Left            =   120
      TabIndex        =   18
      Top             =   4440
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Todos"
      Height          =   372
      Left            =   2640
      Picture         =   "fmrCaixa.frx":0000
      TabIndex        =   17
      ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
      Top             =   4320
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Buscar"
      Height          =   375
      Left            =   3120
      TabIndex        =   13
      Top             =   3600
      Width           =   615
   End
   Begin VB.CommandButton cmdrel 
      Caption         =   "Visualizar Relatotio"
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   4080
      Width           =   1815
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   4920
      Top             =   1320
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   10935
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "fmrCaixa.frx":06DB
         TabIndex        =   9
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   5280
         OleObjectBlob   =   "fmrCaixa.frx":073D
         TabIndex        =   10
         Top             =   120
         Width           =   1335
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "fmrCaixa.frx":07A5
         TabIndex        =   11
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Height          =   2892
      Left            =   0
      TabIndex        =   1
      Top             =   600
      Width           =   3855
      Begin VB.TextBox txtTotal 
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   6
         Top             =   1680
         Width           =   2295
      End
      Begin VB.CommandButton cmdSaque 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Saques"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1800
         TabIndex        =   5
         Top             =   720
         Width           =   1575
      End
      Begin VB.CommandButton cmdDeposito 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Depositos"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1800
         TabIndex        =   4
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtDepo 
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1575
      End
      Begin VB.CommandButton cmdAtu 
         Caption         =   "Atualizar"
         Height          =   375
         Left            =   240
         TabIndex        =   2
         Top             =   2280
         Width           =   1215
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   252
         Left            =   120
         OleObjectBlob   =   "fmrCaixa.frx":0813
         TabIndex        =   7
         Top             =   1320
         Width           =   1332
      End
   End
   Begin MSFlexGridLib.MSFlexGrid msgCaixa 
      Height          =   4095
      Left            =   3840
      TabIndex        =   0
      Top             =   600
      Width           =   7095
      _ExtentX        =   12515
      _ExtentY        =   7223
      _Version        =   393216
      Cols            =   5
      BackColorFixed  =   14737632
      BackColorBkg    =   16777215
      BorderStyle     =   0
      FormatString    =   "Data                                  |Histórico                  |Entrada               |Saida               |Saldo           "
   End
   Begin MSComCtl2.DTPicker dt2 
      Height          =   375
      Left            =   1560
      TabIndex        =   14
      Top             =   3600
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      _Version        =   393216
      Format          =   19202049
      CurrentDate     =   39743
   End
   Begin MSComCtl2.DTPicker dt1 
      Height          =   375
      Left            =   0
      TabIndex        =   15
      Top             =   3600
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
      _Version        =   393216
      Format          =   19202049
      CurrentDate     =   39743
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
      Height          =   255
      Left            =   1320
      OleObjectBlob   =   "fmrCaixa.frx":087D
      TabIndex        =   16
      Top             =   3720
      Width           =   615
   End
End
Attribute VB_Name = "frmCaixa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdAtu_Click()
Call caixa
Call carregar
End Sub

Private Sub cmdConsultar_Click()
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from caixa where data between  #" & Format(dtpINI.Value, "mm/dd/yyyy") & "# and #" & Format(dtpFIM.Value, "mm/dd/yyyy") & "#"
Call carregar
End Sub

Private Sub cmdDeposito_Click()
Dim valores As Double
If txtDepo = Empty Then
MsgBox "Digite um Valor Valído", vbInformation
Exit Sub
Else
If tabelas.BOF = True Or tabelas.EOF = True Then GoTo vvv
tabelas.MoveLast
If tabelas.BOF = False Or tabelas.EOF = False Then
cod = tabelas!codigo
valores = tabelas!valor
vvv:
tabelas.AddNew
tabelas!codigo = cod + 1
tabelas!Parcela = "Saque / deposito"
tabelas!valor = valores + txtDepo
tabelas!entrada = txtDepo
tabelas!data = Date
tabelas.Update
MsgBox "Você fez um depoísito no valor de:" & txtDepo, vbInformation
End If
End If
tabelas.Close
tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
msgCaixa = Clear
msgCaixa = msgCaixa.Rows - msgCaixa.Rows + 1
Call carregar
Call total
txtDepo = Clear

End Sub

Private Sub cmdrel_Click()
Call Visualizarcaixa
End Sub

Private Sub cmdSaque_Click()
Dim valores As Double
If txtDepo = Empty Then
MsgBox "Digite um Valor Valído", vbInformation
Exit Sub

Else
If tabelas.EOF = False And tabelas.BOF = False Then
tabelas.MoveLast
If CCur(txtDepo) <= CCur(tabelas!valor) Then


If tabelas.BOF = False Or tabelas.EOF = False Then
cod = tabelas!codigo
valores = tabelas!valor
tabelas.AddNew
tabelas!codigo = cod + 1
tabelas!valor = valores - txtDepo
tabelas!Parcela = "Saque / deposito"
tabelas!saida = txtDepo
tabelas!data = Date
tabelas.Update
MsgBox "Você fez um saque no valor de:" & txtDepo, vbInformation
End If

Else
MsgBox "O valor que você quer retirar é maior do que você possui em caixa!"
End If
End If
tabelas.Close
tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
Call carregar
Call total
txtSaque = Clear
End If
End Sub

Private Sub Command1_Click()
Call caixa
Call carregar
End Sub

Private Sub Command2_Click()
Call Icaixa
End Sub

Private Sub Command4_Click()
Call caixa
If tabelas.State = adStateOpen Then tabelas.Close
 tabelas.Open "select * from Caixa where data between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
 Call carregar
End Sub

Private Sub Form_Activate()


Call caixa

End Sub
Private Sub total()
Call caixa
tabelas.MoveLast
txtTotal = Format(tabelas!valor, "R$#,##0.00;(R$#,##0.00)")
End Sub


Private Sub Form_Load()

            
            actskin.ApplySkin Me.hWnd
            actskin2.ApplySkin cmdDeposito.hWnd
             actskin2.ApplySkin cmdSaque.hWnd
             actskin2.ApplySkin cmdAtu.hWnd
             'actskin2.ApplySkin cmdConsultar.hWnd
             actskin2.ApplySkin cmdrel.hWnd
             Call caixa
             If tabelas.EOF = False And tabelas.BOF = False Then
             tabelas.MoveLast
             txtTotal = Format(tabelas!valor, "R$#,##0.00;(R$#,##0.00)")
             Else
             txtTotal = Format(0, "R$#,##0.00;(R$#,##0.00)")
             End If
             dt1.Value = Date
           dt2.Value = Date
             Call caixa
             Call carregar
End Sub
Private Sub carregar()
            msgCaixa.Clear
             Dim parc As String
             Dim codped As Long
            msgCaixa.Rows = 2
            msgCaixa.FormatString = "Data               |Histórico                                                |Entrada            |Saida            |Saldo           "
            Do Until tabelas.EOF
            
            
            
            msgCaixa.TextMatrix(msgCaixa.Rows - 1, 0) = Format(IIf(IsNull(tabelas!data), Empty, tabelas!data), "dd/mm/yyyy")
            msgCaixa.TextMatrix(msgCaixa.Rows - 1, 1) = IIf(IsNull(tabelas!Parcela), "", tabelas!Parcela)
            msgCaixa.TextMatrix(msgCaixa.Rows - 1, 2) = Format(IIf(IsNull(tabelas!entrada), "-", tabelas!entrada), "R$ #,##0.00;(R$#,##0.00)")
            msgCaixa.TextMatrix(msgCaixa.Rows - 1, 3) = Format(IIf(IsNull(tabelas!saida), "-", tabelas!saida), "R$ #,##0.00;(R$#,##0.00)")
            msgCaixa.TextMatrix(msgCaixa.Rows - 1, 4) = Format(IIf(IsNull(tabelas!valor), "0", tabelas!valor), "R$ #,##0.00;(R$#,##0.00)")
            tabelas.MoveNext
            msgCaixa.Rows = msgCaixa.Rows + 1
            Loop
            msgCaixa.Rows = msgCaixa.Rows - 1
            Call caixa
            
            
            
            
End Sub

Private Sub campoo()


End Sub

Private Sub Timer1_Timer()
If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub txtDepo_Change()
If Not IsNumeric(txtDepo) Then txtDepo = Clear
End Sub

Private Sub txtSaque_Change()
If Not IsNumeric(txtSaque) Then txtSaque = Clear
End Sub
Private Sub Visualizarcaixa()

On Error Resume Next
frmRela.Pictu.Refresh

frmRela.Pictu.CurrentY = 800
frmRela.Pictu.PaintPicture frmRela.Image1, 200, 10, 2655, 1695
frmRela.Pictu.CurrentX = (frmRela.Pictu.ScaleWidth / 2) - 1600

frmRela.Pictu.FontSize = 15
frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "LUXUS LTDA."

frmRela.Pictu.CurrentY = 1300

frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.FontBold = False
frmRela.Pictu.CurrentY = 1500
frmRela.Pictu.FontSize = 10
frmRela.Pictu.CurrentX = (frmRela.Pictu.ScaleWidth / 2) - 1600
frmRela.Pictu.Print "Relatório de Controle de Caixa"

frmRela.Pictu.FontSize = 8


'tabelas.Close
'tabelas.Open "Caixa", conecta, adOpenKeyset, adLockOptimistic
'If optFiltrar = True Then
'tabelas.Close
'tabelas.Open "select * from caixa where data between #" & Format(dt1.Value, "mm/dd/yyyy") & "# and #" & Format(dt2.Value, "mm/dd/yyyy") & "#"
'End If


'------------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 50
frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Nº"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

For cont = 1 To tabelas.RecordCount
frmRela.Pictu.CurrentX = 50
frmRela.Pictu.Print cont;

frmRela.Pictu.CurrentX = 400
frmRela.Pictu.Print "|"

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack



Next
'------------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 500
frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Data"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

While tabelas.EOF = False
frmRela.Pictu.CurrentX = 500
frmRela.Pictu.Print tabelas!data;

frmRela.Pictu.CurrentX = 1400
frmRela.Pictu.Print "|"

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack



tabelas.MoveNext
Wend
'------------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 1500
frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Historico"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
frmRela.Pictu.CurrentX = 1500
frmRela.Pictu.Print tabelas!Parcela;

frmRela.Pictu.CurrentX = 4900
frmRela.Pictu.Print "|"

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack



tabelas.MoveNext
Wend
'------------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 5000
frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Entrada"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
frmRela.Pictu.CurrentX = 5000
frmRela.Pictu.Print IIf(IsNull(tabelas!entrada), "R$0,00", Format(tabelas!entrada, "R$#,##0.00;(R$#,##0.00)"));

frmRela.Pictu.CurrentX = 6400

frmRela.Pictu.Print "|"

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack



tabelas.MoveNext
Wend

'----------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 6500

frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Saida"
frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250


tabelas.MoveFirst
While tabelas.EOF = False
frmRela.Pictu.CurrentX = 6500
frmRela.Pictu.Print IIf(IsNull(tabelas!saida), "R$0,00", Format(tabelas!saida, "R$#,##0.00;(R$#,##0.00)"));

frmRela.Pictu.CurrentX = 7900

frmRela.Pictu.Print "|"

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack


tabelas.MoveNext
Wend
'----------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 8000

frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Saldo"
frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250


tabelas.MoveFirst

While tabelas.EOF = False
frmRela.Pictu.CurrentX = 8000
frmRela.Pictu.Print IIf(IsNull(tabelas!valor), "R$0,00", Format(tabelas!valor, "R$#,##0.00;(R$#,##0.00)"))

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack


tabelas.MoveNext
Wend
'------------------



End Sub


Private Sub Icaixa()


On Error GoTo 2
Printer.CurrentY = 800
Printer.PaintPicture Picture1, 200, 10, 2655, 1695
Printer.CurrentX = (p.ScaleWidth / 2) - 1600

Printer.FontSize = 15
Printer.FontBold = True
Printer.Print "LUXUS LTDA."

Printer.CurrentY = 1300

Printer.Print String(500, "-")
Printer.FontBold = False

Printer.FontSize = 8


'tabelas.Close
'tabelas.Open "Caixa", conecta, adOpenKeyset, adLockOptimistic

'------------------------
Printer.CurrentY = 1800
Printer.CurrentX = 50
Printer.FontBold = True
Printer.Print "Nº"
Printer.FontBold = False

Printer.CurrentY = 2250

For cont = 1 To tabelas.RecordCount
Printer.CurrentX = 50
Printer.Print cont;

Printer.CurrentX = 400
Printer.Print "|"

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack



Next
'------------------------
Printer.CurrentY = 1800
Printer.CurrentX = 500
Printer.FontBold = True
Printer.Print "Data"

Printer.FontBold = False

p.CurrentY = 2250

While tabelas.EOF = False
Printer.CurrentX = 500
Printer.Print tabelas!data;

Printer.CurrentX = 1400
Printer.Print "|"

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack



tabelas.MoveNext
Wend
'------------------------
Printer.CurrentY = 1800
Printer.CurrentX = 1500
Printer.FontBold = True
Printer.Print "Historico"

Printer.FontBold = False

Printer.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
Printer.CurrentX = 1500
Printer.Print tabelas!Parcela;

Printer.CurrentX = 3400
Printer.Print "|"

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack



tabelas.MoveNext
Wend
'------------------------
Printer.CurrentY = 1800
Printer.CurrentX = 3500
Printer.FontBold = True
Printer.Print "Entrada"

Printer.FontBold = False

Printer.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
Printer.CurrentX = 3500
Printer.Print IIf(IsNull(tabelas!entrada), "R$0,00", Format(tabelas!entrada, "R$#,##0.00;(R$#,##0.00)"));

Printer.CurrentX = 4900

Printer.Print "|"

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack



tabelas.MoveNext
Wend

'----------------------
Printer.CurrentY = 1800
Printer.CurrentX = 5000

Printer.FontBold = True
Printer.Print "Saida"
Printer.FontBold = False

Printer.CurrentY = 2250


tabelas.MoveFirst
While tabelas.EOF = False
Printer.CurrentX = 5000
Printer.Print IIf(IsNull(tabelas!saida), "R$0,00", Format(tabelas!saida, "R$#,##0.00;(R$#,##0.00)"));

Printer.CurrentX = 6900

Printer.Print "|"

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack


tabelas.MoveNext
Wend
'----------------------
Printer.CurrentY = 1800
Printer.CurrentX = 7000

Printer.FontBold = True
Printer.Print "Saldo"
Printer.FontBold = False

Printer.CurrentY = 2250


tabelas.MoveFirst

While tabelas.EOF = False
Printer.CurrentX = 7000
Printer.Print IIf(IsNull(tabelas!valor), "R$0,00", Format(tabelas!valor, "R$#,##0.00;(R$#,##0.00)"))

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack


tabelas.MoveNext
Wend
Printer.EndDoc
Exit Sub
2:
MsgBox "Error na Hora de Imprimir", vbInformation

End Sub



