VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmContTrans 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Controle de Produção"
   ClientHeight    =   5205
   ClientLeft      =   180
   ClientTop       =   705
   ClientWidth     =   6810
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5205
   ScaleWidth      =   6810
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer2 
      Interval        =   10
      Left            =   6360
      Top             =   960
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   4455
      Left            =   120
      TabIndex        =   4
      Top             =   720
      Width           =   6615
      Begin VB.Timer Timer3 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   5160
         Top             =   -120
      End
      Begin VB.Frame Frame1 
         Caption         =   "Açao"
         Height          =   855
         Left            =   3720
         TabIndex        =   11
         Top             =   3000
         Width           =   1215
         Begin VB.OptionButton Option2 
            Caption         =   "Pedido"
            Height          =   255
            Left            =   120
            TabIndex        =   13
            Top             =   480
            Width           =   975
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Local"
            Height          =   255
            Left            =   120
            TabIndex        =   12
            Top             =   240
            Width           =   855
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Pedido"
         Height          =   855
         Left            =   240
         TabIndex        =   8
         Top             =   3000
         Width           =   3375
         Begin MSMask.MaskEdBox mskNum 
            Height          =   375
            Left            =   2280
            TabIndex        =   9
            Top             =   240
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            Enabled         =   0   'False
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "frmContTrans.frx":0000
            TabIndex        =   10
            Top             =   240
            Width           =   2055
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Pedidos"
         Height          =   2655
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   6255
         Begin MSFlexGridLib.MSFlexGrid mfgPedidos 
            Height          =   2295
            Left            =   120
            TabIndex        =   7
            Top             =   240
            Width           =   6015
            _ExtentX        =   10610
            _ExtentY        =   4048
            _Version        =   393216
            Cols            =   4
            ForeColor       =   0
            BackColorFixed  =   14737632
            ForeColorSel    =   8421504
            BackColorBkg    =   16777215
            GridColor       =   4210752
            FormatString    =   "Numero do Pedido |Data                   |Cliente                          |Transporte      "
         End
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Espera"
         Height          =   375
         Left            =   5160
         TabIndex        =   5
         Top             =   3120
         Width           =   1335
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   120
         Top             =   720
      End
      Begin ACTIVESKINLibCtl.SkinLabel LABEL 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmContTrans.frx":007E
         TabIndex        =   14
         Top             =   3960
         Width           =   3015
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6495
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmContTrans.frx":00E6
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   4560
         OleObjectBlob   =   "frmContTrans.frx":014A
         TabIndex        =   2
         Top             =   120
         Width           =   1695
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmContTrans.frx":01BE
         TabIndex        =   3
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.Menu mnuMenu 
      Caption         =   "menu"
      Visible         =   0   'False
      Begin VB.Menu mnuAlt 
         Caption         =   "Alterar Quantidade"
      End
      Begin VB.Menu mnuExc 
         Caption         =   "Excluir Linha"
      End
      Begin VB.Menu trasso 
         Caption         =   "-"
      End
      Begin VB.Menu mnuConsFor 
         Caption         =   "Consultar Produto"
      End
      Begin VB.Menu mnuConsCli 
         Caption         =   "Consultar Cliente"
      End
   End
End
Attribute VB_Name = "frmContTrans"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim codmod(9999) As Long

Private Sub cmdSalvar_Click()

Call Transporte

If Option1 = True Then GoTo U

tabelas.Close
mskNum.PromptInclude = False
If mskNum = Empty Then Exit Sub
tabelas.Open "select * from transportes where numpedido=" & mskNum

If tabelas!status = False Then
frmPed_Trans.Show
frmPed_Trans.mskCod_Ped.PromptInclude = False
frmPed_Trans.mskCod_Ped = mskNum
frmPed_Trans.cmdBuscar_Cod_Ped = True
frmPed_Trans.mskCod_Ped.PromptInclude = True
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "transportes", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from transportes where numpedido=" & mskNum
tabelas2!status = True
wer = mskNum
tabelas2.Update
tabelas2.Close

Call Transporte
Call carregar_lista
If mfgPedidos.TextMatrix(mfgPedidos.Row, 3) = "A caminho" Then
cmdSalvar.Caption = "Finalizar"
LABEL.Caption = "A CAMINHO"
Timer3.Enabled = True
Else
cmdSalvar.Caption = "Em espera"
Timer3.Enabled = False
LABEL.Caption = "EM ESPERA"
End If
Else
U:
Call Transporte
mskNum.PromptInclude = False
conecta.Execute "delete * from TransporteS where numpedido=" & mskNum
mskNum = Clear = Clear
mskNum.PromptInclude = True
cmdSalvar.Caption = "Em espera"

Timer3.Enabled = False
LABEL.Caption = "EM ESPERA"
Call Transporte
Call carregar_lista


End If

mskNum.PromptInclude = True

End Sub

Private Sub FlexPeças_Click()

End Sub

Private Sub Form_Load()
 actskin.ApplySkin Me.hWnd
             actskin2.ApplySkin (cmdSalvar.hWnd)
            ' actskin2.ApplySkin (cmdExclu.hWnd)
             actskin2.ApplySkin (Frame5.hWnd)
             Call Transporte
            Option2 = True
            Call carregar_lista
End Sub

Private Sub carregar_lista()
            Dim ghjk As String
            Dim cont1 As Integer
            With mfgPedidos
            
            .Rows = 1
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
           
            If tabelas!status = True Then ghjk = "A caminho" Else ghjk = "Em espera"
            .TextMatrix(cont1, 3) = ghjk
            .TextMatrix(cont1, 0) = tabelas!numpedido
            If ghjk = "A caminho" Then
            .Col = 1
            .CellBackColor = &HFFFF00
            .Col = 2
            .CellBackColor = &HFFFF00
            .Col = 3
            .CellBackColor = &HFFFF00
            
        End If
            
             If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "vendas", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from vendas where num_pedido=" & tabelas!numpedido
            
            .TextMatrix(cont1, 1) = tabelas2!data
            
            If tabelas3.State = adStateOpen Then tabelas3.Close
            tabelas3.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
            tabelas3.Close
            tabelas3.Open "select * from clientes where codigo=" & tabelas2!cod_cli
            .TextMatrix(cont1, 2) = tabelas3!nome
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
             If tabelas!status = True Then ghjk = "Sim" Else ghjk = "Nao"
            .TextMatrix(cont1, 3) = ghjk
            .TextMatrix(cont1, 0) = tabelas!numpedido
            If ghjk = "A caminho" Then
            .Col = 1
            .CellBackColor = &HFFFF00
            .Col = 2
            .CellBackColor = &HFFFF00
            .Col = 3
            .CellBackColor = &HFFFF00
            
        End If
            
             If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "vendas", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from vendas where num_pedido=" & tabelas!numpedido
            
            .TextMatrix(cont1, 1) = tabelas2!data
            
            If tabelas3.State = adStateOpen Then tabelas3.Close
            tabelas3.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
            tabelas3.Close
            tabelas3.Open "select * from clientes where codigo=" & tabelas2!cod_cli
            .TextMatrix(cont1, 2) = tabelas3!nome
            Else
            cont1 = Clear
            End If
            Wend
           
             End If
            End With
           If tabelas2.State = adStateOpen Then tabelas2.Close
           If tabelas3.State = adStateOpen Then tabelas3.Close
End Sub



Private Sub mfgPedidos_Click()
mskNum.PromptInclude = False
mskNum = mfgPedidos.TextMatrix(mfgPedidos.Row, 0)
mskNum.PromptInclude = True

If mfgPedidos.TextMatrix(mfgPedidos.Row, 3) = "A caminho" Then
cmdSalvar.Caption = "Concluir"
actskin2.ApplySkin (cmdSalvar.hWnd)
Else
cmdSalvar.Caption = "Espera"
actskin2.ApplySkin (cmdSalvar.hWnd)
End If

End Sub

Private Sub Timer2_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25

End Sub

Private Sub Timer3_Timer()
If LABEL.Visible = True Then
LABEL.Visible = False
Else
LABEL.Visible = True
End If
End Sub
