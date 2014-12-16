VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmCustosfixos 
   BackColor       =   &H80000004&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Custos Fixos"
   ClientHeight    =   5490
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10650
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5490
   ScaleWidth      =   10650
   Begin VB.Frame frmconta 
      Caption         =   "Lista de Contas"
      Height          =   3012
      Left            =   120
      TabIndex        =   23
      Top             =   2400
      Width           =   10452
      Begin VB.TextBox txtBuscar 
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1200
         MaxLength       =   50
         TabIndex        =   24
         Top             =   240
         Width           =   4935
      End
      Begin MSFlexGridLib.MSFlexGrid msfleConta 
         Height          =   2175
         Left            =   120
         TabIndex        =   25
         Top             =   720
         Width           =   10335
         _ExtentX        =   18230
         _ExtentY        =   3836
         _Version        =   393216
         Cols            =   6
         BackColorFixed  =   14737632
         FormatString    =   "Codigo     |Nome da conta       |Valor          |Data de pagamento    |Data de Vencimento   |Pago    "
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   252
         Left            =   120
         OleObjectBlob   =   "frmCustosfixos.frx":0000
         TabIndex        =   26
         Top             =   240
         Width           =   1092
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   10080
      Top             =   240
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   18
      Top             =   0
      Width           =   10452
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   372
         Left            =   8280
         OleObjectBlob   =   "frmCustosfixos.frx":006A
         TabIndex        =   19
         Top             =   120
         Width           =   852
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   1080
         OleObjectBlob   =   "frmCustosfixos.frx":00D2
         TabIndex        =   20
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1812
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   10452
      Begin VB.ComboBox cmbForma 
         Height          =   315
         ItemData        =   "frmCustosfixos.frx":013C
         Left            =   4560
         List            =   "frmCustosfixos.frx":014C
         Style           =   2  'Dropdown List
         TabIndex        =   28
         Top             =   1320
         Width           =   1815
      End
      Begin MSComCtl2.DTPicker dtpPag 
         Height          =   372
         Left            =   2160
         TabIndex        =   16
         Top             =   600
         Width           =   1572
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   203882497
         CurrentDate     =   39732
      End
      Begin VB.Frame fre 
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   732
         Left            =   120
         TabIndex        =   12
         Top             =   960
         Width           =   2052
         Begin VB.CommandButton cmdExclur 
            Caption         =   "Exluir"
            Height          =   372
            Left            =   1320
            Picture         =   "frmCustosfixos.frx":0172
            TabIndex        =   27
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   240
            Width           =   612
         End
         Begin VB.CommandButton cmdAlterar 
            Caption         =   "Alterar"
            Height          =   372
            Left            =   1560
            Picture         =   "frmCustosfixos.frx":084D
            TabIndex        =   15
            ToolTipText     =   "Clique aqui para alterar os dados do  Fornecedor ja existente"
            Top             =   720
            Visible         =   0   'False
            Width           =   612
         End
         Begin VB.CommandButton cmdSalvar 
            Caption         =   "Salvar"
            Height          =   372
            Left            =   120
            Picture         =   "frmCustosfixos.frx":709F
            TabIndex        =   14
            ToolTipText     =   "Clique aqui para salvar um novo Fornecedor"
            Top             =   240
            Width           =   612
         End
         Begin VB.CommandButton cmdNovo 
            Caption         =   "Novo"
            Height          =   372
            Left            =   720
            Picture         =   "frmCustosfixos.frx":D8F1
            TabIndex        =   13
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   240
            Width           =   612
         End
      End
      Begin VB.TextBox txtCusto 
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   7680
         MaxLength       =   50
         TabIndex        =   5
         Top             =   600
         Width           =   2532
      End
      Begin VB.Frame Frame2 
         Caption         =   "Pago?"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   612
         Left            =   2400
         TabIndex        =   2
         Top             =   1080
         Width           =   1932
         Begin VB.OptionButton optsim 
            Caption         =   "Sim"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   4
            Top             =   240
            Width           =   735
         End
         Begin VB.OptionButton optinnão 
            Caption         =   "Não"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   960
            TabIndex        =   3
            Top             =   240
            Width           =   855
         End
      End
      Begin MSMask.MaskEdBox mskValor 
         Height          =   372
         Left            =   5640
         TabIndex        =   1
         Top             =   600
         Width           =   1812
         _ExtentX        =   3201
         _ExtentY        =   661
         _Version        =   393216
         Format          =   "R$#,##0.00;(R$#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCod 
         Height          =   372
         Left            =   240
         TabIndex        =   6
         Top             =   600
         Width           =   1692
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   8
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Comic Sans MS"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Mask            =   "########"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknCod 
         Height          =   252
         Left            =   120
         OleObjectBlob   =   "frmCustosfixos.frx":DFCC
         TabIndex        =   7
         Top             =   240
         Width           =   612
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknNomeCusto 
         Height          =   252
         Left            =   7560
         OleObjectBlob   =   "frmCustosfixos.frx":E02E
         TabIndex        =   8
         Top             =   360
         Width           =   1092
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknValor 
         Height          =   252
         Left            =   5640
         OleObjectBlob   =   "frmCustosfixos.frx":E098
         TabIndex        =   9
         Top             =   360
         Width           =   612
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknDatapag 
         Height          =   252
         Left            =   2040
         OleObjectBlob   =   "frmCustosfixos.frx":E0F8
         TabIndex        =   10
         Top             =   360
         Width           =   972
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknDatavenc 
         Height          =   252
         Left            =   3840
         OleObjectBlob   =   "frmCustosfixos.frx":E160
         TabIndex        =   11
         Top             =   360
         Width           =   972
      End
      Begin MSComCtl2.DTPicker dtpVenc 
         Height          =   372
         Left            =   3960
         TabIndex        =   17
         Top             =   600
         Width           =   1572
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   203882497
         CurrentDate     =   39732
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   495
         Left            =   6840
         OleObjectBlob   =   "frmCustosfixos.frx":E1CA
         TabIndex        =   21
         Top             =   1200
         Width           =   855
      End
      Begin ACTIVESKINLibCtl.SkinLabel lblTotal 
         Height          =   375
         Left            =   7800
         OleObjectBlob   =   "frmCustosfixos.frx":E22C
         TabIndex        =   22
         Top             =   1200
         Width           =   1935
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   4440
         OleObjectBlob   =   "frmCustosfixos.frx":E28C
         TabIndex        =   29
         Top             =   1080
         Width           =   2175
      End
   End
End
Attribute VB_Name = "frmCustosfixos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Pendente As Integer

Private Sub cmdAlterar_Click()
            Call desativar
           
            If mskCod = Clear Or txtCusto = Clear Or mskValor = Clear Then
            
            MsgBox "Os Campos Código, Nome e valor são Obrigatorios!", vbInformation, "Atenção"
            Call ativar
            Call codmat
            Exit Sub
            End If
            
            tabelas.Close
            tabelas.Open "select * from CustusFixos where codigo =" & mskCod
            If tabelas.BOF = False Or tabelas.EOF = False Then
            If tabelas!Pendente = True Then
            MsgBox "Esta conta ja foi paga!,Atualize para  'nao' e depois salve como 'sim'", vbInformation
            Call CF
            Exit Sub
            End If
            
            status = "alteradas"

            Call gravar
            
            If cmbForma.Text = "Cheque" Or cmbForma.Text = "Boleto" Then GoTo Y
            If optSim = True Then
             tabelas.Close
            tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
            
            If tabelas.BOF = False Or tabelas.EOF = False Then
            tabelas.MoveLast
            cod = tabelas!codigo
            valor = tabelas!valor
            Else
            cod = 0
            valor = 0
            End If
            
             If CCur(mskValor) > tabelas!valor Then
            MsgBox "Nao a dinheiro suficiente em caixa", vbInformation
            Call CF
            Exit Sub
            End If
            
            tabelas.Close
            tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
            Call desativar
            tabelas.AddNew
            tabelas!codigo = cod + 1
            tabelas!valor = valor - mskValor
            tabelas!codcusto = mskCod
            tabelas!saida = mskValor
            tabelas!data = Date
            tabelas!Parcela = "Custo fixo"
            tabelas.Update
            Call ativar
            End If
Y:
            Call crash1
            Call ativar
            
            End If
            cmdNovo = True
            Call CF
            Call listar
            
            
           
End Sub
Private Sub listar()
Dim linhas As Long
            msfleConta.Clear
            msfleConta.Rows = 2
            
            
            msfleConta.FormatString = "Codigo       |Nome da conta                                 |Valor                          |Data de pagamento  |Data de Vencimento   |Pago         "
            
            linhas = 1
            
             
            
            While tabelas.EOF = False
            
            msfleConta.TextMatrix(linhas, 0) = tabelas!codigo
            msfleConta.TextMatrix(linhas, 1) = tabelas!Nomeconta
            msfleConta.TextMatrix(linhas, 2) = Format(tabelas!valor, "R$ #,##0.00")
            msfleConta.TextMatrix(linhas, 3) = Format(IIf(IsNull(tabelas!dt_pagamento), "  -  ", tabelas!dt_pagamento), "dd/mm/yyyy")
            msfleConta.TextMatrix(linhas, 4) = Format(tabelas!dt_vencimento, "dd/mm/yyyy")
            msfleConta.TextMatrix(linhas, 5) = IIf((tabelas!Pendente) = 0, "Não", "sim")
            
             'If tabelas2.State = adStateOpen Then tabelas2.Close
            'tabelas2.Open "select * from CustusFixos where dt_vencimento= #" & Format(Date, "mm/dd/yyyy") & "#"
            'If tabelas2.EOF = False And tabelas2.BOF = False Then
           If tabelas!dt_vencimento = Date Then
           If tabelas!Pendente = False Then
            msfleConta.Col = 1
                     msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbYellow
            msfleConta.Col = 2
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbYellow
            msfleConta.Col = 3
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbYellow
            msfleConta.Col = 4
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbYellow
            msfleConta.Col = 5
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbYellow
            End If
            End If
           ' End If

            'tabelas2.Close
            'tabelas2.Open "select * from CustusFixos where dt_vencimento= #" & Format(Date, "mm/dd/yyyy") & "#"
            'If tabelas2.EOF = False And tabelas2.BOF = False Then
            
           If tabelas!dt_vencimento < Date Then
           If tabelas!Pendente = False Then
            msfleConta.Col = 1
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbRed
            msfleConta.Col = 2
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbRed
            msfleConta.Col = 3
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbRed
            msfleConta.Col = 4
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbRed
            msfleConta.Col = 5
            msfleConta.Row = msfleConta.Rows - 1
            msfleConta.CellBackColor = vbRed
            End If
            End If
            'End If
            
            tabelas.MoveNext
            linhas = linhas + 1
            msfleConta.Rows = msfleConta.Rows + 1
           
            Wend
            
End Sub
            
Private Sub cmdbusca_Click()

End Sub

Private Sub cmdbusb_Click()

End Sub

Private Sub cmdExclur_Click()
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If mskCod = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
           mskCod.PromptInclude = False
           conecta.Execute "delete * from Custusfixos where codigo=" & mskCod
           mskCod.PromptInclude = True
           cmdNovo = True
           Call CF
           Call listar
           status = "excluidos"
           Call crash1
           navegaçao = Clear
           Call CF
           End If
           End If
End Sub

Private Sub cmdNovo_Click()
Call desativar
Dim d As Object
For Each d In Me.Controls
If TypeOf d Is TextBox Then d = Clear
If TypeOf d Is MaskEdBox Then d = Clear
Next
optSim = False
optinnão = False
Call codmat
Call ativar
End Sub
Private Sub codmat()
            Call CF
            If tabelas.BOF = True And tabelas.EOF = True Then
            Else
            tabelas.MoveLast
            End If
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "CustusFixos", conecta, adOpenKeyset, adLockOptimistic
            Call desativar
            If tabelas.BOF = True And tabelas.EOF = True Then
            mskCod = 1
            Else
            If mskCod = Empty Then
            Dim Num As Long
            Dim Ant As Long
            Num = 1
            While Ant = Empty
            tabelas.Close
            tabelas.Open "select * from CustusFixos where Codigo=" & Num
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Num = Num + 1
            Else
            Ant = 1
            End If
            Wend
            mskCod = Num
            End If
            End If
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select sum(valor) as V from CustusFixos"
            lblTotal.Caption = Format(tabelas!v, "R$ #,##0.00")
            
            
End Sub
Private Sub gravar()
Call desativar

            If status = "salvas" Then
            tabelas.AddNew
            tabelas!codigo = mskCod
            
            End If
            tabelas!Nomeconta = txtCusto
            tabelas!dt_pagamento = Empty
            tabelas!dt_vencimento = dtpVenc
            
            If optSim = True Then
            tabelas!dt_pagamento = dtpPag
            tabelas!forma = cmbForma.Text
            End If
            
            tabelas!valor = mskValor
            tabelas!Pendente = Pendente
            tabelas.Update
 
Call ativar
End Sub

Private Sub cmdSalvar_Click()
If mskCod = Empty Or txtCusto = Empty Or mskValor = Empty Then
MsgBox "preencha todos os campos", vbInformation, "atenção"
Else
status = "salvas"
tabelas.Close
mskCod.PromptInclude = False
tabelas.Open "select * from custusFixos where codigo=" & mskCod
mskCod.PromptInclude = True
If tabelas.EOF = False Or tabelas.BOF = False Then
If MsgBox("Deseja alterar?", vbInformation + vbYesNo) = vbYes Then cmdAlterar = True
Else

Call gravar
cmdNovo = True
Call CF
Call listar
End If
End If
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select sum(valor) as V from CustusFixos"
            lblTotal.Caption = Format(tabelas!v, "R$ #,##0.00")
            If tabelas.State = adStateOpen Then tabelas.Close

End Sub

Private Sub Form_Load()

actskin.ApplySkin Me.hWnd
actskin2.ApplySkin cmdNovo.hWnd
actskin2.ApplySkin cmdExclur.hWnd
actskin2.ApplySkin cmdSalvar.hWnd

            Call codmat
            
            
            Call CF
            Call listar
End Sub
Private Sub desativar()
mskCod.PromptInclude = False


End Sub
Private Sub ativar()
mskCod.PromptInclude = True


End Sub

Private Sub msfleConta_Click()
Dim contas As Long

            If msfleConta.Object = Clear Then
            Exit Sub
            End If
            
            msfleConta.Col = 0
            
            contas = msfleConta.Object
                      
            
            
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from CustusFixos where codigo =" & contas

            Call desativar
            mskCod = tabelas!codigo
            txtCusto = tabelas!Nomeconta
             dtpPag = IIf(IsNull(tabelas!dt_pagamento), False, tabelas!dt_pagamento)
            dtpVenc = tabelas!dt_vencimento
            mskValor = tabelas!valor
            cmbForma = IIf(IsNull(tabelas!forma), "dinheiro", tabelas!forma)
            If tabelas!Pendente = 0 Then
            optinnão = True
            Else
            optSim = True
            End If
            Call ativar

End Sub

Private Sub optinnão_Click()
Pendente = 0
End Sub

Private Sub optsim_Click()
Pendente = -1
End Sub

Private Sub Text1_Change()

End Sub

Private Sub Timer1_Timer()
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub txtBuscar_Change()

            msfleConta.Clear
            msfleConta.Rows = 2
            msfleConta.Rows = msfleConta.Rows + 1
            
            If txtBuscar = Clear Then
            tabelas.Close
            tabelas.Open "CustosFixos", conecta, adOpenKeyset, adLockOptimistic
            
           
            Call listar
            Exit Sub
            End If
            
            tabelas.Close
            tabelas.Open "Select * from CustosFixos where Nomeconta like '" & txtBuscar & "%' ORDER BY Nomeconta"
                       
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call listar
            Else
            Call listar
            End If
End Sub

