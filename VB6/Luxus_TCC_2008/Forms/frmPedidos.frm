VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmPedidos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Controle de Pedidos"
   ClientHeight    =   5460
   ClientLeft      =   180
   ClientTop       =   705
   ClientWidth     =   12195
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5460
   ScaleWidth      =   12195
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   120
      Top             =   1200
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
      Height          =   4812
      Left            =   120
      TabIndex        =   6
      Top             =   600
      Width           =   12012
      Begin VB.Frame Venda 
         Height          =   4695
         Left            =   2280
         TabIndex        =   59
         Top             =   120
         Visible         =   0   'False
         Width           =   9735
         Begin VB.CommandButton Command3 
            Caption         =   "Imprimir Comprovante "
            Height          =   375
            Left            =   7680
            TabIndex        =   80
            Top             =   4200
            Width           =   1935
         End
         Begin VB.CommandButton Command2 
            Caption         =   "Visualizar Comprovante "
            Height          =   375
            Left            =   7680
            TabIndex        =   77
            Top             =   3720
            Width           =   1935
         End
         Begin VB.TextBox txtEntra 
            Enabled         =   0   'False
            Height          =   375
            Left            =   4560
            MaxLength       =   7
            TabIndex        =   76
            Text            =   "0"
            Top             =   480
            Width           =   1695
         End
         Begin VB.Frame Frame1 
            Caption         =   "Parcelado"
            Height          =   615
            Left            =   2640
            TabIndex        =   72
            Top             =   240
            Visible         =   0   'False
            Width           =   1815
            Begin VB.OptionButton Option2 
               Caption         =   "Nao"
               Height          =   255
               Left            =   960
               TabIndex        =   74
               Top             =   240
               Width           =   735
            End
            Begin VB.OptionButton Option1 
               Caption         =   "Sim"
               Height          =   255
               Left            =   240
               TabIndex        =   73
               Top             =   240
               Width           =   735
            End
         End
         Begin VB.ComboBox cmbForma 
            Height          =   315
            ItemData        =   "frmPedidos.frx":0000
            Left            =   360
            List            =   "frmPedidos.frx":0010
            Style           =   2  'Dropdown List
            TabIndex        =   71
            Top             =   480
            Width           =   1815
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel15 
            Height          =   255
            Left            =   360
            OleObjectBlob   =   "frmPedidos.frx":0036
            TabIndex        =   70
            Top             =   240
            Width           =   1695
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel13 
            Height          =   255
            Left            =   2640
            OleObjectBlob   =   "frmPedidos.frx":00B8
            TabIndex        =   68
            Top             =   960
            Width           =   1815
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
            Height          =   255
            Left            =   360
            OleObjectBlob   =   "frmPedidos.frx":0134
            TabIndex        =   67
            Top             =   960
            Width           =   855
         End
         Begin VB.CommandButton Command4 
            Caption         =   "Cancelar"
            Height          =   495
            Left            =   7680
            TabIndex        =   66
            Top             =   2640
            Width           =   1215
         End
         Begin VB.CommandButton cmdConc 
            Caption         =   "Concluir"
            Height          =   495
            Left            =   7680
            TabIndex        =   65
            Top             =   2040
            Width           =   1215
         End
         Begin MSFlexGridLib.MSFlexGrid mfgPArc 
            Height          =   2535
            Left            =   240
            TabIndex        =   64
            Top             =   1800
            Width           =   7335
            _ExtentX        =   12938
            _ExtentY        =   4471
            _Version        =   393216
            Cols            =   5
            BackColorFixed  =   14737632
            Enabled         =   0   'False
            FormatString    =   "Numero                    |Juros          |Amortizaçao               |Parcela                |Saldo                       "
         End
         Begin VB.CommandButton cmdCalc 
            Caption         =   "Calcular"
            Enabled         =   0   'False
            Height          =   375
            Left            =   6480
            TabIndex        =   63
            Top             =   1200
            Width           =   975
         End
         Begin VB.TextBox txtJuros 
            Enabled         =   0   'False
            Height          =   375
            Left            =   4680
            TabIndex        =   62
            Top             =   1200
            Width           =   1695
         End
         Begin VB.TextBox txtParc 
            Enabled         =   0   'False
            Height          =   375
            Left            =   2640
            TabIndex        =   61
            Top             =   1200
            Width           =   1695
         End
         Begin VB.TextBox txtSaldo 
            Height          =   375
            Left            =   360
            TabIndex        =   60
            Top             =   1200
            Width           =   1935
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
            Height          =   255
            Left            =   4680
            OleObjectBlob   =   "frmPedidos.frx":019C
            TabIndex        =   69
            Top             =   960
            Width           =   1815
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel16 
            Height          =   255
            Left            =   4560
            OleObjectBlob   =   "frmPedidos.frx":0206
            TabIndex        =   75
            Top             =   240
            Width           =   1815
         End
      End
      Begin VB.PictureBox SSTab1 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   675
         Left            =   1440
         ScaleHeight     =   675
         ScaleWidth      =   4095
         TabIndex        =   49
         Top             =   4800
         Width           =   4092
         Begin VB.PictureBox pctNav 
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   0  'None
            Height          =   375
            Left            =   240
            Picture         =   "frmPedidos.frx":0272
            ScaleHeight     =   375
            ScaleWidth      =   375
            TabIndex        =   55
            Top             =   120
            Visible         =   0   'False
            Width           =   375
         End
         Begin VB.PictureBox pctluxus 
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   0  'None
            Height          =   375
            Left            =   120
            Picture         =   "frmPedidos.frx":07FC
            ScaleHeight     =   375
            ScaleWidth      =   495
            TabIndex        =   54
            Top             =   120
            Width           =   495
         End
         Begin VB.PictureBox pctBuscar 
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   0  'None
            Height          =   495
            Left            =   120
            Picture         =   "frmPedidos.frx":10C6
            ScaleHeight     =   495
            ScaleWidth      =   495
            TabIndex        =   53
            Top             =   120
            Visible         =   0   'False
            Width           =   495
         End
         Begin VB.PictureBox pctNovo 
            BackColor       =   &H80000009&
            BorderStyle     =   0  'None
            Height          =   495
            Left            =   120
            Picture         =   "frmPedidos.frx":1D90
            ScaleHeight     =   495
            ScaleWidth      =   495
            TabIndex        =   52
            Top             =   120
            Visible         =   0   'False
            Width           =   495
         End
         Begin VB.PictureBox pctSalvar 
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   0  'None
            Height          =   495
            Left            =   120
            Picture         =   "frmPedidos.frx":2A5A
            ScaleHeight     =   495
            ScaleWidth      =   615
            TabIndex        =   51
            Top             =   120
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.PictureBox pctExcluir 
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   0  'None
            Height          =   495
            Left            =   240
            Picture         =   "frmPedidos.frx":3324
            ScaleHeight     =   495
            ScaleWidth      =   375
            TabIndex        =   50
            Top             =   120
            Visible         =   0   'False
            Width           =   375
         End
         Begin VB.Label lblh 
            AutoSize        =   -1  'True
            BackColor       =   &H00E0E0E0&
            Caption         =   "Luxus System"
            Height          =   195
            Left            =   1080
            TabIndex        =   56
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.Frame Frame3 
         Height          =   735
         Left            =   6000
         TabIndex        =   44
         Top             =   3840
         Width           =   2415
         Begin VB.CommandButton cmdUlt 
            Caption         =   ">>"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1680
            Picture         =   "frmPedidos.frx":3FEE
            TabIndex        =   48
            Top             =   240
            Width           =   615
         End
         Begin VB.CommandButton cmdAnt 
            Caption         =   "<"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   720
            Picture         =   "frmPedidos.frx":4430
            TabIndex        =   47
            Top             =   240
            Width           =   495
         End
         Begin VB.CommandButton cmdProx 
            Caption         =   ">"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1200
            Picture         =   "frmPedidos.frx":4872
            TabIndex        =   46
            Top             =   240
            Width           =   495
         End
         Begin VB.CommandButton cmdPrim 
            Caption         =   "<<"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            Picture         =   "frmPedidos.frx":4CB4
            TabIndex        =   45
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Frame Frame9 
         Caption         =   "Produto"
         Height          =   1332
         Left            =   4440
         TabIndex        =   29
         Top             =   2520
         Width           =   7332
         Begin VB.CommandButton cmdRlista 
            Caption         =   "Remover"
            Height          =   375
            Left            =   5160
            TabIndex        =   58
            Top             =   840
            Width           =   855
         End
         Begin VB.CommandButton cmdaddLista 
            Caption         =   "Add"
            Height          =   375
            Left            =   4200
            TabIndex        =   57
            Top             =   840
            Width           =   855
         End
         Begin VB.PictureBox mouse2 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   6480
            ScaleHeight     =   615
            ScaleWidth      =   675
            TabIndex        =   43
            Top             =   240
            Width           =   675
            Begin VB.Image imgMouse2 
               Height          =   615
               Left            =   0
               MouseIcon       =   "frmPedidos.frx":50F6
               MousePointer    =   99  'Custom
               Picture         =   "frmPedidos.frx":5400
               Stretch         =   -1  'True
               Top             =   0
               Width           =   675
            End
         End
         Begin VB.PictureBox imgBuscar2 
            BorderStyle     =   0  'None
            Height          =   855
            Left            =   6360
            ScaleHeight     =   855
            ScaleWidth      =   855
            TabIndex        =   40
            Top             =   120
            Visible         =   0   'False
            Width           =   855
            Begin VB.Image Image1 
               Height          =   855
               Left            =   0
               MouseIcon       =   "frmPedidos.frx":11742
               MousePointer    =   99  'Custom
               Picture         =   "frmPedidos.frx":11A4C
               Stretch         =   -1  'True
               Top             =   0
               Width           =   945
            End
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   1200
            TabIndex        =   39
            Top             =   480
            Width           =   615
         End
         Begin VB.ComboBox txtNomeprod 
            Height          =   288
            Left            =   3120
            TabIndex        =   38
            Top             =   480
            Width           =   1695
         End
         Begin VB.TextBox txtPreço 
            Height          =   288
            Left            =   4920
            TabIndex        =   36
            Top             =   480
            Width           =   1095
         End
         Begin VB.TextBox txtCodprod 
            Height          =   375
            Left            =   240
            TabIndex        =   30
            Top             =   480
            Width           =   852
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
            Height          =   372
            Left            =   3120
            OleObjectBlob   =   "frmPedidos.frx":1DD8E
            TabIndex        =   31
            Top             =   240
            Width           =   972
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "frmPedidos.frx":1DDEC
            TabIndex        =   32
            Top             =   240
            Width           =   855
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
            Height          =   252
            Left            =   1920
            OleObjectBlob   =   "frmPedidos.frx":1DE4E
            TabIndex        =   34
            Top             =   240
            Width           =   1332
         End
         Begin MSMask.MaskEdBox mskqtd 
            Height          =   372
            Left            =   2040
            TabIndex        =   35
            Top             =   480
            Width           =   972
            _ExtentX        =   1720
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
            Height          =   372
            Left            =   4800
            OleObjectBlob   =   "frmPedidos.frx":1DEB8
            TabIndex        =   37
            Top             =   240
            Width           =   852
         End
      End
      Begin VB.CommandButton cmdExclu 
         Caption         =   "Cancelar"
         Height          =   495
         Left            =   10680
         TabIndex        =   25
         Top             =   3960
         Width           =   972
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   495
         Left            =   8760
         TabIndex        =   24
         Top             =   3960
         Width           =   975
      End
      Begin VB.CommandButton cmdnovo 
         Caption         =   "Novo"
         Height          =   495
         Left            =   9720
         TabIndex        =   23
         Top             =   3960
         Width           =   975
      End
      Begin VB.Frame Frame6 
         Caption         =   "Situação"
         Height          =   855
         Left            =   4440
         TabIndex        =   20
         Top             =   3840
         Width           =   1455
         Begin VB.OptionButton optVenda 
            Caption         =   "Venda"
            Height          =   195
            Left            =   120
            TabIndex        =   22
            Top             =   600
            Width           =   855
         End
         Begin VB.OptionButton optOrcamento 
            Caption         =   "Orçamento"
            Height          =   255
            Left            =   120
            TabIndex        =   21
            Top             =   240
            Width           =   1095
         End
      End
      Begin VB.Frame Frame8 
         Caption         =   "Informações"
         Height          =   1932
         Left            =   2280
         TabIndex        =   13
         Top             =   240
         Width           =   2052
         Begin VB.TextBox txtValor 
            Height          =   375
            Left            =   360
            Locked          =   -1  'True
            TabIndex        =   18
            Top             =   1080
            Width           =   1452
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
            Height          =   252
            Left            =   240
            OleObjectBlob   =   "frmPedidos.frx":1DF18
            TabIndex        =   14
            Top             =   240
            Width           =   492
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
            Height          =   252
            Left            =   240
            OleObjectBlob   =   "frmPedidos.frx":1DF76
            TabIndex        =   15
            Top             =   1560
            Width           =   612
         End
         Begin ACTIVESKINLibCtl.SkinLabel Label_Hora 
            Height          =   252
            Left            =   840
            OleObjectBlob   =   "frmPedidos.frx":1DFD4
            TabIndex        =   16
            Top             =   1560
            Width           =   972
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
            Height          =   252
            Left            =   120
            OleObjectBlob   =   "frmPedidos.frx":1E03A
            TabIndex        =   17
            Top             =   840
            Width           =   1452
         End
         Begin MSComCtl2.DTPicker mskData 
            Height          =   372
            Left            =   360
            TabIndex        =   28
            Top             =   480
            Width           =   1332
            _ExtentX        =   2355
            _ExtentY        =   661
            _Version        =   393216
            Format          =   96796673
            CurrentDate     =   36161
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Cilente"
         Height          =   1692
         Left            =   120
         TabIndex        =   8
         Top             =   2160
         Width           =   4212
         Begin VB.PictureBox mouse1 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   2880
            ScaleHeight     =   615
            ScaleWidth      =   675
            TabIndex        =   42
            Top             =   360
            Width           =   675
            Begin VB.Image imgMouse 
               Height          =   615
               Left            =   0
               MouseIcon       =   "frmPedidos.frx":1E0A6
               MousePointer    =   99  'Custom
               Picture         =   "frmPedidos.frx":1E3B0
               Stretch         =   -1  'True
               Top             =   0
               Width           =   675
            End
         End
         Begin VB.PictureBox imgBuscar 
            BorderStyle     =   0  'None
            Height          =   855
            Left            =   2760
            ScaleHeight     =   855
            ScaleWidth      =   915
            TabIndex        =   41
            Top             =   240
            Visible         =   0   'False
            Width           =   915
            Begin VB.Image Image2 
               Height          =   855
               Left            =   0
               MouseIcon       =   "frmPedidos.frx":2A6F2
               MousePointer    =   99  'Custom
               Picture         =   "frmPedidos.frx":2A9FC
               Stretch         =   -1  'True
               Top             =   0
               Width           =   915
            End
         End
         Begin VB.CommandButton cmdBuscar_Cod_Cli 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   1320
            TabIndex        =   27
            Top             =   480
            Width           =   615
         End
         Begin VB.CommandButton cmdBuscaCliente 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   2520
            TabIndex        =   19
            Top             =   1200
            Width           =   615
         End
         Begin VB.TextBox txtNome_Cliente 
            Height          =   375
            Left            =   360
            TabIndex        =   12
            Top             =   1200
            Width           =   2052
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
            Height          =   252
            Left            =   240
            OleObjectBlob   =   "frmPedidos.frx":36D3E
            TabIndex        =   9
            Top             =   240
            Width           =   1932
         End
         Begin MSMask.MaskEdBox mskCod_Cliente 
            Height          =   372
            Left            =   360
            TabIndex        =   10
            Top             =   480
            Width           =   852
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   -2147483648
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   252
            Left            =   240
            OleObjectBlob   =   "frmPedidos.frx":36DB6
            TabIndex        =   11
            Top             =   960
            Width           =   1932
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   120
         Top             =   720
      End
      Begin VB.CommandButton cmdBusca_Pedido 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   1560
         TabIndex        =   2
         Top             =   1080
         Width           =   615
      End
      Begin MSMask.MaskEdBox mskNum_Pedido 
         Height          =   375
         Left            =   600
         TabIndex        =   1
         Top             =   600
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
         Left            =   240
         OleObjectBlob   =   "frmPedidos.frx":36E2A
         TabIndex        =   7
         Top             =   240
         Width           =   2055
      End
      Begin MSMask.MaskEdBox mskNum_Pedido_Busca 
         Height          =   375
         Left            =   600
         TabIndex        =   26
         Top             =   1080
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin MSFlexGridLib.MSFlexGrid FlexItens 
         Height          =   2295
         Left            =   4560
         TabIndex        =   33
         Top             =   240
         Width           =   7455
         _ExtentX        =   13150
         _ExtentY        =   4048
         _Version        =   393216
         Cols            =   5
         ForeColor       =   0
         BackColorFixed  =   14737632
         BackColorBkg    =   12632256
         FormatString    =   "Codigo do Prod        |Nome  do Produto                    |Quantidade      |Preco Unitario |Sub Total         "
      End
      Begin MSMask.MaskEdBox mskNF 
         Height          =   375
         Left            =   720
         TabIndex        =   78
         Top             =   1800
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   9
         Mask            =   "#########"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel17 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmPedidos.frx":36EA8
         TabIndex        =   79
         Top             =   1440
         Width           =   2775
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
         OleObjectBlob   =   "frmPedidos.frx":36F1C
         TabIndex        =   3
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   372
         Left            =   7920
         OleObjectBlob   =   "frmPedidos.frx":36F80
         TabIndex        =   4
         Top             =   120
         Width           =   2052
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmPedidos.frx":36FEC
         TabIndex        =   5
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
Attribute VB_Name = "frmPedidos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As Integer
Dim b As Integer
Dim navegaçao As Integer
Dim Situacao As Integer
Dim dia As String
Dim ano As String
Dim mes As String
Dim linha As Integer
Dim final As Integer
Dim parc As Boolean
Dim elizama As Boolean

Private Sub baixar()
 If Situacao = -1 Then
    Dim cont As Integer
    Dim qtd As Long
        Call estoque
        While cont < FlexItens.Rows - 1
        cont = cont + 1
        
        
        
        If tabelas2.State = adStateOpen Then tabelas2.Close
        tabelas2.Open "produtos", conecta, adOpenKeyset, adLockOptimistic
        tabelas2.Close
        tabelas2.Open "select * from produtos where codigo = '" & FlexItens.TextMatrix(cont, 0) & "'"
        
        
        If tabelas3.State = adStateOpen Then tabelas3.Close
        tabelas3.Open "peças_mod", conecta, adOpenKeyset, adLockOptimistic
        tabelas3.Close
        tabelas3.Open "select * from peças_mod where codModelo =" & tabelas2!cod_modelo
       tabelas3!codpe = tabelas3!codpe
       
         If tabelas2.State = adStateOpen Then tabelas2.Close
        tabelas2.Open "peças", conecta, adOpenKeyset, adLockOptimistic
        tabelas2.Close
        tabelas2.Open "select * from peças where codigo =" & tabelas3!codpe

       
       If tabelas3.EOF = False And tabelas3.BOF = False Then
       tabelas3.MoveFirst
       
       '------------------------------------------------
        While tabelas3.EOF = False
        tabelas.Close
        tabelas.Open "select * from estoque where codigo=" & tabelas3!codpe
        
         
        
        If tabelas!Qtd_atual - (tabelas3!qtd * FlexItens.TextMatrix(cont, 2)) <= 0 Then
         MsgBox "A peça " & tabelas2!nome & " esta em falta" & Chr(13) & " a venda nao pode ser concluida!", vbExclamation
         If tabelas!Qtd_atual <= 0 Then
          tabelas!Qtd_atual = 0
          tabelas.Update
          
          
         End If
         final = 1
         Exit Sub
        Else
         If tabelas!Qtd_atual <= tabelas!qtd_min Then MsgBox " A quantidade(" & tabelas!Qtd_atual & ") da peça " & tabelas2!nome & " esta na quantidade minima(" & tabelas!qtd_min & ") por favor providencia reposição do estoque", vbInformation
        End If
        
         tabelas3.MoveNext
         
        Wend
        End If
       '------------------------------------
       ' If tabelas3.EOF = False And tabelas3.BOF = False Then
       tabelas3.MoveFirst
       
       
       While tabelas3.EOF = False
        tabelas.Close
        tabelas.Open "select * from estoque where codigo=" & tabelas3!codpe
        
        tabelas!Qtd_atual = tabelas!Qtd_atual - (tabelas3!qtd * FlexItens.TextMatrix(cont, 2))
        If tabelas!Qtd_atual <= tabelas!qtd_min Then MsgBox " A quantidade(" & tabelas!Qtd_atual & ") da peça " & tabelas2!nome & " esta na quantidade minima(" & tabelas!qtd_min & ") por favor providencia reposição do estoque", vbInformation
        tabelas.Update
       
        
        'historico do estoque
          Call Hist_estoque
           If tabelas5.State = adStateOpen Then tabelas5.Close
          tabelas5.Open "historico_estoque", conecta, adOpenKeyset, adLockOptimistic
          If tabelas5.State = adStateOpen Then tabelas5.Close
          tabelas5.Open "select * from historico_estoque where cod_estoque=" & tabelas3!codpe
          If tabelas5.EOF = False And tabelas5.BOF = False Then
          tabelas5.MoveLast
          tabelas4.AddNew
          tabelas4!data = mskData.Value
          mskNum_Pedido.PromptInclude = False
          tabelas4!ND = "Venda cf NF " & mskNum_Pedido
          mskNum_Pedido.PromptInclude = True
          tabelas4!qtd_saida = tabelas3!qtd * FlexItens.TextMatrix(cont, 2)
            
         tabelas4!saida_medio = tabelas2!preço_venda
          tabelas4!atual_medio = tabelas5!atual_medio
          tabelas4!valor_saida = (tabelas3!qtd * FlexItens.TextMatrix(cont, 2)) * tabelas5!atual_medio
          tabelas4!cod_estoque = tabelas3!codpe
            
          tabelas4!Qtd_atual = tabelas5!Qtd_atual - (tabelas3!qtd * FlexItens.TextMatrix(cont, 2))
          tabelas4!valor_atual = tabelas5!valor_atual - ((tabelas3!qtd * FlexItens.TextMatrix(cont, 2)) * tabelas5!atual_medio)
          tabelas4.Update
          End If
            tabelas3.MoveNext
        Wend
        '-------------------------------------------------------------
        
Wend
End If
If tabelas3.State = adStateOpen Then tabelas3.Close
If tabelas2.State = adStateOpen Then tabelas2.Close
End Sub

Private Sub Tirar()
Dim o As Object
        For Each o In Me.Controls
        If TypeOf o Is TextBox Then o = Replace(Replace(o, "'", "''"), Chr(34), "")

        Next
End Sub
Private Sub por()
Dim o As Object
        For Each o In Me.Controls
        If TypeOf o Is TextBox Then o = Replace(o, "''", "'")
        Next
End Sub

Private Sub desativar()
mskqtd.PromptInclude = False
       mskNum_Pedido.PromptInclude = False
       mskNum_Pedido_Busca.PromptInclude = False
       mskCod_Cliente.PromptInclude = False
       mskNF.PromptInclude = False
       Call Tirar
End Sub



Private Sub carregar_lista()
 With flexClientes
            
            Dim cont1 As Integer
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!razaosocial
            .TextMatrix(cont1, 2) = tabelas!cnpj
            .TextMatrix(cont1, 3) = tabelas!telefone
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!razaosocial
            .TextMatrix(cont1, 2) = tabelas!cnpj
            .TextMatrix(cont1, 3) = tabelas!telefone

            Else
            cont1 = Clear
            End If
            Wend
            
             End If
            End With
           
End Sub



Private Sub cmbForma_Click()
Select Case cmbForma.Text
Case "Dinheiro"
       Option2 = False
        Frame1.Visible = False
        txtParc.Enabled = False
        txtJuros.Enabled = False
        cmdCalc.Enabled = False
        mfgPArc.Enabled = False
        txtEntra.Enabled = False
        elizama = False

Case "Cheque"
        Option2 = False
        Frame1.Visible = False
        txtParc.Enabled = False
        txtJuros.Enabled = False
        cmdCalc.Enabled = False
        mfgPArc.Enabled = False
        txtEntra.Enabled = False
        elizama = False

        
Case "Cartao"
        Option2 = True
        Frame1.Visible = True
        
Case "Boleto"
        Option2 = True
        Frame1.Visible = True
       
End Select

End Sub

Private Sub cmdaddLista_Click()
Call desativar

tabelas2.Open "produtos", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from produtos where codigo= '" & txtCodprod & "'"
If tabelas2.EOF = True Or tabelas2.BOF = True Then
MsgBox "Este produto não e Valido", vbExclamation
tabelas2.Close
Exit Sub
End If
tabelas2.Close
Command1 = True

With FlexItens
Dim cont As Integer
cont = 1
While cont < .Rows
If txtCodprod = .TextMatrix(cont, 0) Then
.TextMatrix(cont, 2) = CCur(.TextMatrix(cont, 2)) + CCur(mskqtd)
txtValor = Format(CCur(Replace(txtValor, "R$ ", "")) + CCur(Replace(txtpreço, "R$ ", "")), "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(cont, 4) = Format(Replace(txtpreço, "R$ ", "") * .TextMatrix(cont, 2), "R$ #,##0.00;(R$#,##0.00)")
Exit Sub
End If
cont = cont + 1
Wend


.Rows = .Rows + 1
linha = linha + 1
.TextMatrix(linha, 4) = Format(Replace(txtpreço, "R$ ", "") * mskqtd, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(linha, 0) = txtCodprod
.TextMatrix(linha, 1) = txtNomeprod.Text
.TextMatrix(linha, 2) = mskqtd
.TextMatrix(linha, 3) = txtpreço

If txtValor = Empty Then txtValor = "0"
txtValor = Format(CCur(Replace(txtValor, "R$ ", "")) + CCur(Replace(txtpreço, "R$ ", "")), "R$ #,##0.00;(R$#,##0.00)")

If .TextMatrix(.Rows - 1, 0) = Empty Then .Rows = .Rows - 1
End With


Call ativar

End Sub

Private Sub cmdBuscar_Cod_Cli_Click()
Call desativar
            If mskCod_Cliente = Empty Then
            Else
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "Clientes", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from Clientes  where Codigo=" & mskCod_Cliente
            If tabelas2.BOF = False Or tabelas2.EOF = False Then
             mskCod_Cliente = tabelas2!codigo
             txtNome_Cliente = tabelas2!nome
            End If
            tabelas2.Close
            End If
            Call ativar
           
End Sub



Private Sub cmdCalc_Click()
Dim saldo As Double
Dim juros As Double
Dim Parcela As Double
Dim k As Double
Dim Vj As Double
Dim amort As Double
Dim AmortT As Double
Dim JurosT As Double
Dim ParcelaT As Double


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
.TextMatrix(Parcela, 3) = Format((txtSaldo / txtParc), "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 0) = Parcela
.TextMatrix(Parcela, 1) = Format("0", "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 2) = Format(txtSaldo / txtParc, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 4) = Format(saldo, "R$ #,##0.00;(R$#,##0.00)")
saldo = saldo - (txtSaldo / txtParc)
Parcela = Parcela + 1
Wend
.TextMatrix(Parcela, 3) = Format((txtParc * (txtSaldo / txtParc)), "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 0) = "TOTAL:"
.TextMatrix(Parcela, 1) = Format("0", "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 2) = Format((txtParc * (txtSaldo / txtParc)), "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 4) = Format("0", "R$ #,##0.00;(R$#,##0.00)")

End With


Else



juros = (txtJuros / 100)
k = (juros * (1 + juros) ^ txtParc) / ((1 + juros) ^ txtParc - 1)
With mfgPArc
.Rows = txtParc + 2

Parcela = 1
saldo = Replace(txtSaldo, "R$ ", "")
While Parcela <= txtParc

Vj = juros * saldo
JurosT = JurosT + Vj

amort = (k * Replace(txtSaldo, "R$", "")) - Vj
AmortT = AmortT + amort

saldo = saldo - amort

.TextMatrix(Parcela, 3) = Format(k * Replace(txtSaldo, "R$ ", ""), "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 0) = Parcela
.TextMatrix(Parcela, 1) = Format(Vj, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 2) = Format(amort, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 4) = Format(saldo, "R$ #,##0.00;(R$#,##0.00)")
Parcela = Parcela + 1
Wend
.TextMatrix(Parcela, 3) = Format((k * Replace(txtSaldo, "R$ ", "")) * txtParc, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 0) = "TOTAL:"
.TextMatrix(Parcela, 1) = Format(JurosT, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(Parcela, 2) = Format(AmortT, "R$ #,##0.00;(R$#,##0.00)")

End With

End If
End If
JurosT = Clear
AmortT = Clear






End Sub

Private Sub cmdConc_Click()
Call desativar
 If Not IsDate(mskData) Then
            mskData = Clear
            MsgBox "Data invalida", vbExclamation
            Else
        If cmbForma.Text = Empty Then
        MsgBox "Escolha uma forma de pagamento", vbInformation
        Exit Sub
        End If
     'codigo autometico
             mskNum_Pedido.PromptInclude = False

        If mskNum_Pedido = Empty Then
        If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 100
        While b = Empty
        
        tabelas.Close
        tabelas.Open "select * from Vendas where Num_Pedido=" & a
        If tabelas.BOF = False Or tabelas.EOF = False Then
        a = a + 1
        Else
        b = 1
        Call Pedidos
        End If
        Wend
        Else
        a = 100
        End If
        mskNum_Pedido = a
        b = Clear
        End If
         
        tabelas.Close
        tabelas.Open "select * from Vendas where Num_Pedido=" & mskNum_Pedido
            mskNum_Pedido.PromptInclude = True
        If tabelas.BOF = False Or tabelas.EOF = False Then
        If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
        
          If tabelas!Venda = True Then
        MsgBox "Este Pedido Ja foi fechado e nao pode ser alterado ou removido", vbExclamation
        Call ativar
        Call Pedidos
        Exit Sub
        End If
        
        status = "alteradas"
        mskNum_Pedido.PromptInclude = False
        conecta.Execute "delete * from itens_vendas where numpedido=" & mskNum_Pedido
        mskNum_Pedido.PromptInclude = True
        
       
        
        Call baixar
        If final = 1 Then GoTo fim
        If tabelas.State = adStateOpen Then tabelas.Close
        mskNum_Pedido.PromptInclude = False
        tabelas.Open "select * from vendas where num_pedido=" & mskNum_Pedido
        mskNum_Pedido.PromptInclude = True
        Call salvar
        Call salvar_itens
        Call salvarcaixa
        Call enviar
        Call Pedidos
        End If
        
        Else
        
        
        status = "salvas"
        mskNum_Pedido.PromptInclude = False
        conecta.Execute "delete * from itens_vendas where numpedido=" & mskNum_Pedido
        mskNum_Pedido.PromptInclude = True
        Call baixar
        If final = 1 Then GoTo fim
         Call Pedidos
        Call salvar
        Call salvar_itens
        Call salvarcaixa
        Call enviar
        End If
        End If
        
        
        
fim:
        Call ativar
        final = Clear
End Sub

Private Sub cmdRlista_Click()
If FlexItens.TextMatrix(1, 0) = "" Then
MsgBox "Nao a itens a serem excluidos", vbInformation
Exit Sub
End If
FlexItens.Rows = FlexItens.Rows + 1
txtValor = txtValor - CCur(FlexItens.TextMatrix(FlexItens.Row, 4))
If FlexItens.Rows > 3 Then
FlexItens.Row = FlexItens.Rows - 1
End If
FlexItens.RemoveItem (FlexItens.Row)
If FlexItens.Rows > 2 Then FlexItens.Rows = FlexItens.Rows - 1
linha = linha - 1
End Sub


Private Sub Command1_Click()
If txtCodprod = Empty Then Exit Sub
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "produtos", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from produtos where codigo = '" & txtCodprod & "'"
If tabelas2.EOF = False And tabelas2.BOF = False Then
txtCodprod = tabelas2!codigo
txtpreço = Format(tabelas2!Preço, "R$ #,##0.00;(R$#,##0.00)")
txtNomeprod = tabelas2!nome
End If
tabelas2.Close



End Sub

Private Sub flexClientes_Click()
             Call desativar
             mskCod = flexClientes.TextMatrix(flexClientes.Row, 0)
            cmdBuscCod = True
            Call ativar
            Frame2.Visible = True
            Frame1.Visible = False
            TabStrip1.MultiSelect = True
            Skin3.ApplySkin (TabStrip1.hWnd)
            txtbuscas = Clear
            
End Sub

Private Sub flexClientes_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
 lblh.Caption = "Clique em um registro para levalo a outra aba"
            pctluxus.Visible = False
            pctBuscar.Visible = True
End Sub


Private Sub ativar()
             mskNum_Pedido.PromptInclude = True
       mskNum_Pedido_Busca.PromptInclude = True
       mskqtd.PromptInclude = True
       mskNF.PromptInclude = True
       mskCod_Cliente.PromptInclude = True
       Call por
End Sub


Private Sub cmdAnt_Click()
             Call desativar
             If mskNum_Pedido = Empty Then
             If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            Call mostrar
            End If
            Else
            If navegaçao <> Empty Then
            tabelas.MoveFirst
            While navegaçao <> Empty
            If tabelas!num_pedido = navegaçao Then
            tabelas.MovePrevious
            If tabelas.BOF = False Then Call mostrar Else Exit Sub
            navegaçao = Clear
            Else
            tabelas.MoveNext
            End If
            Wend
            Else
            
            
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MovePrevious
            If tabelas.BOF = True Then tabelas.MoveFirst
            Call mostrar
            Else
            MsgBox "NAO A PEDIDOS CADASTRADOS", vbExclamation
            End If
            End If
            End If
            Call ativar
End Sub


Private Sub cmdAnt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o Registro anterior"
pctNav.Visible = True
pctluxus.Visible = False

End Sub

Private Sub cmdBusca_Pedido_Click()
            Call desativar
            If mskNum_Pedido_Busca = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from Vendas  where Num_Pedido=" & mskNum_Pedido_Busca
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            End If
            End If
            Call ativar
            Call Pedidos
End Sub




Private Sub cmdExclu_Click()
           Call desativar
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If mskNum_Pedido = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
           On Error GoTo d
           conecta.Execute "delete * from itens_vendas where numpedido=" & mskNum_Pedido
           conecta.Execute "delete * from Vendas where Num_Pedido=" & mskNum_Pedido
           cmdNovo = True
           status = "excluidos"
           Call crash1
           navegaçao = Clear
           Call Pedidos
           End If
           End If
           Call ativar
         Exit Sub
d:
MsgBox "Este Pedido não pode ser excluido pois ja possui um historico", vbExclamation
End Sub

Private Sub cmdExclu_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exclui um Registro"
pctExcluir.Visible = True
pctluxus.Visible = False
pctNovo.Visible = False
pctSalvar.Visible = False
End Sub

Private Sub cmdnovo_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Limpa todas as caixas de texto"
pctNovo.Visible = True
pctluxus.Visible = False
pctSalvar.Visible = False
End Sub

Private Sub cmdPrim_Click()
            Call desativar
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            Call mostrar
            Else
            MsgBox "NAO A PEDIDOS CADASTRADOS", vbExclamation
            End If
            Call ativar
End Sub

Private Sub cmdPrim_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o primeiro Registro"
pctNav.Visible = True
pctluxus.Visible = False

End Sub

Private Sub cmdProx_Click()
            Call desativar
            If mskNum_Pedido = Empty Then
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            Call mostrar
            End If
            Else
            If navegaçao <> Empty Then
            tabelas.MoveFirst
            While navegaçao <> Empty
            If tabelas!num_pedido = navegaçao Then
            tabelas.MoveNext
            If tabelas.EOF = False Then Call mostrar Else Exit Sub
            navegaçao = Clear
            Else
            tabelas.MoveNext
            End If
            Wend
            Else
            
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveNext
            If tabelas.EOF = True Then tabelas.MoveLast
            Call mostrar
            Else
            MsgBox "NAO A PEDIDOS CADASTRADOS", vbExclamation
            End If
            Call ativar
            End If
            End If
           
End Sub

Private Sub cmdProx_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o proximo Registro"
pctNav.Visible = True
pctluxus.Visible = False

End Sub

Private Sub cmdSalvar_Click()
        Call desativar
        If optVenda = True And mskNF = Empty Then
        MsgBox "Digite o numero da Nota Fiscal", vbInformation
        Exit Sub
        End If
        If mskData = Empty Or txtValor = Empty Or mskCod_Cliente = Empty Or optOrcamento = False And optVenda = False Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        
        If tabelas2.State = adStateOpen Then tabelas2.Close
        tabelas2.Open "Clientes", conecta, adOpenKeyset, adLockOptimistic
        tabelas2.Close
        tabelas2.Open "select * from Clientes where codigo=" & mskCod_Cliente
        If tabelas2.EOF = True Or tabelas2.BOF = True Then
        MsgBox "Este Cliente não esta cadastrado", vbExclamation
        tabelas2.Close
        Exit Sub
        End If
        tabelas2.Close
        cmdBuscar_Cod_Cli = True
        
        
       Venda.Visible = True
       txtSaldo = txtValor
       End If
        
End Sub

Private Sub salvar_itens()

        
        Dim cont As Integer
        
        Call Itens
        
        While cont < FlexItens.Rows - 1
        cont = cont + 1
        tabelas.AddNew
        mskNum_Pedido.PromptInclude = False
        tabelas!numpedido = mskNum_Pedido
        mskNum_Pedido.PromptInclude = True
        tabelas!Cod_Prod = FlexItens.TextMatrix(cont, 0)
        tabelas!Quant = FlexItens.TextMatrix(cont, 2)
        tabelas!Preco_Unitario = Replace(FlexItens.TextMatrix(cont, 3), "R$ ", "")
        tabelas!Total_Total = Replace(FlexItens.TextMatrix(cont, 4), "R$ ", "")
        tabelas.Update
        Wend
        Call Pedidos

End Sub


Private Sub cmdSalvar_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Salva um cadastro"
pctSalvar.Visible = True
pctluxus.Visible = False
pctExcluir.Visible = False
pctNovo.Visible = False
End Sub

Private Sub cmdUlt_Click()

            Call desativar
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveLast
            Call mostrar
            Else
            MsgBox "NAO A PEDIDOS CADASTRADOS", vbExclamation
            End If
            Call ativar
End Sub
Private Sub cmdBuscaCliente_Click()
            Call desativar
            If txtNome_Cliente = Empty Then
            MsgBox "Digite um nome para Buscar", vbExclamation
            Else
            tabelas2.Open "Clientes", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from clientes where nome like '" & txtNome_Cliente & "%'"
            If tabelas2.BOF = False Or tabelas2.EOF = False Then
            txtNome_Cliente = tabelas2!nome
            mskCod_Cliente = tabelas2!codigo
            End If
            tabelas2.Close
            End If
            Call ativar
End Sub

Private Sub cmdNovo_Click()
          Call desativar
         mskNum_Pedido = Clear
         mskNum_Pedido_Busca = Clear
         mskData = Clear
         txtValor = Clear
         mskCod_Cliente = Clear
         txtNome_Cliente = Clear
         optOrcamento = False
         optVenda = False
         FlexItens.Clear
         FlexItens.FormatString = ("Codigo do Prod        |Nome  do Produto                    |Quantidade      |Preco Unitario |Sub Total         ")
         FlexItens.Rows = 2
          mskData.Value = Date
          linha = Empty
          txtCodprod = Clear
          txtpreço = Clear
          txtNomeprod.Text = ""
          mskqtd = Clear
          Label_Hora.Caption = Time
          cmbForma.ListIndex = 0
          
txtParc = Empty
txtJuros = Empty
txtEntra = Empty
elizama = False
mfgPArc.Clear
mfgPArc.FormatString = "Numero                    |Juros          |Amortizaçao               |Parcela                |Saldo                       "
mfgPArc.Rows = 2


             Call ativar
            
        
End Sub

Private Sub cmdUlt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o ultimo Registro"
pctNav.Visible = True
pctluxus.Visible = False
End Sub





Private Sub Command2_Click()
With frmRela


 .Pictu.FontSize = 12

.Pictu.CurrentY = 1000

If optVenda = True Then
.Pictu.Print Tab(1 + 1); "Comprovante de ";
.Pictu.FontUnderline = True
.Pictu.Print "Pedido de Venda"
.Pictu.FontUnderline = False
Else
.Pictu.FontUnderline = True
.Pictu.Print Tab(1 + 1); "ORÇAMENTO"
.Pictu.FontUnderline = False
End If


.Pictu.Print String(150, "-")

.Pictu.Print Spc(60 - 20);
.Pictu.FontBold = True
.Pictu.FontSize = 15
.Pictu.PaintPicture frmRela.Image1, 700, 1500, 2455, 1495
.Pictu.Print "LUXUS LTDA"
.FontBold = False

.Pictu.FontSize = 12

'ainda em aguarde....
.FontBold = False
.FontSize = 10

.Pictu.Print Spc(29); "Rd. Régis Bittercort; Nº810, Embu "
.Pictu.Print Spc(32); " CNPJ 43.698.669/0001-65"
.Pictu.Print Spc(32); "   São Paulo  "; Spc(1); mskData
.Pictu.Print String(150, "-")
Call desativar
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Clientes", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from clientes where codigo=" & mskCod_Cliente


.Pictu.Print "   Nota Fiscal nº "; mskNF
.Pictu.Print "   Código do Cliente - "; mskCod_Cliente
.Pictu.Print "   Nome do Cliente - "; txtNome_Cliente
If tabelas2!cpf <> Empty Then .Pictu.Print "   CPF - "; Format(tabelas2!cpf, "###-###-###-#")
If tabelas2!cnpj <> Empty Then .Pictu.Print "   CNPJ - "; Format(tabelas2!cnpj, "###-###-###-#")



.Pictu.Print String(150, "-")
Call ativar
Dim er As Integer
er = 1
While er < FlexItens.Rows

.Pictu.Print " "; er; "- "; "Codigo-"; FlexItens.TextMatrix(er, 0); "   Nome-"; FlexItens.TextMatrix(er, 1); "   Quant-" & FlexItens.TextMatrix(er, 2) & "  " & "   Preço-" & FlexItens.TextMatrix(er, 3); "   Sub Total-"; FlexItens.TextMatrix(er, 4)
er = er + 1
       
       
 If er < FlexItens.Rows Then
.Pictu.ForeColor = &H8000000F
.Pictu.Print String(150, "-")
.Pictu.ForeColor = vbBlack
End If
       
Wend
.Pictu.Print String(150, "-")
.Pictu.Print "    Total - " & txtValor;
.Pictu.Print Spc(20); Format(Now, "long date")
.Pictu.Print Spc(40); "Muito obrigado pela preferencia!"






End With





End Sub

Private Sub Command3_Click()


 Printer.FontSize = 12

Printer.CurrentY = 1000

If optVenda = True Then
Printer.Print Tab(1 + 1); "Comprovante de ";
Printer.FontUnderline = True
Printer.Print "Pedido de Venda"
Printer.FontUnderline = False
Else
Printer.FontUnderline = True
Printer.Print Tab(1 + 1); "ORÇAMENTO"
Printer.FontUnderline = False
End If


Printer.Print String(150, "-")

Printer.Print Spc(60 - 20);
Printer.FontBold = True
Printer.FontSize = 15
Printer.PaintPicture frmRela.Image1, 700, 1500, 2455, 1495
Printer.Print "LUXUS LTDA"
Printer.FontBold = False

Printer.FontSize = 12

'ainda em aguarde....
Printer.FontBold = False
Printer.FontSize = 10

Printer.Print Spc(29); "Rd. Régis Bittercort; Nº810, Embu "
Printer.Print Spc(32); " CNPJ 43.698.669/0001-65"
Printer.Print Spc(32); "   São Paulo  "; Spc(1); mskData
Printer.Print String(150, "-")
Call desativar
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Clientes", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from clientes where codigo=" & mskCod_Cliente


Printer.Print "   Nota Fiscal nº "; mskNF
Printer.Print "   Código do Cliente - "; mskCod_Cliente
Printer.Print "   Nome do Cliente - "; txtNome_Cliente
If tabelas2!cpf <> Empty Then Printer.Print "   CPF - "; Format(tabelas2!cpf, "###-###-###-#")
If tabelas2!cnpj <> Empty Then Printer.Print "   CNPJ - "; Format(tabelas2!cnpj, "###-###-###-#")



Printer.Print String(150, "-")
Call ativar
Dim er As Integer
er = 1
While er < FlexItens.Rows

Printer.Print " "; er; "- "; "Codigo-"; FlexItens.TextMatrix(er, 0); "   Nome-"; FlexItens.TextMatrix(er, 1); "   Quant-" & FlexItens.TextMatrix(er, 2) & "  " & "   Preço-" & FlexItens.TextMatrix(er, 3); "   Sub Total-"; FlexItens.TextMatrix(er, 4)
er = er + 1
       
       
 If er < FlexItens.Rows Then
Printer.ForeColor = &H8000000F
Printer.Print String(150, "-")
Printer.ForeColor = vbBlack
End If
       
Wend
Printer.Print String(150, "-")
Printer.Print "    Total - " & txtValor;
Printer.Print Spc(20); Format(Now, "long date")
Printer.Print Spc(40); "Muito obrigado pela preferencia!"









End Sub

Private Sub Command4_Click()
Venda.Visible = False
End Sub

Private Sub FlexItens_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
If Not FlexItens.TextMatrix(1, 0) = Empty Then
If Button = vbRightButton Then
PopupMenu mnuMenu
End If
End If

End Sub

Private Sub Form_Activate()
Call Pedidos
End Sub


Private Sub salvar()
Call desativar
If status = "salvas" Then
tabelas.AddNew
End If
tabelas!num_pedido = mskNum_Pedido
navegaçao = mskNum_Pedido
tabelas!data = mskData.Value
tabelas!Valor_Total = Replace(txtValor, "R$ ", "")
tabelas!cod_cli = mskCod_Cliente
tabelas!Venda = Situacao
tabelas!Hora = Label_Hora.Caption
tabelas!Forma_p = cmbForma.Text
tabelas!parcelado = False
tabelas!N_NF = mskNF
If elizama = True Then
tabelas!parcelado = True
tabelas!entrada = Replace(txtEntra, "R$ ", "")
tabelas!parcelas = txtParc
tabelas!juros = txtJuros
End If

tabelas.Update
Call crash1
Call Pedidos
status = Clear
Call ativar
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            SendKeys "{Tab}"
            End If

End Sub

Private Sub enviar()
Call Produçao
tabelas.AddNew
mskNum_Pedido.PromptInclude = False
tabelas!numpedido = mskNum_Pedido
mskNum_Pedido.PromptInclude = True
tabelas!status = False
tabelas.Update

End Sub
Private Sub Form_Load()
            
            mskData.Value = Date
            
              actskin.ApplySkin Me.hWnd
             actskin2.ApplySkin (cmdSalvar.hWnd)
             actskin2.ApplySkin (cmdNovo.hWnd)
             actskin2.ApplySkin (cmdExclu.hWnd)
             actskin2.ApplySkin (cmdConc.hWnd)
             actskin2.ApplySkin (cmdCalc.hWnd)
             actskin2.ApplySkin (Command4.hWnd)
            actskin2.ApplySkin (cmdaddLista.hWnd)
            actskin2.ApplySkin (cmdRlista.hWnd)
             actskin2.ApplySkin (Frame5.hWnd)
            actskin2.ApplySkin (Venda.hWnd)
            
            Call Produtos
             If tabelas.EOF = False And tabelas.BOF = False Then
            tabelas.MoveFirst
            If tabelas.EOF = False And tabelas.BOF = False Then
            txtNomeprod.AddItem (tabelas!nome)
            End If
            End If

            While tabelas.EOF = False
            tabelas.MoveNext
            If tabelas.EOF = False And tabelas.BOF = False Then
            txtNomeprod.AddItem (tabelas!nome)
            End If
            Wend
            
            
            Call Pedidos
           
            Label_Hora.Caption = Time
            
            optOrcamento = True
 FlexItens.FormatString = ("Codigo do Prod        |Nome  do Produto                    |Quantidade      |Preco Unitario |Sub Total         ")
            
End Sub


Private Sub Form_Unload(Cancel As Integer)
            If tabelas.State = adStateOpen Then tabelas.Close
            linha = Empty
End Sub

Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
            mouse1.Visible = True
End Sub

Private Sub Frame2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
                                   mouse1.Visible = True
imgBuscar.Visible = False
mouse2.Visible = True
imgBuscar2.Visible = False

End Sub


Private Sub mostrar()
Call desativar
mskNum_Pedido = tabelas!num_pedido
mskData = tabelas!data
txtValor = Format(tabelas!Valor_Total, "R$ #,##0.00;(R$#,##0.00)")
mskCod_Cliente = tabelas!cod_cli
Situacao = tabelas!Venda
mskNF = tabelas!N_NF
navegaçao = tabelas!num_pedido
Label_Hora.Caption = tabelas!Hora

If tabelas!parcelado = True Then
cmbForma = IIf(IsNull(tabelas!Forma_p), "0", tabelas!Forma_p)
txtParc = IIf(IsNull(tabelas!parcelas), "0", tabelas!parcelas)
txtJuros = IIf(IsNull(tabelas!juros), "0", tabelas!juros)
txtEntra = IIf(IsNull(tabelas!entrada), "0", tabelas!entrada)
Option1 = True
cmdCalc = True
Else
cmbForma.ListIndex = 0
txtParc = Empty
txtJuros = Empty
txtEntra = Empty
mfgPArc.Clear
mfgPArc.FormatString = "Numero                    |Juros          |Amortizaçao               |Parcela                |Saldo                       "
mfgPArc.Rows = 2
End If
If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "produtos", conecta, adOpenKeyset, adLockOptimistic

FlexItens.Clear
FlexItens.Rows = 2
FlexItens.FormatString = ("Codigo do Prod        |Nome  do Produto                    |Quantidade      |Preco Unitario |Sub Total         ")
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "itens_vendas", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from itens_vendas where numpedido=" & mskNum_Pedido
Dim cont As Integer
cont = 1
While tabelas2.EOF = False
FlexItens.TextMatrix(cont, 0) = tabelas2!Cod_Prod

tabelas3.Close
tabelas3.Open "select * from Produtos where codigo ='" & tabelas2!Cod_Prod & "'"
FlexItens.TextMatrix(cont, 1) = tabelas3!nome

FlexItens.TextMatrix(cont, 2) = tabelas2!Quant
FlexItens.TextMatrix(cont, 3) = Format(tabelas2!Preco_Unitario, "R$ #,##0.00;(R$#,##0.00)")
FlexItens.TextMatrix(cont, 4) = Format(tabelas2!Total_Total, "R$ #,##0.00;(R$#,##0.00)")
cont = cont + 1
FlexItens.Rows = FlexItens.Rows + 1
tabelas2.MoveNext
Wend
FlexItens.Rows = FlexItens.Rows - 1
tabelas2.Close
tabelas3.Close




cmdBuscar_Cod_Cli = True
If Situacao = 0 Then optOrcamento.SetFocus
If Situacao = -1 Then optVenda.SetFocus
Call ativar
End Sub




Private Sub Frame7_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
                       mouse1.Visible = True
imgBuscar.Visible = False
mouse2.Visible = True
imgBuscar2.Visible = False
End Sub


Private Sub Frame9_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
                       mouse1.Visible = True
imgBuscar.Visible = False
mouse2.Visible = True
imgBuscar2.Visible = False
End Sub


Private Sub Image1_Click()
Me.Enabled = False
frmB2.Show
End Sub

Private Sub Image2_Click()
Me.Enabled = False
frmB.Show

End Sub

Private Sub imgMouse_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse1.Visible = False
imgBuscar.Visible = True
End Sub

Private Sub imgMouse2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse2.Visible = False
imgBuscar2.Visible = True
End Sub

Private Sub mnuAlt_Click()
FlexItens.TextMatrix(FlexItens.Row, 2) = InputBox("Digite a nova Quantidade", "Luxus Systen")
End Sub

Private Sub mnuConsCli_Click()
frmClientes.Show

frmClientes.mskCod.PromptInclude = False
mskCod_Cliente.PromptInclude = False
frmClientes.mskCod = mskCod_Cliente
mskCod_Cliente.PromptInclude = True
frmClientes.mskCod.PromptInclude = True
frmClientes.cmdBuscCod = True

End Sub

Private Sub mnuConsFor_Click()
frmProdutos.Show

frmProdutos.mskCod_Busca = FlexItens.TextMatrix(FlexItens.Row, 0)
frmProdutos.cmdBuscar_Codigo = True

End Sub

Private Sub mnuExc_Click()
If FlexItens.TextMatrix(1, 0) = "" Then
MsgBox "Nao a itens a serem excluidos", vbInformation
Exit Sub
End If
If MsgBox("Deseja excluir da lista o item: " & FlexItens.TextMatrix(FlexItens.Row, 1), vbQuestion + vbYesNo + vbDefaultButton2) = vbYes Then
FlexItens.Rows = FlexItens.Rows + 1
txtValor = Format(Replace(txtValor, "R$ ", "") - CCur(Replace(FlexItens.TextMatrix(FlexItens.Row, 4), "R$ ", "")), "R$ #,##0.00;(R$#,##0.00)")
FlexItens.RemoveItem (FlexItens.Row)
linha = linha - 1
If FlexItens.Rows > 2 Then FlexItens.Rows = FlexItens.Rows - 1
End If
End Sub

Private Sub MSFlexGrid1_Click()

End Sub

Private Sub Option1_Click()
txtParc.Enabled = True
txtJuros.Enabled = True
cmdCalc.Enabled = True
mfgPArc.Enabled = True
txtEntra.Enabled = True
elizama = True
End Sub

Private Sub Option2_Click()
txtParc.Enabled = False
txtJuros.Enabled = False
cmdCalc.Enabled = False
mfgPArc.Enabled = False
txtEntra.Enabled = False
elizama = False
End Sub

Private Sub optOrcamento_Click()
Situacao = 0
End Sub

Private Sub optVenda_Click()
Situacao = -1
End Sub

Private Sub TabStrip1_Click()
Select Case TabStrip1.SelectedItem.Index
Case Is = 1
Frame1.Visible = False
Frame2.Visible = True
Case Is = 2
Frame1.Visible = True
Frame2.Visible = False
End Select
Call carregar_lista
End Sub

Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub



Private Sub txtbuscas_Change()
              If cmbBusca = "R. Social" Then
            tabelas.Close
            tabelas.Open "select * from fornecedores where razaosocial like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "Telefone" Then
             tabelas.Close
             tabelas.Open "select * from fornecedores where telefone like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "CNPJ" Then
            tabelas.Close
             tabelas.Open "select * from fornecedores where cnpj like '" & txtbuscas & "%' order by codigo"
            End If
End Sub
Private Sub salvarcaixa()
 If Situacao = -1 Then
Call desativar
Call caixa
Dim cod As Long
Dim w As Double
            If tabelas.BOF = False And tabelas.EOF = False Then
            tabelas.MoveLast
            w = Replace(txtValor, "R$ ", "")
            cod = tabelas!codigo
            valor = tabelas!valor
            Else
            w = Replace(txtValor, "R$ ", "")
            cod = 0
            valor = 0
            End If
            
            Call caixa
            
            If elizama = False Then
            tabelas.AddNew
            tabelas!codigo = cod + 1
            tabelas!valor = valor + w
            tabelas!cod_ped = mskNum_Pedido
            tabelas!entrada = w
            tabelas!data = mskData.Value
            tabelas!Parcela = "Nota Fiscal " & mskNum_Pedido
            tabelas.Update
            Else
            cmdCalc = True
            Call desativar
            If Replace(txtEntra, "R$ ", "") = 0 Or Replace(txtEntra, "R$ ", "") = Empty Then GoTo ui
             tabelas.AddNew
             tabelas!codigo = cod + 1
            tabelas!valor = valor + Replace(txtEntra, "R$ ", "")
            tabelas!cod_ped = mskNum_Pedido
            tabelas!entrada = Replace(txtEntra, "R$ ", "")
            tabelas!data = mskData.Value
            tabelas!Parcela = "Nota Fiscal " & mskNum_Pedido & " Entrada"
           tabelas.Update
ui:
            Dim data As Long
            Dim ano As Long
            Dim a As Long
            Dim cont2 As Long
            Call Car
            
            data = Month(mskData.Value) + 1
            ano = Year(mskData.Value)
            
            tabelas.Close
            tabelas.Open "select max(Codigo) as b from Contas_a_receber"
            
            If tabelas.EOF = False And tabelas.BOF = False Then
                        
            a = IIf(IsNull(tabelas!b), 1, tabelas!b + 1)
            End If
            
            Call Car
            cont2 = 1
            While cont2 <= txtParc
            
            If data > 12 Then
            data = 1
            ano = ano + 1
            End If
            
            tabelas.AddNew
            tabelas!codigo = a
            tabelas!cod_cli = mskCod_Cliente
            tabelas!codped = mskNum_Pedido
            tabelas!formas_de_pagamento = cmbForma.Text
            tabelas!valorparce = Replace(mfgPArc.TextMatrix(cont2, 3), "R$ ", "")
            tabelas!data_venc = Day(mskData.Value) & "/" & data & "/" & ano
            tabelas!dt_pagamento = Empty
            tabelas!n_parcela = cont2 & "/" & txtParc
            tabelas!Pago = 0
            tabelas.Update
         
            data = data + 1
            a = a + 1
            cont2 = cont2 + 1
            Wend
            
            End If
            
            End If
            
            
            Call ativar
            Call Pedidos
            
            
End Sub




Private Sub Timer2_Timer()
Command1 = True
Timer2.Enabled = False
End Sub

Private Sub txtEntra_Change()
Select Case Len(txtEntra)
Case 0
txtSaldo = txtValor
Case 1
txtSaldo = txtValor
txtSaldo = Format(CCur(Replace(txtSaldo, "R$ ", "")) - CCur(Replace(txtEntra, "R$ ", "")), "R$ #,##0.00;(R$ #,##0.00)")
Call conf
Case 2
txtSaldo = txtValor
txtSaldo = Format(CCur(Replace(txtSaldo, "R$ ", "")) - CCur(Replace(txtEntra, "R$ ", "")), "R$ #,##0.00;(R$ #,##0.00)")
Call conf
Case 3
txtSaldo = txtValor
txtSaldo = Format(CCur(Replace(txtSaldo, "R$ ", "")) - CCur(Replace(txtEntra, "R$ ", "")), "R$ #,##0.00;(R$ #,##0.00)")
Call conf
Case 4
txtSaldo = txtValor
txtSaldo = Format(CCur(Replace(txtSaldo, "R$ ", "")) - CCur(Replace(txtEntra, "R$ ", "")), "R$ #,##0.00;(R$ #,##0.00)")
Call conf
Case 5
txtSaldo = txtValor
txtSaldo = Format(CCur(Replace(txtSaldo, "R$ ", "")) - CCur(Replace(txtEntra, "R$ ", "")), "R$ #,##0.00;(R$ #,##0.00)")
Call conf
Case 6
txtSaldo = txtValor
txtSaldo = Format(CCur(Replace(txtSaldo, "R$ ", "")) - CCur(Replace(txtEntra, "R$ ", "")), "R$ #,##0.00;(R$ #,##0.00)")
Call conf
Case 7
txtSaldo = txtValor
txtSaldo = Format(CCur(Replace(txtSaldo, "R$ ", "")) - CCur(Replace(txtEntra, "R$ ", "")), "R$ #,##0.00;(R$ #,##0.00)")
Call conf
End Select
End Sub

Private Sub conf()
If CCur(Replace(txtEntra, "R$ ", "")) > CCur(Replace(txtValor, "R$ ", "")) Then
MsgBox "O valor da entrada esta maior que o valor do pedido!"
txtEntra = Clear
End If
End Sub





Private Sub txtEntra_LostFocus()
If txtEntra = Empty Then txtEntra = 0
txtEntra = Format(txtEntra, "R$ #,##0.00;(R$#,##0.00)")
End Sub

Private Sub txtNomeprod_Click()
Call desativar
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "produtos", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from produtos where nome like '" & txtNomeprod & "%'"
If tabelas2.EOF = False And tabelas2.BOF = False Then
txtCodprod = tabelas2!codigo
txtpreço = Format(tabelas2!Preço, "R$ #,##0.00;(R$#,##0.00)")
txtNomeprod = tabelas2!nome
mskqtd = 1
End If
tabelas2.Close
Call ativar

End Sub



Private Sub txtPreço_LostFocus()
txtpreço = Format(txtpreço, "R$ #,##0.00;(R$#,##0.00)")
End Sub

'Private Sub txtValor_LostFocus()
'txtValor.Visible = False
'mskValor = txtValor
'mskValor.Visible = True
'
'End Sub
Private Sub Venda_DragDrop(Source As Control, x As Single, Y As Single)

End Sub
