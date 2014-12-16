VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmProduçao 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Controle de Produção"
   ClientHeight    =   6255
   ClientLeft      =   180
   ClientTop       =   705
   ClientWidth     =   12210
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6255
   ScaleWidth      =   12210
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
      Height          =   5415
      Left            =   120
      TabIndex        =   4
      Top             =   720
      Width           =   12015
      Begin VB.Timer Timer3 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   5400
         Top             =   3960
      End
      Begin ACTIVESKINLibCtl.SkinLabel LABEL 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmProdu.frx":0000
         TabIndex        =   15
         Top             =   3960
         Width           =   3015
      End
      Begin VB.Frame Frame6 
         Caption         =   "Pedido"
         Height          =   855
         Left            =   240
         TabIndex        =   12
         Top             =   3000
         Width           =   3375
         Begin MSMask.MaskEdBox mskNum 
            Height          =   375
            Left            =   2280
            TabIndex        =   13
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
            OleObjectBlob   =   "frmProdu.frx":0068
            TabIndex        =   14
            Top             =   240
            Width           =   2055
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Pedidos"
         Height          =   2655
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   6015
         Begin MSFlexGridLib.MSFlexGrid mfgPedidos 
            Height          =   2295
            Left            =   120
            TabIndex        =   11
            Top             =   240
            Width           =   5775
            _ExtentX        =   10186
            _ExtentY        =   4048
            _Version        =   393216
            Cols            =   4
            ForeColor       =   0
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            GridColor       =   4210752
            FormatString    =   "Numero do Pedido |Data                   |Cliente                          |Produçao      "
         End
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Produzir"
         Height          =   375
         Left            =   3720
         TabIndex        =   9
         Top             =   3120
         Width           =   1575
      End
      Begin VB.Frame Frame3 
         Caption         =   "Peças"
         Height          =   2175
         Left            =   6960
         TabIndex        =   7
         Top             =   2760
         Width           =   4455
         Begin MSFlexGridLib.MSFlexGrid FlexPeças 
            Height          =   1815
            Left            =   120
            TabIndex        =   8
            Top             =   240
            Width           =   4215
            _ExtentX        =   7435
            _ExtentY        =   3201
            _Version        =   393216
            Cols            =   3
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            FormatString    =   "Codigo      | Nome                              |Quantidade        "
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Itens do pedido"
         Height          =   2175
         Left            =   6240
         TabIndex        =   5
         Top             =   360
         Width           =   5535
         Begin MSFlexGridLib.MSFlexGrid msfgItens 
            Height          =   1815
            Left            =   120
            TabIndex        =   6
            Top             =   240
            Width           =   5295
            _ExtentX        =   9340
            _ExtentY        =   3201
            _Version        =   393216
            Cols            =   3
            ForeColor       =   0
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            GridColor       =   4210752
            FormatString    =   "Codigo do Prod        |Nome  do Produto                    |Quantidade   "
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   120
         Top             =   720
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   0
      Width           =   11772
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmProdu.frx":00E6
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   372
         Left            =   7920
         OleObjectBlob   =   "frmProdu.frx":014A
         TabIndex        =   2
         Top             =   120
         Width           =   2052
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmProdu.frx":01B8
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
Attribute VB_Name = "frmProduçao"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim codmod As Long

Private Sub cmdSalvar_Click()

Call Produçao
tabelas.Close
mskNum.PromptInclude = False
If mskNum = Empty Then Exit Sub
tabelas.Open "select * from produçao where numpedido=" & mskNum
mskNum.PromptInclude = True
If tabelas!status = False Then
tabelas!status = True
tabelas.Update
Call Produçao
Call carregar_lista
If mfgPedidos.TextMatrix(mfgPedidos.Row, 3) = "Sim" Then
cmdSalvar.Caption = "Finalizar"
LABEL.Caption = "EM PRODUÇÃO"
Timer3.Enabled = True
Else
cmdSalvar.Caption = "Produzir"
Timer3.Enabled = False
LABEL.Caption = "EM ESPERA"
End If
Else
mskNum.PromptInclude = False
Call Transporte
tabelas.AddNew
tabelas!numpedido = mskNum
tabelas!status = False
tabelas.Update
Call Produçao
conecta.Execute "delete * from produçao where numpedido=" & mskNum
mskNum = Clear
msfgItens.Rows = 1
FlexPeças.Rows = 1
msfgItens.Rows = 2
FlexPeças.Rows = 2
mskNum.PromptInclude = True
cmdSalvar.Caption = "Produzir"

Timer3.Enabled = False
LABEL.Caption = "EM ESPERA"
Call Produçao
Call carregar_lista

End If



End Sub

Private Sub Form_Load()
 actskin.ApplySkin Me.hWnd
             actskin2.ApplySkin (cmdSalvar.hWnd)
            ' actskin2.ApplySkin (cmdExclu.hWnd)
             actskin2.ApplySkin (Frame5.hWnd)
             Call Produçao
            
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
            
           
            If tabelas!status = True Then ghjk = "Sim" Else ghjk = "Nao"
            .TextMatrix(cont1, 3) = ghjk
            .TextMatrix(cont1, 0) = tabelas!numpedido
            If ghjk = "Sim" Then
            .Row = cont1
            .Col = 1
            .CellBackColor = vbGreen
            .Col = 2
            .CellBackColor = vbGreen
            .Col = 3
            .CellBackColor = vbGreen
            
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
            If ghjk = "Sim" Then
                        .Row = cont1

            .Col = 1
            .CellBackColor = vbGreen
            .Col = 2
            .CellBackColor = vbGreen
            .Col = 3
            .CellBackColor = vbGreen
            
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
If tabelas3.State = adStateOpen Then tabelas3.Close
      tabelas3.Open "produtos", conecta, adOpenKeyset, adLockOptimistic
With msfgItens
.Clear
.Rows = 2
.FormatString = ("Codigo do Prod        |Nome  do Produto                    |Quantidade   ")
tabelas2.Open "itens_vendas", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
If mfgPedidos.TextMatrix(mfgPedidos.Row, 0) = "" Then GoTo Y
tabelas2.Open "select * from itens_vendas where numpedido=" & mfgPedidos.TextMatrix(mfgPedidos.Row, 0)
Dim cont As Integer
cont = 1
While tabelas2.EOF = False
.TextMatrix(cont, 0) = tabelas2!Cod_Prod
tabelas3.Close
tabelas3.Open "select * from Produtos where codigo ='" & tabelas2!Cod_Prod & "'"
.TextMatrix(cont, 1) = tabelas3!nome
codmod = tabelas3!cod_modelo
.TextMatrix(cont, 2) = tabelas2!Quant

cont = cont + 1
.Rows = .Rows + 1
tabelas2.MoveNext
Wend
.Rows = .Rows - 1
End With
mskNum.PromptInclude = False
mskNum = mfgPedidos.TextMatrix(mfgPedidos.Row, 0)
mskNum.PromptInclude = True

If mfgPedidos.TextMatrix(mfgPedidos.Row, 3) = "Sim" Then
cmdSalvar.Caption = "Finalizar"
LABEL.Caption = "EM PRODUÇÃO"
actskin2.ApplySkin (cmdSalvar.hWnd)

Timer3.Enabled = True
Else
cmdSalvar.Caption = "Produzir"
actskin2.ApplySkin (cmdSalvar.hWnd)
Timer3.Enabled = False
LABEL.Caption = "EM ESPERA"
End If
Y:
If tabelas2.State = adStateOpen Then tabelas2.Close
If tabelas3.State = adStateOpen Then tabelas3.Close

End Sub

Private Sub msfgItens_Click()
With FlexPeças
.Clear
.Rows = 2
.FormatString = ("Codigo      | Nome                              |Quantidade        ")
tabelas2.Open "peças_mod", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from peças_mod where codModelo=" & codmod
Dim cont As Integer
cont = 1
While tabelas2.EOF = False
.TextMatrix(cont, 0) = tabelas2!codpe
.TextMatrix(cont, 2) = tabelas2!qtd

If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "select * from peças where codigo =" & tabelas2!codpe
.TextMatrix(cont, 1) = tabelas3!nome



'If tabelas3.State = adStateOpen Then tabelas3.Close
'tabelas3.Open "select * from fornecedores where codigo =" & tabelas2!codFor
'.TextMatrix(cont, 2) = tabelas3!razaosocial

cont = cont + 1
.Rows = .Rows + 1
tabelas2.MoveNext
Wend
.Rows = .Rows - 1
tabelas2.Close
End With

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
