VERSION 5.00
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmimp 
   BackColor       =   &H8000000E&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Impressao de Grafico"
   ClientHeight    =   8490
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   8535
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8490
   ScaleWidth      =   8535
   ShowInTaskbar   =   0   'False
   Begin MSChart20Lib.MSChart MSChart1 
      Height          =   6135
      Left            =   120
      OleObjectBlob   =   "frmimp.frx":0000
      TabIndex        =   1
      ToolTipText     =   "Clique aqui para iniciar a impressao"
      Top             =   2040
      Width           =   8295
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Imprimir"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7320
      MouseIcon       =   "frmimp.frx":1B3A
      TabIndex        =   2
      Top             =   8160
      Width           =   1095
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ELEIÇÕES MANHÃ 2008"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   2760
      TabIndex        =   0
      Top             =   840
      Width           =   5475
   End
   Begin VB.Image Image1 
      Height          =   1950
      Left            =   360
      Picture         =   "frmimp.frx":1E44
      Top             =   0
      Width           =   1920
   End
End
Attribute VB_Name = "frmimp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim X As Integer
Dim grafic As Integer


If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic


 X = Clear
            grafic = 1
            If tabela.EOF = False Or tabela.BOF = False Then
            tabela.MoveFirst
            MSChart1.Row = grafic
             MSChart1.RowLabel = tabela!nome
             MSChart1.Data = tabela!votos
             MSChart1.ColumnLabel = "votos"
            While X = Empty
            tabela.MoveNext
            If tabela.EOF = False Then
            grafic = grafic + 1
            MSChart1.RowCount = grafic
             MSChart1.Row = grafic
             MSChart1.RowLabel = tabela!nome
             MSChart1.Data = tabela!votos
           Else
            X = 1
            End If
            Wend
            End If
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label2.ForeColor = vbBlack
End Sub

Private Sub Label2_Click()
Label2.Visible = False
PrintForm
Printer.EndDoc
Label2.Visible = True

End Sub

Private Sub Label2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label2.ForeColor = vbBlue
End Sub


