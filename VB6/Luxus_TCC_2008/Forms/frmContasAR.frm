VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmContasReceber 
   BackColor       =   &H80000009&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Contas a Receber"
   ClientHeight    =   7005
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   15600
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7005
   ScaleWidth      =   15600
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   5880
      Top             =   3240
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   11
      Top             =   0
      Width           =   15375
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1920
         OleObjectBlob   =   "frmContasAR.frx":0000
         TabIndex        =   12
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   372
         Left            =   10320
         OleObjectBlob   =   "frmContasAR.frx":0060
         TabIndex        =   13
         Top             =   120
         Width           =   1212
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   840
         OleObjectBlob   =   "frmContasAR.frx":00CC
         TabIndex        =   14
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Height          =   6375
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   15375
      Begin VB.CommandButton Command7 
         Caption         =   "Visualizar Impressao"
         Height          =   375
         Left            =   12840
         TabIndex        =   44
         Top             =   4800
         Width           =   1815
      End
      Begin VB.CommandButton cmdrel 
         Caption         =   "Imprimir Relatorio"
         Height          =   375
         Left            =   12840
         TabIndex        =   43
         Top             =   5280
         Width           =   1815
      End
      Begin VB.Frame Frame2 
         Caption         =   "Busca"
         Height          =   1815
         Left            =   2760
         TabIndex        =   26
         Top             =   4440
         Width           =   9975
         Begin VB.TextBox txtNomecli 
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
            Left            =   240
            MaxLength       =   50
            TabIndex        =   39
            Top             =   1200
            Width           =   3255
         End
         Begin VB.CommandButton Command5 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   1800
            TabIndex        =   38
            Top             =   480
            Width           =   615
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Todos"
            Height          =   372
            Left            =   6240
            Picture         =   "frmContasAR.frx":0136
            TabIndex        =   37
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   1320
            Width           =   975
         End
         Begin VB.CommandButton Command2 
            Caption         =   "Hoje"
            Height          =   372
            Left            =   8640
            Picture         =   "frmContasAR.frx":0811
            TabIndex        =   36
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   1320
            Width           =   975
         End
         Begin VB.CommandButton Command3 
            Caption         =   "Atrasados"
            Height          =   372
            Left            =   7440
            Picture         =   "frmContasAR.frx":0EEC
            TabIndex        =   35
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   1320
            Width           =   975
         End
         Begin VB.Frame Frame3 
            Height          =   1095
            Left            =   5280
            TabIndex        =   28
            Top             =   120
            Width           =   4335
            Begin VB.CommandButton Command4 
               Caption         =   "Buscar"
               Height          =   375
               Left            =   3600
               TabIndex        =   31
               Top             =   600
               Width           =   615
            End
            Begin VB.OptionButton optDtPag 
               Caption         =   "Data de Pagamento"
               Height          =   255
               Left            =   480
               TabIndex        =   30
               Top             =   240
               Width           =   1815
            End
            Begin VB.OptionButton optDtVenc 
               Caption         =   "Data de vencimento"
               Height          =   255
               Left            =   2280
               TabIndex        =   29
               Top             =   240
               Width           =   1935
            End
            Begin MSComCtl2.DTPicker dt2 
               Height          =   375
               Left            =   2040
               TabIndex        =   32
               Top             =   600
               Width           =   1455
               _ExtentX        =   2566
               _ExtentY        =   661
               _Version        =   393216
               Format          =   45547521
               CurrentDate     =   39743
            End
            Begin MSComCtl2.DTPicker dt1 
               Height          =   375
               Left            =   360
               TabIndex        =   33
               Top             =   600
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               Format          =   45547521
               CurrentDate     =   39743
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
               Height          =   255
               Left            =   1800
               OleObjectBlob   =   "frmContasAR.frx":15C7
               TabIndex        =   34
               Top             =   720
               Width           =   615
            End
         End
         Begin VB.CommandButton Command6 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   3600
            TabIndex        =   27
            Top             =   1200
            Width           =   615
         End
         Begin MSMask.MaskEdBox mskcodcli 
            Height          =   375
            Left            =   240
            TabIndex        =   40
            Top             =   480
            Width           =   1455
            _ExtentX        =   2566
            _ExtentY        =   661
            _Version        =   393216
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
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
            Height          =   255
            Left            =   240
            OleObjectBlob   =   "frmContasAR.frx":1627
            TabIndex        =   41
            Top             =   240
            Width           =   1575
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
            Height          =   255
            Left            =   240
            OleObjectBlob   =   "frmContasAR.frx":16A3
            TabIndex        =   42
            Top             =   960
            Width           =   1575
         End
      End
      Begin VB.CommandButton cmdNovo 
         Caption         =   "Novo"
         Height          =   372
         Left            =   1200
         Picture         =   "frmContasAR.frx":171B
         TabIndex        =   22
         ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
         Top             =   3840
         Width           =   975
      End
      Begin VB.CommandButton cmdAlterar 
         Caption         =   "Dar Baixa"
         Height          =   372
         Left            =   240
         Picture         =   "frmContasAR.frx":1DF6
         TabIndex        =   21
         ToolTipText     =   "Clique aqui para alterar os dados do  Fornecedor ja existente"
         Top             =   3840
         Width           =   852
      End
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
         Left            =   3600
         MaxLength       =   50
         TabIndex        =   18
         Top             =   240
         Width           =   4935
      End
      Begin VB.OptionButton optPagas 
         Caption         =   "Pagas"
         Height          =   375
         Left            =   9120
         TabIndex        =   17
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton optNao 
         Caption         =   "Não Pagas"
         Height          =   375
         Left            =   10080
         TabIndex        =   16
         Top             =   240
         Width           =   852
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Todos"
         Height          =   375
         Left            =   10920
         TabIndex        =   15
         Top             =   240
         Width           =   855
      End
      Begin MSComCtl2.DTPicker dtpPag 
         Height          =   372
         Left            =   120
         TabIndex        =   9
         Top             =   1200
         Width           =   1572
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   45547521
         CurrentDate     =   39732
      End
      Begin VB.TextBox txtCusto 
         Enabled         =   0   'False
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
         Left            =   120
         MaxLength       =   50
         TabIndex        =   2
         Top             =   3360
         Width           =   2535
      End
      Begin MSMask.MaskEdBox mskValor 
         Height          =   372
         Left            =   120
         TabIndex        =   1
         Top             =   2640
         Width           =   1812
         _ExtentX        =   3201
         _ExtentY        =   661
         _Version        =   393216
         Enabled         =   0   'False
         Format          =   "R$#,##0.00;(R$#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCod 
         Height          =   372
         Left            =   120
         TabIndex        =   3
         Top             =   480
         Width           =   1692
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
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
         OleObjectBlob   =   "frmContasAR.frx":8648
         TabIndex        =   4
         Top             =   240
         Width           =   1452
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknNomeCusto 
         Height          =   252
         Left            =   120
         OleObjectBlob   =   "frmContasAR.frx":86B6
         TabIndex        =   5
         Top             =   3120
         Width           =   1092
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknValor 
         Height          =   252
         Left            =   120
         OleObjectBlob   =   "frmContasAR.frx":871E
         TabIndex        =   6
         Top             =   2400
         Width           =   612
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknDatapag 
         Height          =   252
         Left            =   120
         OleObjectBlob   =   "frmContasAR.frx":877E
         TabIndex        =   7
         Top             =   960
         Width           =   972
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknDatavenc 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAR.frx":87E6
         TabIndex        =   8
         Top             =   1680
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker dtpVenc 
         Height          =   372
         Left            =   120
         TabIndex        =   10
         Top             =   1920
         Width           =   1572
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   45547521
         CurrentDate     =   39732
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   255
         Left            =   3000
         OleObjectBlob   =   "frmContasAR.frx":8850
         TabIndex        =   19
         Top             =   360
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid msContas 
         Height          =   3735
         Left            =   2760
         TabIndex        =   20
         Top             =   720
         Width           =   12375
         _ExtentX        =   21828
         _ExtentY        =   6588
         _Version        =   393216
         Cols            =   7
         BackColorFixed  =   14737632
         FormatString    =   $"frmContasAR.frx":88B4
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
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   495
         Left            =   120
         OleObjectBlob   =   "frmContasAR.frx":8950
         TabIndex        =   23
         Top             =   5160
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel lblTotal 
         Height          =   495
         Left            =   1080
         OleObjectBlob   =   "frmContasAR.frx":89B2
         TabIndex        =   24
         Top             =   5160
         Width           =   1695
      End
      Begin ACTIVESKINLibCtl.SkinLabel lblNp 
         Height          =   255
         Left            =   2880
         OleObjectBlob   =   "frmContasAR.frx":8A12
         TabIndex        =   25
         Top             =   4560
         Visible         =   0   'False
         Width           =   975
      End
   End
End
Attribute VB_Name = "frmContasReceber"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim vetor(99999) As Long

Private Sub listar()
                Dim bio As Long
                    Dim nome As String
                        Dim linhas As Long
                            Dim nil As String
                            
                          
                            
            msContas.Clear
            msContas.FormatString = "Nota Fiscal      |Historico               |Nome                      |Data de Vencimento          |Valor                  |Pago    |Data de Pagamento   "
            msContas.Rows = 1
            msContas.Rows = 2
                       
            While tabelas.EOF = False
                        
            msContas.TextMatrix(msContas.Rows - 1, 0) = tabelas!codped
            msContas.TextMatrix(msContas.Rows - 1, 1) = "Parcela - " & tabelas!n_parcela
            
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
            
            tabelas2.Close
            tabelas2.Open "select * from clientes where codigo=" & tabelas!cod_cli
            
            msContas.TextMatrix(msContas.Rows - 1, 2) = tabelas2!nome
            
            msContas.TextMatrix(msContas.Rows - 1, 3) = Format(tabelas!data_venc, "dd/mm/yyyy")
            
            
            vetor(msContas.Rows - 1) = tabelas!codigo
            
            msContas.TextMatrix(msContas.Rows - 1, 4) = Format(tabelas!valorparce, "R$ #,##0.00")
            
            msContas.TextMatrix(msContas.Rows - 1, 5) = IIf((tabelas!Pago) = 0, "Não", "Sim")
           
             msContas.TextMatrix(msContas.Rows - 1, 6) = IIf(IsNull(tabelas!dt_pagamento), "  -  ", Format(tabelas!dt_pagamento, "dd/mm/yyyy"))
           
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "select * from contas_a_receber where data_venc= #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas2.EOF = False And tabelas2.BOF = False Then
            If tabelas!data_venc = Date Then
            If tabelas!Pago = False Then
            msContas.Col = 1
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbYellow
            msContas.Col = 2
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbYellow
            msContas.Col = 3
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbYellow
            msContas.Col = 4
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbYellow
            msContas.Col = 5
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbYellow
             msContas.Col = 6
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbYellow
            End If
            End If
            End If
       
            tabelas2.Close
            tabelas2.Open "select * from contas_a_receber where data_venc < #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas2.EOF = False And tabelas2.BOF = False Then
            If tabelas!data_venc < Date Then
            If tabelas!pagp = True Then
            msContas.Col = 1
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbRed
            msContas.Col = 2
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbRed
            msContas.Col = 3
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbRed
            msContas.Col = 4
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbRed
            msContas.Col = 5
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbRed
            msContas.Col = 6
            msContas.Row = msContas.Rows - 1
            msContas.CellBackColor = vbRed
            End If
            End If
            End If
            msContas.Rows = msContas.Rows + 1
            tabelas.MoveNext
            
            Wend
           
            msContas.Rows = msContas.Rows - 1
End Sub
            


Private Sub cmdAlterar_Click()
             Call desativar
             Dim valor As Double
             Dim nome As String
             
             If mskCod = Clear Or txtCusto = Clear Or mskValor = Clear Then
             MsgBox "preencha todos os campos", vbInformation, "atenção"
             Exit Sub
            End If
             
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from Contas_a_receber where codigo=" & vetor(msContas.Row)
            If tabelas.EOF = False And tabelas.BOF = False Then
            If tabelas!Pago = True Then
            MsgBox "Esta conta ja foi recebida", vbInformation
            Exit Sub
            End If
            End If
            tabelas!Pago = -1
            tabelas!dt_pagamento = dtpPag.Value
            tabelas.Update
            
             
             
             If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
            
            If tabelas.BOF = False Or tabelas.EOF = False Then
            tabelas.MoveLast
            cod = tabelas!codigo
            valor = tabelas!valor
            Else
            cod = 0
            valor = 0
            End If
            
            tabelas.Close
            tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
            Call desativar
            tabelas.AddNew
            tabelas!codigo = cod + 1
            tabelas!valor = valor + CCur(mskValor)
            tabelas!codcontar = vetor(msContas.Row)
            tabelas!Parcela = "A receber NF " & mskCod & " " & Replace(txtCusto, "parcela - ", "")

            
            tabelas!entrada = mskValor
            tabelas!data = dtpPag
            
            tabelas.Update
            
            status = "salvas"
              Call crash1
                Call ativar
                  Call Car
                    Call listar
             
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

Call ativar
End Sub

Private Sub gravar()
Call desativar

            If status = "salvas" Then
            tabelas.AddNew
             tabelas!codped = mskCod
            
            End If
            
            txtCusto = "Parcela" & tabelas!n_parcela
            dtpVenc = tabelas!data_venc
            mskValor = tabelas!valor
            tabelas!Nomeconta = txtCusto
            tabelas!dt_vencimento = dtpVenc
            tabelas!valor = mskValor
            tabelas!Pendente = Pendente
            
            tabelas.Update
            
Call ativar
End Sub


Private Sub cmdrel_Click()
Call CaReceber
End Sub

Private Sub Command1_Click()
Call Car
Call listar
End Sub

Private Sub Command2_Click()
If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from contas_a_receber where data_venc= #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas.EOF = False And tabelas.BOF = False Then
            Call listar
            End If
            tabelas.Close
End Sub

Private Sub Command3_Click()
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from contas_a_receber where data_venc < #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas.EOF = False And tabelas.BOF = False Then
            Call listar
            End If
            tabelas.Close
End Sub

Private Sub Command4_Click()
Call desativar
            If txtNomecli = Empty And mskcodcli = Empty Then
        
                 If tabelas.State = adStateOpen Then tabelas.Close
                    If optDtPag = True Then
                        tabelas.Open "select * from contas_a_receber where dt_pagamento between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                     ElseIf optDtVenc = True Then
                        tabelas.Open "select * from contas_a_receber where data_venc between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                     End If
                    'If tabelas.EOF = False And tabelas.BOF = False Then
                        Call listar
                  '  End If
                 'tabelas.Close
                 'Call Cap

            ElseIf txtNomecli = Empty And mskcodcli <> Empty Or txtNomecli <> Empty And mskcodcli <> Empty Then
            
            
                  If optDtPag = True Then
                     tabelas.Close
                     tabelas.Open "select * from contas_a_receber where cod_CLI =" & mskcodcli & " and dt_pagamento between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                         If tabelas.BOF = False And tabelas.EOF = False Then
           
                             If tabelas2.State = adStateOpen Then tabelas2.Close
                                  tabelas2.Open "select * from CLIentes where codigo=" & tabelas!cod_cli
                                  txtNomecli = tabelas2!nome
                                  mskcodcli = tabelas2!codigo
                                  Call listar
                             End If
        
                  ElseIf optDtVenc = True Then
            
                    tabelas.Close
                    tabelas.Open "select * from contas_a_receber where cod_CLI =" & mskcodcli & " and data_venc between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                    
                        If tabelas.BOF = False And tabelas.EOF = False Then
           
                            If tabelas2.State = adStateOpen Then tabelas2.Close
                            tabelas2.Open "select * from clientes where codigo=" & tabelas!cod_cli
                            txtNomecli = tabelas2!nome
                            mskcodcli = tabelas2!codigo
                            Call listar
                            
                        End If
            
                  End If
            
             ElseIf txtNomecli <> Empty And mskcodcli = Empty Then
            
                 If optDtPag = True Then
           
                     If tabelas2.State = adStateOpen Then tabelas2.Close
                      tabelas2.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
                      tabelas2.Close
                      tabelas2.Open "select * from clientes where nome like '" & txtNomecli & "%'"
                        If tabelas2.EOF = False And tabelas2.BOF = False Then
                            If tabelas.State = adStateOpen Then tabelas.Close
                            tabelas.Open "select * from contas_a_receber where cod_CLI=" & tabelas2!codigo & " and dt_pagamento between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                              'If tabelas.EOF = False And tabelas.BOF = False Then
                                  Call listar
                             '  End If
                        End If
                
                 ElseIf optDtVenc = True Then
            
                     If tabelas2.State = adStateOpen Then tabelas2.Close
                      tabelas2.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
                     tabelas2.Close
                     tabelas2.Open "select * from clientes where nome like '" & txtNomecli & "%'"
                          If tabelas2.EOF = False And tabelas2.BOF = False Then
                             If tabelas.State = adStateOpen Then tabelas.Close
                             tabelas.Open "select * from contas_a_receber where cod_CLI=" & tabelas2!codigo & " and data_venc between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                                '   If tabelas.EOF = False And tabelas.BOF = False Then
            
                                    Call listar
                                '   End If
                          End If
                  End If
            
            
            End If
            
    Call ativar
End Sub

Private Sub Command5_Click()
      Call desativar
            If mskcodcli = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from contas_a_receber where cod_cli =" & mskcodcli
            If tabelas.BOF = False And tabelas.EOF = False Then
           
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "select * from clientes where codigo=" & tabelas!cod_cli
            txtNomecli = tabelas2!nome
             mskcodcli = tabelas2!codigo
              dt1.Value = Date
           dt2.Value = Date
            Call listar
            End If
            End If
            Call ativar
End Sub

Private Sub Command6_Click()
Call desativar
            If txtNomecli = Empty Then
            Else
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from clientes where nome like '" & txtNomecli & "%'"
            If tabelas2.EOF = False And tabelas2.BOF = False Then
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from contas_a_receber where cod_cli=" & tabelas2!codigo
            If tabelas.EOF = False And tabelas.BOF = False Then
             dt1.Value = Date
           dt2.Value = Date
            Call listar
            End If
            End If
            End If
            Call ativar
End Sub

Private Sub Command7_Click()
Call VisualizarCaReceber
End Sub
Private Sub VisualizarCaReceber()



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
frmRela.Pictu.Print " Relatório de Contas à Pagar"


frmRela.Pictu.FontSize = 8


'tabelas.Close
'tabelas.Open "Contas_a_receber", conecta, adOpenKeyset, adLockOptimistic
'If optFiltrar = True Then
'If OptPag = True Then
'tabelas.Close
'tabelas.Open "select * from Contas_a_receber where  dt_pagamento between #" & Format(dt1.Value, "mm/dd/yyyy") & "# and #" & Format(dt2.Value, "mm/dd/yyyy") & "#"
'ElseIf optVenc = True Then
'tabelas.Close
'tabelas.Open "select * from Contas_a_receber where  data_venc between #" & Format(dt1.Value, "mm/dd/yyyy") & "# and #" & Format(dt2.Value, "mm/dd/yyyy") & "#"
'End If
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
frmRela.Pictu.Print "Pedido"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

While tabelas.EOF = False
frmRela.Pictu.CurrentX = 500
frmRela.Pictu.Print tabelas!codped;

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
frmRela.Pictu.Print tabelas!n_parcela;

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
frmRela.Pictu.Print "Clientes"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Contas_a_receber", conecta, adOpenKeyset, adLockOptimistic

If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "select * from clientes where codigo =" & tabelas!cod_cli

frmRela.Pictu.CurrentX = 5000
frmRela.Pictu.Print tabelas2!nome;

frmRela.Pictu.CurrentX = 6900

frmRela.Pictu.Print "|"

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack



tabelas.MoveNext
Wend

'----------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 7000

frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Valor"
frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250


tabelas.MoveFirst
While tabelas.EOF = False
frmRela.Pictu.CurrentX = 7000
frmRela.Pictu.Print IIf(IsNull(tabelas!valorparce), "R$0,00", Format(tabelas!valorparce, "R$#,##0.00;(R$#,##0.00)"));

frmRela.Pictu.CurrentX = 8900

frmRela.Pictu.Print "|"

frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack


tabelas.MoveNext
Wend
'----------------------
frmRela.Pictu.CurrentY = 1800
frmRela.Pictu.CurrentX = 9000

frmRela.Pictu.FontBold = True
frmRela.Pictu.Print "Data Vencimento"
frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250


tabelas.MoveFirst

While tabelas.EOF = False
frmRela.Pictu.CurrentX = 9000
frmRela.Pictu.Print Format(tabelas!data_venc, "dd/mm/yyyy")



frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack


tabelas.MoveNext
Wend

'------------------

End Sub


Private Sub Command8_Click()
End Sub

Private Sub Form_Activate()
Call Car
End Sub

Private Sub Form_Load()

actskin.ApplySkin Me.hWnd
actskin2.ApplySkin cmdnovo.hWnd
actskin2.ApplySkin cmdAlterar.hWnd
actskin2.ApplySkin Command1.hWnd
actskin2.ApplySkin Command2.hWnd
actskin2.ApplySkin Command3.hWnd
actskin2.ApplySkin cmdrel.hWnd
optDtPag = True
            Call Car
           dtpPag.Value = Date
           dtpVenc.Value = Date
           dt1.Value = Date
           dt2.Value = Date
             Call listar
              Call total
            linhas = 1
End Sub
Private Sub total()
If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select sum(valorparce) as V from Contas_a_Receber where pago =false"
             lblTotal.Caption = Format(IIf(IsNull(tabelas!v), 0, tabelas!v), "R$ #,##0.00")

End Sub
Private Sub desativar()
mskCod.PromptInclude = False

mskcodcli.PromptInclude = False
End Sub
Private Sub ativar()
mskCod.PromptInclude = True

mskcodcli.PromptInclude = True
End Sub



Private Sub frmconta_DragDrop(Source As Control, X As Single, Y As Single)

End Sub

Private Sub fre_DragDrop(Source As Control, X As Single, Y As Single)

End Sub

Private Sub msContas_Click()
            Dim contas As String

            If msContas.Object = Clear Then
            Exit Sub
            End If
                
             
             If tabelas.State = adStateOpen Then tabelas.Close
             tabelas.Open "select * from Contas_a_receber where  Codigo =" & vetor(msContas.Row)
             If tabelas.BOF = False Or tabelas.EOF = False Then
             
            Call desativar
            mskCod = tabelas!codped
            txtCusto = "Parcela - " & tabelas!n_parcela
            dtpVenc = tabelas!data_venc
            mskValor = tabelas!valorparce
            End If
            End Sub

Private Sub Option1_Click()
Call Car
Call listar
End Sub

Private Sub optNao_Click()
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "Contas_a_receber", conecta, adOpenKeyset, adLockOptimistic
            
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from Contas_a_receber where pago = false"
            Call listar
End Sub

Private Sub optPagas_Click()
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "Contas_a_receber", conecta, adOpenKeyset, adLockOptimistic
            
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from Contas_a_receber where pago = true"
            
            Call listar
End Sub

Private Sub Timer1_Timer()
If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub txtBuscar_Change()

            msContas.Clear
            msContas.Rows = 2
           
            
            If txtBuscar = Clear Then
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "contas_a_receber", conecta, adOpenKeyset, adLockOptimistic
            Call listar
            Exit Sub
            End If
            
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "select * from clientes where nome like '" & txtBuscar & "%'"
            
            If tabelas2.BOF = False And tabelas2.EOF = False Then
            
            tabelas.Close
            tabelas.Open "Select * from contas_a_receber where cod_cli =" & tabelas2!codigo
                       
            If tabelas.BOF = False And tabelas.EOF = False Then
            Call listar
            Else
            Call listar
            End If
            End If
            tabelas2.Close
            msContas.FormatString = "Nota Fiscal      |Historico               |Nome                      |Data de Vencimento          |Valor                  "

End Sub
Private Sub CaReceber()

On Error GoTo 2

Printer.CurrentY = 800
Printer.PaintPicture Picture1, 250, 150
Printer.CurrentX = (Pictu.ScaleWidth / 2) - 1600

Printer.FontSize = 15
Printer.FontBold = True
Printer.Print "LUXUS LTDA."

Printer.CurrentY = 1300

Printer.Print String(500, "-")
Printer.FontBold = False

Printer.FontSize = 8


'tabelas.Close
'tabelas.Open "Contas_a_receber", conecta, adOpenKeyset, adLockOptimistic

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
Printer.Print "Pedido"

Printer.FontBold = False

Printer.CurrentY = 2250

While tabelas.EOF = False
Printer.CurrentX = 500
Printer.Print tabelas!codped;

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
Printer.Print tabelas!n_parcela;

Printer.CurrentX = 4900
Printer.Print "|"

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack



tabelas.MoveNext
Wend
'------------------------
Printer.CurrentY = 1800
Printer.CurrentX = 5000
Printer.FontBold = True
Printer.Print "Clientes"

Printer.FontBold = False

Printer.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Contas_a_receber", conecta, adOpenKeyset, adLockOptimistic

If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "select * from clientes where codigo =" & tabelas!cod_cli

Printer.CurrentX = 5000
Printer.Print tabelas2!nome;

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
Printer.Print "Valor"
Printer.FontBold = False

Printer.CurrentY = 2250


tabelas.MoveFirst
While tabelas.EOF = False
Printer.CurrentX = 7000
Printer.Print IIf(IsNull(tabelas!valorparce), "R$0,00", Format(tabelas!valorparce, "R$#,##0.00;(R$#,##0.00)"));

Printer.CurrentX = 8900

Printer.Print "|"

Printer.ForeColor = &H8000000F
Printer.Print String(500, "-")
Printer.ForeColor = vbBlack


tabelas.MoveNext
Wend
'----------------------
Printer.CurrentY = 1800
Printer.CurrentX = 9000

Printer.FontBold = True
Printer.Print "Data Vencimento"
Printer.FontBold = False

Printer.CurrentY = 2250


tabelas.MoveFirst

While tabelas.EOF = False
Printer.CurrentX = 9000
Printer.Print Format(tabelas!data_venc, "dd/mm/yyyy")



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


