VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmContasPagar 
   BackColor       =   &H80000009&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Contas a Receber"
   ClientHeight    =   7170
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   15510
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7170
   ScaleWidth      =   15510
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
         OleObjectBlob   =   "frmContasAP.frx":0000
         TabIndex        =   12
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   372
         Left            =   10320
         OleObjectBlob   =   "frmContasAP.frx":0060
         TabIndex        =   13
         Top             =   120
         Width           =   1212
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   840
         OleObjectBlob   =   "frmContasAP.frx":00C8
         TabIndex        =   14
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Height          =   6495
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   15375
      Begin VB.CommandButton Command8 
         Caption         =   "Imprimir Relatorio"
         Height          =   375
         Left            =   13200
         TabIndex        =   53
         Top             =   5280
         Width           =   1815
      End
      Begin VB.CommandButton Command7 
         Caption         =   "Visualizar Impressao"
         Height          =   375
         Left            =   13200
         TabIndex        =   52
         Top             =   4800
         Width           =   1815
      End
      Begin VB.Frame Frame2 
         Caption         =   "Busca"
         Height          =   1815
         Left            =   3600
         TabIndex        =   35
         Top             =   4560
         Width           =   9255
         Begin VB.CommandButton Command6 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   3600
            TabIndex        =   51
            Top             =   1200
            Width           =   615
         End
         Begin VB.Frame Frame3 
            Height          =   1095
            Left            =   4800
            TabIndex        =   44
            Top             =   120
            Width           =   4335
            Begin VB.OptionButton optDtVenc 
               Caption         =   "Data de vencimento"
               Height          =   255
               Left            =   2280
               TabIndex        =   50
               Top             =   240
               Width           =   1935
            End
            Begin VB.OptionButton optDtPag 
               Caption         =   "Data de Pagamento"
               Height          =   255
               Left            =   480
               TabIndex        =   49
               Top             =   240
               Width           =   1815
            End
            Begin VB.CommandButton Command4 
               Caption         =   "Buscar"
               Height          =   375
               Left            =   3600
               TabIndex        =   45
               Top             =   600
               Width           =   615
            End
            Begin MSComCtl2.DTPicker dt2 
               Height          =   375
               Left            =   2040
               TabIndex        =   46
               Top             =   600
               Width           =   1455
               _ExtentX        =   2566
               _ExtentY        =   661
               _Version        =   393216
               Format          =   19267585
               CurrentDate     =   39743
            End
            Begin MSComCtl2.DTPicker dt1 
               Height          =   375
               Left            =   360
               TabIndex        =   47
               Top             =   600
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               Format          =   19267585
               CurrentDate     =   39743
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
               Height          =   255
               Left            =   1800
               OleObjectBlob   =   "frmContasAP.frx":0132
               TabIndex        =   48
               Top             =   720
               Width           =   615
            End
         End
         Begin VB.CommandButton Command3 
            Caption         =   "Atrasados"
            Height          =   372
            Left            =   6120
            Picture         =   "frmContasAP.frx":0192
            TabIndex        =   40
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   1320
            Width           =   975
         End
         Begin VB.CommandButton Command2 
            Caption         =   "Hoje"
            Height          =   372
            Left            =   7320
            Picture         =   "frmContasAP.frx":086D
            TabIndex        =   39
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   1320
            Width           =   975
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Todos"
            Height          =   372
            Left            =   4920
            Picture         =   "frmContasAP.frx":0F48
            TabIndex        =   38
            ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
            Top             =   1320
            Width           =   975
         End
         Begin VB.CommandButton Command5 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   1800
            TabIndex        =   37
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox txtNomeFor 
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
            TabIndex        =   36
            Top             =   1200
            Width           =   3255
         End
         Begin MSMask.MaskEdBox mskcodfor 
            Height          =   375
            Left            =   240
            TabIndex        =   41
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
            OleObjectBlob   =   "frmContasAP.frx":1623
            TabIndex        =   42
            Top             =   240
            Width           =   1575
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "frmContasAP.frx":16A3
            TabIndex        =   43
            Top             =   960
            Width           =   1575
         End
      End
      Begin VB.ComboBox cmbForma 
         Height          =   315
         ItemData        =   "frmContasAP.frx":171F
         Left            =   1440
         List            =   "frmContasAP.frx":172F
         Style           =   2  'Dropdown List
         TabIndex        =   33
         Top             =   4080
         Width           =   1335
      End
      Begin VB.PictureBox Picture1 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   2520
         MouseIcon       =   "frmContasAP.frx":1755
         MousePointer    =   99  'Custom
         Picture         =   "frmContasAP.frx":1A5F
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   32
         Top             =   1080
         Width           =   495
      End
      Begin VB.CommandButton cmdBusc_razao 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   8040
         TabIndex        =   29
         Top             =   360
         Width           =   615
      End
      Begin VB.CommandButton cmdBusc_Cod 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   1800
         TabIndex        =   28
         Top             =   1200
         Width           =   615
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   372
         Left            =   1800
         Picture         =   "frmContasAP.frx":1EA1
         TabIndex        =   27
         ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
         Top             =   1800
         Width           =   975
      End
      Begin VB.CommandButton cmdNovo 
         Caption         =   "Novo"
         Height          =   372
         Left            =   1800
         Picture         =   "frmContasAP.frx":257C
         TabIndex        =   22
         ToolTipText     =   "Clique aqui para adicionar um novo Fornecedor"
         Top             =   2520
         Width           =   975
      End
      Begin VB.CommandButton cmdDarBaixa 
         Caption         =   "Dar Baixa"
         Height          =   372
         Left            =   1800
         Picture         =   "frmContasAP.frx":2C57
         TabIndex        =   21
         ToolTipText     =   "Clique aqui para alterar os dados do  Fornecedor ja existente"
         Top             =   2160
         Width           =   975
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
         Left            =   3000
         MaxLength       =   50
         TabIndex        =   18
         Top             =   360
         Width           =   4935
      End
      Begin VB.OptionButton optPagas 
         Caption         =   "Pagas"
         Height          =   375
         Left            =   9120
         TabIndex        =   17
         Top             =   360
         Width           =   855
      End
      Begin VB.OptionButton optNao 
         Caption         =   "Não Pagas"
         Height          =   375
         Left            =   10080
         TabIndex        =   16
         Top             =   360
         Width           =   852
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Todos"
         Height          =   375
         Left            =   10920
         TabIndex        =   15
         Top             =   360
         Width           =   855
      End
      Begin MSComCtl2.DTPicker dtpPag 
         Height          =   375
         Left            =   120
         TabIndex        =   9
         Top             =   1920
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   19267585
         CurrentDate     =   39732
      End
      Begin VB.TextBox txthist 
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
         Locked          =   -1  'True
         MaxLength       =   50
         TabIndex        =   2
         Top             =   4800
         Width           =   2535
      End
      Begin MSMask.MaskEdBox mskValor 
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   3360
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   661
         _Version        =   393216
         Format          =   "R$#,##0.00;(R$#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCod 
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   480
         Width           =   1695
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
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAP.frx":94A9
         TabIndex        =   4
         Top             =   240
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknNomeCusto 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAP.frx":9517
         TabIndex        =   5
         Top             =   4560
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknValor 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAP.frx":957F
         TabIndex        =   6
         Top             =   3120
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknDatapag 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAP.frx":95DF
         TabIndex        =   7
         Top             =   1680
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel sknDatavenc 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAP.frx":9647
         TabIndex        =   8
         Top             =   2400
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker dtpVenc 
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   2640
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   19267585
         CurrentDate     =   39732
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   255
         Left            =   3000
         OleObjectBlob   =   "frmContasAP.frx":96B1
         TabIndex        =   19
         Top             =   120
         Width           =   975
      End
      Begin MSFlexGridLib.MSFlexGrid msContas 
         Height          =   3735
         Left            =   3120
         TabIndex        =   20
         Top             =   840
         Width           =   12135
         _ExtentX        =   21405
         _ExtentY        =   6588
         _Version        =   393216
         Cols            =   7
         BackColorFixed  =   14737632
         FormatString    =   $"frmContasAP.frx":971B
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
         OleObjectBlob   =   "frmContasAP.frx":97B6
         TabIndex        =   23
         Top             =   5280
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel lblTotal 
         Height          =   495
         Left            =   1080
         OleObjectBlob   =   "frmContasAP.frx":9818
         TabIndex        =   24
         Top             =   5280
         Width           =   2775
      End
      Begin MSMask.MaskEdBox mskCod_Forn 
         Height          =   375
         Left            =   120
         TabIndex        =   25
         Top             =   1200
         Width           =   1575
         _ExtentX        =   2778
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
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAP.frx":987C
         TabIndex        =   26
         Top             =   960
         Width           =   855
      End
      Begin MSMask.MaskEdBox mskParc 
         Height          =   375
         Left            =   120
         TabIndex        =   30
         Top             =   4080
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   5
         Format          =   "R$#,##0.00;(R$#,##0.00)"
         Mask            =   "##/##"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmContasAP.frx":98E2
         TabIndex        =   31
         Top             =   3840
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   255
         Left            =   1200
         OleObjectBlob   =   "frmContasAP.frx":994A
         TabIndex        =   34
         Top             =   3840
         Width           =   2175
      End
   End
End
Attribute VB_Name = "frmContasPagar"
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
            msContas.FormatString = "Nota Fiscal      |Historico               |Nome                      |Data de Vencimento          |Valor                  |Pago      |Data de Pagamento"
            msContas.Rows = 1
            msContas.Rows = 2
                       
            While tabelas.EOF = False
                        
            msContas.TextMatrix(msContas.Rows - 1, 0) = tabelas!codigo
            msContas.TextMatrix(msContas.Rows - 1, 1) = tabelas!historico
            
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "Fornecedores", conecta, adOpenKeyset, adLockOptimistic
            
            tabelas2.Close
            tabelas2.Open "select * from fornecedores where codigo=" & tabelas!Cod_Forn
            
            msContas.TextMatrix(msContas.Rows - 1, 2) = tabelas2!razaosocial
            
            msContas.TextMatrix(msContas.Rows - 1, 3) = Format(tabelas!dt_venc, "dd/mm/yyyy")
            
            
            vetor(msContas.Rows - 1) = tabelas!codigo
            
            msContas.TextMatrix(msContas.Rows - 1, 4) = Format(tabelas!valortotal, "R$ #,##0.00")
            
            msContas.TextMatrix(msContas.Rows - 1, 5) = IIf((tabelas!Pago) = 0, "Não", "Sim")
           
           msContas.TextMatrix(msContas.Rows - 1, 6) = IIf((IsNull(tabelas!dt_pag)), "   -   ", Format(tabelas!dt_pag, "dd/mm/yyyy"))
           
           
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "select * from contas_a_pagar where dt_venc= #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas2.EOF = False And tabelas2.BOF = False Then
            If tabelas!dt_venc = Date Then
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
            tabelas2.Open "select * from contas_a_pagar where dt_venc < #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas2.EOF = False And tabelas2.BOF = False Then
            
           If tabelas!dt_venc < Date Then
           If tabelas!Pago = False Then
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
             
             
End Sub

Private Sub cmdBusc_Cod_Click()

            Call desativar
            If mskCod_Forn = Empty Then
            Else
            Call Forne
            tabelas.Close
            tabelas.Open "select * from fornecedores where codigo=" & mskCod_Forn
            If tabelas.BOF = False Or tabelas.EOF = False Then
            txtBuscar = tabelas!razaosocial
            mskCod_Forn = tabelas!codigo
            End If
            End If
            Call ativar
            
End Sub

Private Sub cmdBusc_razao_Click()
            Call desativar
            If txtBuscar = Empty Then
            Else
            Call Forne
            tabelas.Close
            tabelas.Open "select * from fornecedores where razaosocial like '%" & txtBuscar & "%'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            txtBuscar = tabelas!razaosocial
            mskCod_Forn = tabelas!codigo
            End If
            End If
            Call ativar
End Sub


Private Sub VisualizarCaPagar()


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
frmRela.Pictu.Print "Relatório de Contas à Pagar"


frmRela.Pictu.FontSize = 8


'tabelas.Close
'tabelas.Open "Contas_a_Pagar", conecta, adOpenKeyset, adLockOptimistic
'If optFiltrar = True Then
'If OptPag = True Then
'tabelas.Close
'tabelas.Open "select * from Contas_a_Pagar where  dt_pag between #" & Format(dt1.Value, "mm/dd/yyyy") & "# and #" & Format(dt2.Value, "mm/dd/yyyy") & "#"
'ElseIf optVenc = True Then
'tabelas.Close
'tabelas.Open "select * from Contas_a_Pagar where  dt_venc between #" & Format(dt1.Value, "mm/dd/yyyy") & "# and #" & Format(dt2.Value, "mm/dd/yyyy") & "#"
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
frmRela.Pictu.Print "NotaFiscal"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

While tabelas.EOF = False
frmRela.Pictu.CurrentX = 500
frmRela.Pictu.Print tabelas!historico;

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
frmRela.Pictu.Print tabelas!historico;

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
frmRela.Pictu.Print "Fornecedor"

frmRela.Pictu.FontBold = False

frmRela.Pictu.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "select * from fornecedores where codigo =" & tabelas!Cod_Forn


frmRela.Pictu.CurrentX = 5000
frmRela.Pictu.Print tabelas2!razaosocial;

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
frmRela.Pictu.Print IIf(IsNull(tabelas!valortotal), "R$0,00", Format(tabelas!valortotal, "R$#,##0.00;(R$#,##0.00)"));

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
frmRela.Pictu.Print Format(tabelas!dt_venc, "dd/mm/yyyy")



frmRela.Pictu.ForeColor = &H8000000F
frmRela.Pictu.Print String(500, "-")
frmRela.Pictu.ForeColor = vbBlack


tabelas.MoveNext
Wend

'------------------


End Sub



Private Sub cmdDarBaixa_Click()
            Call desativar
             Dim valor As Double
             Dim nome As String
             
             If mskCod = Clear Or mskValor = Clear Or mskCod_Forn = Clear Then
             MsgBox "preencha todos os campos", vbInformation, "atenção"
             Exit Sub
            End If
             
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from Contas_a_pagar where codigo=" & vetor(msContas.Row)
            If tabelas!Pago = True Then
            MsgBox "Voce ja deu baixa nesta conta!", vbInformatio
            Exit Sub
            End If
            
            
            
            
            
            tabelas!Pago = -1
            tabelas!forma = cmbForma.Text
            tabelas!dt_pag = dtpPag
            tabelas.Update
            If cmbForma.Text = "Cartao" Or cmbForma.Text = "Boleto" Then GoTo Y
             
             
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
            
             If tabelas.BOF = True Or tabelas.EOF = True Then GoTo qqq
              If CCur(mskValor) > tabelas!valor Then
qqq:
            MsgBox "Nao a dinheiro suficiente em caixa", vbInformation
            
            Call Cap
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from Contas_a_pagar where codigo=" & vetor(msContas.Row)
             
             tabelas!Pago = 0
            tabelas!forma = Empty
            tabelas!dt_pag = Empty
            tabelas.Update
            
            Call Cap
            Exit Sub
            End If
            
            
            
            tabelas.Close
            tabelas.Open "caixa", conecta, adOpenKeyset, adLockOptimistic
            Call desativar
            tabelas.AddNew
            tabelas!codigo = cod + 1
            tabelas!valor = valor - CCur(mskValor)
            tabelas!codcontap = vetor(msContas.Row)
            tabelas!Parcela = "A pagar NF " & mskCod & " " & Replace(txtCusto, "parcela - ", "")
            tabelas!saida = mskValor
            tabelas!data = dtpPag
            
            tabelas.Update
            
            
Y:
            status = "salvas"
              Call crash1
                Call ativar
                  Call Cap
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

End Sub

Private Sub cmdSalvar_Click()
Call desativar
If mskCod_Forn = Empty Then
MsgBox "Digite o numero da nota fiscal", vbExclamation
Else
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from fornecedores where codigo=" & mskCod_Forn
If tabelas2.EOF = True Or tabelas2.BOF = True Then
MsgBox "Este Fornecedor não e Valido", vbExclamation
tabelas2.Close
Exit Sub
End If
tabelas2.Close
cmdBusc_Cod = True

status = "salvas"
Call desativar
If mskCod = Empty Or mskCod_Forn = Empty Or txtBuscar = Empty Or mskValor = Empty Or txthist = Empty Or cmbForma.Text = Empty Then
MsgBox "Todos os campo são obrigatórios!"
Exit Sub
End If


Call Cap
tabelas.Close
tabelas.Open "select * from contas_a_pagar where codigo =" & mskCod
If tabelas.BOF = True Or tabelas.EOF = True Then
Call gravar_cap
Call crash1
Call Cap
Call listar
Else
MsgBox "Esta nota fiscal já foi salva em outra conta a pagar!"
End If
End If
Call ativar

End Sub
Private Sub gravar_cap()

If status = "salvas" Then
tabelas.AddNew
tabelas!codigo = mskCod
End If

tabelas!valortotal = mskValor
tabelas!dt_venc = dtpVenc
tabelas!Cod_Forn = mskCod_Forn
tabelas!historico = txthist
tabelas.Update
End Sub
Private Sub Command1_Click()
Call Cap
Call listar
End Sub

Private Sub Command2_Click()
If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from contas_a_pagar where dt_venc= #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas.EOF = False And tabelas.BOF = False Then
            Call listar
            End If
            tabelas.Close
End Sub

Private Sub Command3_Click()
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from contas_a_pagar where dt_venc < #" & Format(Date, "mm/dd/yyyy") & "#"
            If tabelas.EOF = False And tabelas.BOF = False Then
            Call listar
            End If
            tabelas.Close
End Sub

Private Sub Command4_Click()
Call desativar
            If txtNomeFor = Empty And mskCodfor = Empty Then
        
                 If tabelas.State = adStateOpen Then tabelas.Close
                    If optDtPag = True Then
                        tabelas.Open "select * from contas_a_pagar where dt_pag between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                     ElseIf optDtVenc = True Then
                        tabelas.Open "select * from contas_a_pagar where dt_venc between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                     End If
                    'If tabelas.EOF = False And tabelas.BOF = False Then
                        Call listar
                  '  End If
                 'tabelas.Close
                 'Call Cap

            ElseIf txtNomeFor = Empty And mskCodfor <> Empty Or txtNomeFor <> Empty And mskCodfor <> Empty Then
            
            
                  If optDtPag = True Then
                     tabelas.Close
                     tabelas.Open "select * from contas_a_pagar where cod_forn =" & mskCodfor & " and dt_pag between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                         If tabelas.BOF = False And tabelas.EOF = False Then
           
                             If tabelas2.State = adStateOpen Then tabelas2.Close
                                  tabelas2.Open "select * from fornecedores where codigo=" & tabelas!Cod_Forn
                                  txtNomeFor = tabelas2!razaosocial
                                  mskCodfor = tabelas2!codigo
                                  Call listar
                             End If
        
                  ElseIf optDtVenc = True Then
            
                    tabelas.Close
                    tabelas.Open "select * from contas_a_pagar where cod_forn =" & mskCodfor & " and dt_venc between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                    
                        If tabelas.BOF = False And tabelas.EOF = False Then
           
                            If tabelas2.State = adStateOpen Then tabelas2.Close
                            tabelas2.Open "select * from fornecedores where codigo=" & tabelas!Cod_Forn
                            txtNomeFor = tabelas2!razaosocial
                            mskCodfor = tabelas2!codigo
                            Call listar
                            
                        End If
            
                  End If
            
             ElseIf txtNomeFor <> Empty And mskCodfor = Empty Then
            
                 If optDtPag = True Then
           
                     If tabelas2.State = adStateOpen Then tabelas2.Close
                      tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
                      tabelas2.Close
                      tabelas2.Open "select * from fornecedores where razaosocial like '" & txtNomeFor & "%'"
                        If tabelas2.EOF = False And tabelas2.BOF = False Then
                            If tabelas.State = adStateOpen Then tabelas.Close
                            tabelas.Open "select * from contas_a_pagar where cod_forn=" & tabelas2!codigo & " and dt_pag between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
                              'If tabelas.EOF = False And tabelas.BOF = False Then
                                  Call listar
                             '  End If
                        End If
                
                 ElseIf optDtVenc = True Then
            
                     If tabelas2.State = adStateOpen Then tabelas2.Close
                      tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
                     tabelas2.Close
                     tabelas2.Open "select * from fornecedores where razaosocial like '" & txtNomeFor & "%'"
                          If tabelas2.EOF = False And tabelas2.BOF = False Then
                             If tabelas.State = adStateOpen Then tabelas.Close
                             tabelas.Open "select * from contas_a_pagar where cod_forn=" & tabelas2!codigo & " and dt_venc between #" & Format(dt1, "mm/dd/yyyy") & "# and #" & Format(dt2, "mm/dd/yyyy") & "#"
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
            If mskCodfor = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from contas_a_pagar where cod_forn =" & mskCodfor
            If tabelas.BOF = False And tabelas.EOF = False Then
           
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "select * from fornecedores where codigo=" & tabelas!Cod_Forn
            txtNomeFor = tabelas2!razaosocial
             mskCodfor = tabelas2!codigo
              dt1.Value = Date
           dt2.Value = Date
            Call listar
            End If
            End If
            Call ativar
End Sub

Private Sub Command6_Click()
            Call desativar
            If txtNomeFor = Empty Then
            Else
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from fornecedores where razaosocial like '" & txtNomeFor & "%'"
            If tabelas2.EOF = False And tabelas2.BOF = False Then
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from contas_a_pagar where cod_forn=" & tabelas2!codigo
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
Call VisualizarCaPagar
End Sub

Private Sub Command8_Click()
Call CaPagar
End Sub

Private Sub Form_Activate()
Call Cap
End Sub

Private Sub Form_Load()

actskin.ApplySkin Me.hWnd
actskin2.ApplySkin cmdNovo.hWnd
'actskin2.ApplySkin cmdAlterar.hWnd
actskin2.ApplySkin Command1.hWnd
actskin2.ApplySkin Command2.hWnd
actskin2.ApplySkin Command3.hWnd
 actskin2.ApplySkin cmdDarBaixa.hWnd
 actskin2.ApplySkin cmdSalvar.hWnd
            optDtPag = True
            
            Call Cap
           dtpPag.Value = Date
           dtpVenc.Value = Date + Month(1)
           dt1.Value = Date
           dt2.Value = Date
             Call listar
              Call total
            linhas = 1
End Sub
Private Sub total()
If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select sum(valortotal) as V from Contas_a_pagar where pago =0"
            lblTotal.Caption = Format(IIf(IsNull(tabelas!v), 0, tabelas!v), "R$ #,##0.00")

End Sub
Private Sub desativar()
mskCod.PromptInclude = False
mskCod_Forn.PromptInclude = False
mskCodfor.PromptInclude = False
mskParc.PromptInclude = False
End Sub
Private Sub ativar()
mskCod.PromptInclude = True
mskCod_Forn.PromptInclude = True
mskCodfor.PromptInclude = True
mskParc.PromptInclude = True
End Sub



Private Sub frmconta_DragDrop(Source As Control, x As Single, Y As Single)

End Sub

Private Sub fre_DragDrop(Source As Control, x As Single, Y As Single)

End Sub

Private Sub msContas_Click()
            Dim contas As String

            If msContas.Object = Clear Then
            Exit Sub
            End If
                
             
             If tabelas.State = adStateOpen Then tabelas.Close
             tabelas.Open "select * from Contas_a_pagar where  Codigo =" & vetor(msContas.Row)
             If tabelas.BOF = False Or tabelas.EOF = False Then
             
            Call desativar
            mskCod = tabelas!codigo
            mskCod_Forn = tabelas!Cod_Forn
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "Fornecedores", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "Select * from fornecedores where codigo=" & mskCod_Forn
            txtBuscar = tabelas2!razaosocial
            dtpVenc = tabelas!dt_venc
            dtpPag = IIf(IsNull(tabelas!dt_pag), Date, tabelas!dt_pag)
            txthist = tabelas!historico
            mskValor = tabelas!valortotal
            cmbForma.Text = IIf(IsNull(tabelas!forma), "dinheiro", tabelas!forma)

            End If
            Call Cap
            End Sub

Private Sub mskCod_LostFocus()
mskCod.PromptInclude = False
mskParc.PromptInclude = False
txthist = "NF " & mskCod & " a pagar " & Format(IIf(IsEmpty(mskParc), "", mskParc), "00/00")
mskParc.PromptInclude = True
mskCod.PromptInclude = True
End Sub

Private Sub mskParc_LostFocus()
mskCod.PromptInclude = False
mskParc.PromptInclude = False
txthist = "NF " & mskCod & " a pagar " & Format(IIf(IsEmpty(mskParc), "", mskParc), "00/00")
mskParc = Format(IIf(IsEmpty(mskParc), "", mskParc), "00/00")
mskParc.PromptInclude = True
mskCod.PromptInclude = True

End Sub

Private Sub Option1_Click()
Call Cap
Call listar
End Sub

Private Sub optNao_Click()
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "Contas_a_pagar", conecta, adOpenKeyset, adLockOptimistic
            
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from Contas_a_pagar where pago = false"
            Call listar
End Sub

Private Sub optPagas_Click()
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "Contas_a_pagar", conecta, adOpenKeyset, adLockOptimistic
            
            If tabelas.State = adStateOpen Then tabelas.Close
            tabelas.Open "select * from Contas_a_pagar where pago = true"
            
            Call listar
End Sub

Private Sub Picture1_Click()
forn = True
Me.Enabled = False
frmB5.Show
End Sub

Private Sub SkinLabel6_DragDrop(Source As Control, x As Single, Y As Single)

End Sub

Private Sub Timer1_Timer()
If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub txtBuscar_Change()

'            msContas.Clear
'            msContas.Rows = 2
'
'
'            If txtBuscar = Clear Then
'            If tabelas.State = adStateOpen Then tabelas.Close
'            tabelas.Open "contas_a_receber", conecta, adOpenKeyset, adLockOptimistic
'            Call listar
'            Exit Sub
'            End If
'
'            If tabelas2.State = adStateOpen Then tabelas2.Close
'            tabelas2.Open "select * from clientes where nome like '" & txtBuscar & "%'"
'
'            If tabelas2.BOF = False And tabelas2.EOF = False Then
'
'            tabelas.Close
'            tabelas.Open "Select * from contas_a_receber where cod_cli =" & tabelas2!codigo
'
'            If tabelas.BOF = False And tabelas.EOF = False Then
'            Call listar
'            Else
'            Call listar
'            End If
'            End If
'            tabelas2.Close
'            msContas.FormatString = "Nota Fiscal      |Historico               |Nome                      |Data de Vencimento          |Valor                  "

End Sub

Private Sub CaPagar()

On Error GoTo 2
Printer.CurrentY = 800
Printer.PaintPicture Picture1, 200, 10, 2655, 1695
Printer.CurrentX = (Pictu.ScaleWidth / 2) - 1600

Printer.FontSize = 15
Printer.FontBold = True
Printer.Print "LUXUS LTDA."

Printer.CurrentY = 1300

Printer.Print String(500, "-")
Printer.FontBold = False

Printer.FontSize = 8


'tabelas.Close
'tabelas.Open "Contas_a_Pagar", conecta, adOpenKeyset, adLockOptimistic

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
Printer.Print "NotaFiscal"

Printer.FontBold = False

Printer.CurrentY = 2250

While tabelas.EOF = False
Printer.CurrentX = 500
Printer.Print tabelas!nf;

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
Printer.Print tabelas!historico;

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
Printer.Print "Fornecedor"

Printer.FontBold = False

Printer.CurrentY = 2250

tabelas.MoveFirst

While tabelas.EOF = False
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Contas_a_Pagar", conecta, adOpenKeyset, adLockOptimistic
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "select * from fornecedores where codigo =" & tabelas!CodForn

Printer.CurrentX = 5000
Printer.Print tabelas2!razaosocial;

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
Printer.Print IIf(IsNull(tabelas!valortotal), "R$0,00", Format(tabelas!valortotal, "R$#,##0.00;(R$#,##0.00)"));

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
Printer.Print Format(tabelas!dt_venc, "dd/mm/yyyy")



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


