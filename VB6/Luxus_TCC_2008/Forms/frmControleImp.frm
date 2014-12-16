VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmControleImp 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Relatorios"
   ClientHeight    =   1500
   ClientLeft      =   7005
   ClientTop       =   1965
   ClientWidth     =   4875
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1500
   ScaleWidth      =   4875
   ShowInTaskbar   =   0   'False
   Begin VB.OptionButton optFiltrar 
      Caption         =   "Filtrar"
      Height          =   255
      Left            =   360
      TabIndex        =   7
      Top             =   360
      Width           =   1335
   End
   Begin VB.OptionButton optTodos 
      Caption         =   "Todos"
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   120
      Width           =   1455
   End
   Begin VB.Frame Frame3 
      Height          =   855
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Visible         =   0   'False
      Width           =   3375
      Begin VB.OptionButton OptPag 
         Caption         =   "Pagamento"
         Height          =   255
         Left            =   3360
         TabIndex        =   9
         Top             =   480
         Width           =   1215
      End
      Begin VB.OptionButton optVenc 
         Caption         =   "Vencimento"
         Height          =   255
         Left            =   3360
         TabIndex        =   8
         Top             =   240
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker dt2 
         Height          =   375
         Left            =   1800
         TabIndex        =   4
         Top             =   240
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         Format          =   53542913
         CurrentDate     =   39743
      End
      Begin MSComCtl2.DTPicker dt1 
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         _Version        =   393216
         Format          =   53542913
         CurrentDate     =   39743
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   255
         Left            =   1560
         OleObjectBlob   =   "frmControleImp.frx":0000
         TabIndex        =   6
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Visualizar"
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Imprimir"
      Height          =   375
      Left            =   1920
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
End
Attribute VB_Name = "frmControleImp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Select Case prim

Case 1
Call caixa
Unload Me
Case 2
Call CaReceber
Unload Me
Case 3
Call CaPagar
Unload Me
End Select

End Sub

Private Sub Command2_Click()
Select Case prim

Case 1
Call Visualizarcaixa

Case 2
Call VisualizarCaPagar

Case 3
Call VisualizarCaReceber

End Select


End Sub

Private Sub Form_Load()
actskin.ApplySkin Me.hWnd
actskin2.ApplySkin Command1.hWnd
actskin2.ApplySkin Command2.hWnd
optTodos = True
End Sub

Private Sub optDtVenc_Click()

End Sub

Private Sub optFiltrar_Click()
Frame3.Visible = True
Me.Height = 1990

If prim = 2 Or prim = 3 Then
Frame3.Width = 4695
OptPag = True
End If
End Sub

Private Sub optTodos_Click()
Frame3.Visible = False
Frame3.Width = 3375
Me.Height = 1200
If prim = 1 Then Call caixa
If prim = 2 Then Call Cap
If prim = 1 Then Call Car

End Sub

Private Sub Timer1_Timer()
frmControleImp.Height = frmControleImp.Height + 25
If frmControleImp.Height > 1900 Then Timer1.Enabled = False

End Sub










