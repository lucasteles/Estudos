VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmPed_Trans 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Pedido de Transpor te"
   ClientHeight    =   6495
   ClientLeft      =   30
   ClientTop       =   390
   ClientWidth     =   15270
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   15270
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton aasdf 
      Caption         =   "Imprimir Comprovante"
      Height          =   495
      Left            =   12480
      TabIndex        =   78
      Top             =   5760
      Width           =   2175
   End
   Begin VB.CommandButton cmdImprimir 
      Caption         =   "Visualizar Comprovante"
      Height          =   495
      Left            =   12480
      TabIndex        =   75
      Top             =   5280
      Width           =   2175
   End
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   120
      ScaleHeight     =   675
      ScaleWidth      =   15015
      TabIndex        =   64
      Top             =   6480
      Width           =   15015
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmPed_Trans.frx":0000
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   70
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmPed_Trans.frx":058A
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   69
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Trans.frx":0E54
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   68
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Trans.frx":1B1E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   67
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Trans.frx":27E8
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   66
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmPed_Trans.frx":30B2
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   65
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
         TabIndex        =   71
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame7 
      Caption         =   "Informações do Clientes"
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
      Height          =   2535
      Left            =   0
      TabIndex        =   34
      Top             =   3840
      Width           =   11895
      Begin VB.CommandButton cmdBuscCod_Cli 
         Caption         =   "Busca"
         Height          =   375
         Left            =   1320
         Picture         =   "frmPed_Trans.frx":3D7C
         TabIndex        =   42
         Top             =   600
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.TextBox txtNumero 
         Height          =   375
         Left            =   3360
         MaxLength       =   10
         TabIndex        =   41
         Top             =   1800
         Width           =   975
      End
      Begin VB.TextBox txtBairro 
         Height          =   375
         Left            =   360
         MaxLength       =   50
         TabIndex        =   40
         Top             =   1800
         Width           =   2655
      End
      Begin VB.TextBox txtCidade 
         Height          =   375
         Left            =   6120
         MaxLength       =   50
         TabIndex        =   39
         Top             =   1800
         Width           =   1815
      End
      Begin VB.TextBox txtLog 
         Height          =   375
         Left            =   360
         MaxLength       =   50
         TabIndex        =   38
         Top             =   1200
         Width           =   4695
      End
      Begin VB.TextBox txtNome 
         Height          =   375
         Left            =   2160
         MaxLength       =   50
         TabIndex        =   37
         Top             =   600
         Width           =   2895
      End
      Begin VB.ComboBox txtUF 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "frmPed_Trans.frx":4A46
         Left            =   8640
         List            =   "frmPed_Trans.frx":4A9B
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   36
         Top             =   1920
         Width           =   975
      End
      Begin VB.TextBox txtNFantasia 
         Height          =   375
         Left            =   6120
         MaxLength       =   50
         TabIndex        =   35
         Top             =   1200
         Width           =   1815
      End
      Begin MSMask.MaskEdBox mskRg 
         Height          =   375
         Left            =   10320
         TabIndex        =   43
         Top             =   600
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   13
         Mask            =   "###.###.###-&"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCep 
         Height          =   375
         Left            =   10320
         TabIndex        =   44
         Top             =   1920
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   9
         Mask            =   "#####-###"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCel 
         Height          =   375
         Left            =   8640
         TabIndex        =   45
         Top             =   1320
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   13
         Mask            =   "(##)####-####"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCod 
         Height          =   375
         Left            =   360
         TabIndex        =   46
         Top             =   600
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   14737632
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskTel 
         Height          =   375
         Left            =   8640
         TabIndex        =   47
         Top             =   600
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   13
         Mask            =   "(##)####-####"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   255
         Left            =   10320
         OleObjectBlob   =   "frmPed_Trans.frx":4B0B
         TabIndex        =   48
         Top             =   1680
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   255
         Left            =   8640
         OleObjectBlob   =   "frmPed_Trans.frx":4B6F
         TabIndex        =   49
         Top             =   1680
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   255
         Left            =   10320
         OleObjectBlob   =   "frmPed_Trans.frx":4BD5
         TabIndex        =   50
         Top             =   360
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
         Height          =   255
         Left            =   8640
         OleObjectBlob   =   "frmPed_Trans.frx":4C37
         TabIndex        =   51
         Top             =   1080
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
         Height          =   255
         Left            =   8640
         OleObjectBlob   =   "frmPed_Trans.frx":4CA3
         TabIndex        =   52
         Top             =   360
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
         Height          =   255
         Left            =   6120
         OleObjectBlob   =   "frmPed_Trans.frx":4D11
         TabIndex        =   53
         Top             =   1560
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
         Height          =   255
         Left            =   360
         OleObjectBlob   =   "frmPed_Trans.frx":4D7B
         TabIndex        =   54
         Top             =   960
         Width           =   1455
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel13 
         Height          =   255
         Left            =   2040
         OleObjectBlob   =   "frmPed_Trans.frx":4DED
         TabIndex        =   55
         Top             =   360
         Width           =   2175
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmPed_Trans.frx":4E71
         TabIndex        =   56
         Top             =   360
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel15 
         Height          =   255
         Left            =   360
         OleObjectBlob   =   "frmPed_Trans.frx":4EDB
         TabIndex        =   57
         Top             =   1560
         Width           =   1455
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel16 
         Height          =   255
         Left            =   3240
         OleObjectBlob   =   "frmPed_Trans.frx":4F45
         TabIndex        =   58
         Top             =   1560
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
         Height          =   255
         Left            =   6120
         OleObjectBlob   =   "frmPed_Trans.frx":4FAF
         TabIndex        =   59
         Top             =   360
         Width           =   2655
      End
      Begin MSMask.MaskEdBox mskCNPJ 
         Height          =   375
         Left            =   6120
         TabIndex        =   60
         Top             =   600
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   18
         Mask            =   "##-###-###/####-##"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel19 
         Height          =   255
         Left            =   6120
         OleObjectBlob   =   "frmPed_Trans.frx":503D
         TabIndex        =   61
         Top             =   960
         Width           =   2175
      End
      Begin MSMask.MaskEdBox mskCPF 
         Height          =   375
         Left            =   10320
         TabIndex        =   76
         Top             =   1320
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   13
         Mask            =   "###-###-###-#"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel20 
         Height          =   255
         Left            =   10320
         OleObjectBlob   =   "frmPed_Trans.frx":50B5
         TabIndex        =   77
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         Caption         =   "*"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   2040
         TabIndex        =   62
         Top             =   600
         Width           =   105
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Itens a transportar"
      Height          =   3015
      Left            =   7440
      TabIndex        =   33
      Top             =   720
      Width           =   7815
      Begin MSFlexGridLib.MSFlexGrid FlexItens 
         Height          =   2655
         Left            =   120
         TabIndex        =   74
         Top             =   240
         Width           =   7575
         _ExtentX        =   13361
         _ExtentY        =   4683
         _Version        =   393216
         Cols            =   5
         ForeColor       =   0
         BackColorFixed  =   14737632
         BackColorBkg    =   12632256
         FormatString    =   "Codigo do Prod        |Nome  do Produto                    |Quantidade      |Preco Unitario |Sub Total         "
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   29
      Top             =   0
      Width           =   14175
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   3720
         Top             =   0
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1680
         OleObjectBlob   =   "frmPed_Trans.frx":5119
         TabIndex        =   30
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   4800
         OleObjectBlob   =   "frmPed_Trans.frx":517D
         TabIndex        =   31
         Top             =   120
         Width           =   3255
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   360
         OleObjectBlob   =   "frmPed_Trans.frx":51EF
         TabIndex        =   32
         Top             =   120
         Width           =   1215
      End
   End
   Begin VB.CommandButton cmdSalvar 
      Caption         =   "Salvar"
      Height          =   375
      Left            =   12000
      TabIndex        =   28
      Top             =   4680
      Width           =   1095
   End
   Begin VB.CommandButton cmdExcluir 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   14160
      TabIndex        =   27
      Top             =   4680
      Width           =   1095
   End
   Begin VB.CommandButton cmdNovo 
      Caption         =   "Novo"
      Height          =   375
      Left            =   13080
      TabIndex        =   26
      Top             =   4680
      Width           =   1095
   End
   Begin VB.Frame Frame4 
      Height          =   735
      Left            =   12360
      TabIndex        =   21
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
         Picture         =   "frmPed_Trans.frx":525B
         TabIndex        =   25
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
         Picture         =   "frmPed_Trans.frx":569D
         TabIndex        =   24
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
         Picture         =   "frmPed_Trans.frx":5ADF
         TabIndex        =   23
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
         Picture         =   "frmPed_Trans.frx":5F21
         TabIndex        =   22
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Informações"
      Height          =   3015
      Left            =   0
      TabIndex        =   0
      Top             =   720
      Width           =   7335
      Begin VB.PictureBox mouse1 
         BorderStyle     =   0  'None
         Height          =   615
         Left            =   4800
         ScaleHeight     =   615
         ScaleWidth      =   675
         TabIndex        =   73
         Top             =   600
         Width           =   675
         Begin VB.Image imgMouse 
            Height          =   615
            Left            =   0
            MouseIcon       =   "frmPed_Trans.frx":6363
            MousePointer    =   99  'Custom
            Picture         =   "frmPed_Trans.frx":666D
            Stretch         =   -1  'True
            Top             =   0
            Width           =   675
         End
      End
      Begin VB.PictureBox imgBuscar 
         BorderStyle     =   0  'None
         Height          =   855
         Left            =   4680
         ScaleHeight     =   855
         ScaleWidth      =   915
         TabIndex        =   72
         Top             =   480
         Visible         =   0   'False
         Width           =   915
         Begin VB.Image Image2 
            Height          =   855
            Left            =   0
            MouseIcon       =   "frmPed_Trans.frx":129AF
            MousePointer    =   99  'Custom
            Picture         =   "frmPed_Trans.frx":12CB9
            Stretch         =   -1  'True
            Top             =   0
            Width           =   915
         End
      End
      Begin VB.CommandButton cmdBuscar_Cod_Ped 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   3960
         TabIndex        =   63
         Top             =   600
         Width           =   615
      End
      Begin VB.TextBox txtValor_Total 
         Height          =   405
         Left            =   720
         TabIndex        =   19
         Top             =   2160
         Width           =   1815
      End
      Begin VB.Frame Frame2 
         Caption         =   "Pago"
         Height          =   612
         Left            =   4680
         TabIndex        =   16
         Top             =   2160
         Width           =   1452
         Begin VB.OptionButton OpNao 
            Caption         =   "Não"
            Height          =   252
            Left            =   720
            TabIndex        =   18
            Top             =   240
            Width           =   612
         End
         Begin VB.OptionButton opSim 
            Caption         =   "Sim"
            Height          =   192
            Left            =   120
            TabIndex        =   17
            Top             =   240
            Width           =   612
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Entregue"
         Height          =   612
         Left            =   3000
         TabIndex        =   13
         Top             =   2160
         Width           =   1452
         Begin VB.OptionButton optNao 
            Caption         =   "Não"
            Height          =   252
            Left            =   720
            TabIndex        =   15
            Top             =   240
            Width           =   612
         End
         Begin VB.OptionButton optSim 
            Caption         =   "Sim"
            Height          =   192
            Left            =   120
            TabIndex        =   14
            Top             =   240
            Width           =   612
         End
      End
      Begin VB.TextBox txtRazaoSocial 
         Height          =   405
         Left            =   3000
         TabIndex        =   9
         Top             =   1560
         Width           =   3132
      End
      Begin VB.CommandButton cmdBuscar_Cod_Trans 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   3960
         TabIndex        =   6
         Top             =   960
         Width           =   615
      End
      Begin VB.CommandButton cmdBuscarPed_Trans 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   3960
         TabIndex        =   1
         Top             =   240
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel17 
         Height          =   372
         Left            =   120
         OleObjectBlob   =   "frmPed_Trans.frx":1EFFB
         TabIndex        =   2
         Top             =   240
         Width           =   852
      End
      Begin MSMask.MaskEdBox mskCodPed_Trans 
         Height          =   372
         Left            =   3000
         TabIndex        =   3
         Top             =   240
         Width           =   852
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   372
         Left            =   120
         OleObjectBlob   =   "frmPed_Trans.frx":1F065
         TabIndex        =   4
         Top             =   600
         Width           =   1932
      End
      Begin MSMask.MaskEdBox mskCod_Ped 
         Height          =   372
         Left            =   3000
         TabIndex        =   5
         Top             =   600
         Width           =   852
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   372
         Left            =   120
         OleObjectBlob   =   "frmPed_Trans.frx":1F0E3
         TabIndex        =   7
         Top             =   960
         Width           =   2892
      End
      Begin MSMask.MaskEdBox mskCod_Ped_Trans 
         Height          =   375
         Left            =   3000
         TabIndex        =   8
         Top             =   960
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmPed_Trans.frx":1F171
         TabIndex        =   10
         Top             =   1560
         Width           =   1935
      End
      Begin MSComCtl2.DTPicker DT 
         Bindings        =   "frmPed_Trans.frx":1F1E7
         DataMember      =   "Data"
         Height          =   375
         Left            =   5760
         TabIndex        =   11
         Top             =   240
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         Format          =   20709377
         CurrentDate     =   39737
      End
      Begin ACTIVESKINLibCtl.SkinLabel Hora 
         Height          =   375
         Left            =   6000
         OleObjectBlob   =   "frmPed_Trans.frx":1F1F6
         TabIndex        =   12
         Top             =   720
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmPed_Trans.frx":1F264
         TabIndex        =   20
         Top             =   2160
         Width           =   615
      End
   End
   Begin VB.Timer Timer2 
      Left            =   6240
      Top             =   2280
   End
End
Attribute VB_Name = "frmPed_Trans"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Pago As Boolean
Dim entregue As Boolean
Dim naveçao As Integer

Private Sub mostrar()
Call desativar
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Vendas", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
navegaçao = mskCodPed_Trans
mskCodPed_Trans = tabelas!codigo
mskPed_Ped = tabelas!codigo
mskCod_Ped = tabelas!Codigo_Ped
cmdBuscar_Cod_Ped = True
Call desativar
mskCod_Ped_Trans = tabelas!Codigo_Trans
cmdBuscar_Cod_Trans = True
Call desativar
txtValor_Total = tabelas!valor
DT = tabelas!data
Hora = tabelas!Hora
Pago = tabelas!Pago
entregue = tabelas!entregue
If Pago = True Then optSim = True
If Pago = False Then optNao = True
If entregue = True Then opSim = True
If entregue = False Then OpNao = True

If tabelas2.State = adStateOpen Then tabelas2.Close

tabelas2.Open "select * from Vendas where Num_Pedido=" & mskCod_Ped

If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
tabelas3.Close
tabelas3.Open "select * from clientes where codigo=" & tabelas2!cod_cli
mskCod = tabelas3!codigo
            txtNome = tabelas3!nome
            mskCel = tabelas3!Celular
            mskCPF = IIf(IsNull(tabelas3!cpf), "", tabelas3!cpf)
            txtLog = tabelas3!logradouro
            txtNumero = tabelas3!numero
            txtBairro = tabelas3!bairro
            txtCidade = tabelas3!cidade
            txtUF = tabelas3!uf
            mskCep = tabelas3!cep
            mskRg = tabelas3!rg
            mskTel = tabelas3!telefone
            txtNFantasia = tabelas3!Nomefantasia
            mskCNPJ = tabelas3!cnpj
 

Call ativar
End Sub
Private Sub desativar()
mskCodPed_Trans.PromptInclude = False
mskCod_Ped.PromptInclude = False
mskCod_Ped_Trans.PromptInclude = False
mskCod.PromptInclude = False
mskCNPJ.PromptInclude = False
mskTel.PromptInclude = False
mskCel.PromptInclude = False
mskRg.PromptInclude = False
mskCep.PromptInclude = False
mskCPF.PromptInclude = False
End Sub
Private Sub ativar()
mskCodPed_Trans.PromptInclude = True
mskCod_Ped.PromptInclude = True
mskCod_Ped_Trans.PromptInclude = True
mskCod.PromptInclude = True
mskCPF.PromptInclude = True
mskCNPJ.PromptInclude = True
mskTel.PromptInclude = True
mskCel.PromptInclude = True
mskRg.PromptInclude = True
mskCep.PromptInclude = True
End Sub

Private Sub aasdf_Click()

 Printer.FontSize = 12
Printer.CurrentY = 1000

Printer.Print Tab(1 + 1); "Comprovante de ";
Printer.FontUnderline = True
Printer.Print "Transporte"
Printer.FontUnderline = False


Printer.Print String(150, "-")
Printer.Print Spc(60 - 20);
Printer.FontBold = True
Printer.FontSize = 15
Printer.PaintPicture frmRela.Image1, 700, 1500, 2455, 1495
Printer.Print "LUXUS LTDA"
Printer.FontBold = False
Printer.FontSize = 12

Printer.FontBold = False
Printer.FontSize = 10


Printer.Print Spc(29); "Rd. Régis Bittercort; Nº810, Embu "
Printer.Print Spc(32); " CNPJ 43.698.669/0001-65"
Printer.Print Spc(32); "   São Paulo  "; Spc(1); DT.Value
Printer.Print String(150, "-")
Call desativar
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Clientes", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from clientes where codigo=" & mskCod


Printer.Print "   Pedido nº "; mskCodPed_Trans,

Printer.Print
Printer.FontUnderline = True
Printer.Print Tab(1); "Dados do Cliente:"
Printer.FontUnderline = False
Printer.Print


Printer.Print "   Código do Cliente - "; mskCod
Printer.Print "   Nome do Cliente - "; txtNome
If txtNFantasia <> Empty Then
Printer.Print "   Nome Fantasia - "; txtNFantasia
End If
Printer.Print "   RG - "; mskRg,
If mskCPF <> Empty Then Printer.Print "   CPF - "; mskCPF
If mskCNPJ <> Empty Then Printer.Print "   CNPJ - "; mskCNPJ
Printer.Print "   Logradouro - "; txtLog,
Printer.Print "   nº "; txtNumero
Printer.Print "   Bairro - "; txtBairro,
Printer.Print "   Cidade - "; txtCidade
Printer.Print "   CEP - "; mskCep,
Printer.Print "   UF - "; txtUF
Printer.Print "   Telefone - "; mskTel,
Printer.Print "   Celular - "; mskCel


Printer.Print String(150, "-")
Call ativar
Dim er As Integer
er = 1

Printer.FontUnderline = True
Printer.Print Tab(1); "Itens A Serem Transportados:"
Printer.FontUnderline = False
Printer.Print
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
Printer.Print "    Total - "; txtValor_Total
Printer.Print Spc(20); Format(Now, "long date")







End Sub

Private Sub cmdBuscar_Cod_Ped_Click()
Call desativar
            If mskCod_Ped = Empty Then
            Else
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "itens_vendas", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from itens_vendas where NumPedido=" & mskCod_Ped
            If tabelas2.BOF = True Or tabelas2.EOF = True Then
            MsgBox "ui", vbCritical
            Else
Dim cont As Integer
cont = 1
While tabelas2.EOF = False
FlexItens.TextMatrix(cont, 0) = tabelas2!Cod_Prod
If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "Produtos", conecta, adOpenKeyset, adLockOptimistic
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
            End If
            End If

            Call ativar
        cmdBuscCod_Cli = True
End Sub

Private Sub FlexItem_Click()

End Sub

Private Sub cmdBuscar_Cod_Trans_Click()
Call desativar
If mskCod_Ped_Trans = Empty And txtRazaoSocial = Empty Then

Else
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Select * from Transportadora", conecta, adOpenKeyset, adLockOptimistic

If tabelas2.State = adStateOpen Then tabelas2.Close

If txtRazaoSocial <> Empty Then
tabelas2.Open "Select * from Transportadora where razaosocial like '%" & txtRazaoSocial & "%'"
GoTo q
Else
tabelas2.Open "select * from Transportadora where codigo=" & mskCod_Ped_Trans
q:
If tabelas2.EOF = False Or tabelas2.BOF = False Then

mskCod_Ped_Trans = tabelas2!codigo
txtRazaoSocial = tabelas2!razaosocial
End If
End If



End If

Call ativar

End Sub

Private Sub cmdBuscarPed_Trans_Click()
Call desativar
If mskCodPed_Trans = Empty Then
MsgBox "Codigo Faltando", vbCritical
Exit Sub
Else
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Pedido_trans", conecta, adOpenKeyset, adLockOptimistic
tabelas.Close
tabelas.Open "Select * from Pedido_trans where codigo=" & mskCodPed_Trans
If tabelas.BOF = True And tabelas.EOF = True Then
MsgBox "Codigo Inexistente", vbExclamation
Exit Sub
Else
Call mostrar

End If
End If

Call ativar
End Sub

Private Sub cmdBuscCod_Cli_Click()
Call desativar
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Vendas", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from Vendas where Num_Pedido=" & mskCod_Ped

If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
tabelas3.Close
tabelas3.Open "select * from clientes where codigo=" & tabelas2!cod_cli
            mskCod = tabelas3!codigo
            txtNome = tabelas3!nome
            mskCel = tabelas3!Celular
            txtLog = tabelas3!logradouro
            txtNumero = tabelas3!numero
            txtBairro = tabelas3!bairro
            txtCidade = tabelas3!cidade
            txtUF = tabelas3!uf
            mskCep = tabelas3!cep
            mskRg = tabelas3!rg
            mskTel = tabelas3!telefone
            txtNFantasia = tabelas3!Nomefantasia
            mskCNPJ = tabelas3!cnpj
            
           Call ativar
           



End Sub


Private Sub cmdExcluir_Click()
Call desativar
If mskCodPed_Trans = Empty Then
Else
Call Pedido_trans
On Error GoTo d
conecta.Execute "delete * from Ped_trans where Codigo=" & mskCodPed_Trans
status = "excluidos"
Call crash1
Call Pedido_trans
cmdNovo = True
End If
Call ativar
Exit Sub
d:
MsgBox "Este Pedido não pode ser excluido pois ja possui um historico", vbExclamation

End Sub

Private Sub cmdImprimir_Click()
If mskCod = Empty Then
MsgBox "Digite o codigo"
Exit Sub
End If
With frmRela

 .Pictu.FontSize = 12
.Pictu.CurrentY = 1000

.Pictu.Print Tab(1 + 1); "Comprovante de ";
.Pictu.FontUnderline = True
.Pictu.Print "Transporte"
.Pictu.FontUnderline = False


.Pictu.Print String(150, "-")
.Pictu.Print Spc(60 - 20);
.Pictu.FontBold = True
.Pictu.FontSize = 15
.Pictu.PaintPicture frmRela.Image1, 700, 1500, 2455, 1495
.Pictu.Print "LUXUS LTDA"
.FontBold = False
.Pictu.FontSize = 12

.FontBold = False
.FontSize = 10


.Pictu.Print Spc(29); "Rd. Régis Bittercort; Nº810, Embu "
.Pictu.Print Spc(32); " CNPJ 43.698.669/0001-65"
.Pictu.Print Spc(32); "   São Paulo  "; Spc(1); DT.Value
.Pictu.Print String(150, "-")
Call desativar
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Clientes", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from clientes where codigo=" & mskCod


.Pictu.Print "   Pedido nº "; mskCodPed_Trans,

.Pictu.Print
.Pictu.FontUnderline = True
.Pictu.Print Tab(1); "Dados do Cliente:"
.Pictu.FontUnderline = False
.Pictu.Print


.Pictu.Print "   Código do Cliente - "; mskCod
.Pictu.Print "   Nome do Cliente - "; txtNome
If txtNFantasia <> Empty Then
.Pictu.Print "   Nome Fantasia - "; txtNFantasia
End If
.Pictu.Print "   RG - "; mskRg,
If mskCPF <> Empty Then .Pictu.Print "   CPF - "; mskCPF
If mskCNPJ <> Empty Then .Pictu.Print "   CNPJ - "; mskCNPJ
.Pictu.Print "   Logradouro - "; txtLog,
.Pictu.Print "   nº "; txtNumero
.Pictu.Print "   Bairro - "; txtBairro,
.Pictu.Print "   Cidade - "; txtCidade
.Pictu.Print "   CEP - "; mskCep,
.Pictu.Print "   UF - "; txtUF
.Pictu.Print "   Telefone - "; mskTel,
.Pictu.Print "   Celular - "; mskCel


.Pictu.Print String(150, "-")
Call ativar
Dim er As Integer
er = 1

.Pictu.FontUnderline = True
.Pictu.Print Tab(1); "Itens A Serem Transportados:"
.Pictu.FontUnderline = False
.Pictu.Print
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
.Pictu.Print "    Total - "; txtValor_Total
.Pictu.Print Spc(20); Format(Now, "long date")


End With




End Sub

Private Sub cmdNovo_Click()
Dim limpar As Object
For Each limpar In Me.Controls
If TypeOf limpar Is TextBox Then limpar = Clear
Call desativar
If TypeOf limpar Is MaskEdBox Then limpar = Clear
Call ativar
Next
Hora.Caption = Time
DT = Date
optSim = False
optNao = False
opSim = False
OpNao = False
FlexItens.Clear
FlexItens.Rows = 2
FlexItens.FormatString = "Codigo do Prod        |Nome  do Produto                    |Quantidade      |Preco Unitario |Sub Total         "

End Sub

Private Sub cmdPrim_Click()
            Call desativar
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            Call mostrar
            Else
            MsgBox "NAO A CADASTROS", vbExclamation
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
            
            If mskCodPed_Trans = Empty Then
            If tabelas.BOF = False Or tabelas.EOF = False Then
            tabelas.MoveFirst
            Call mostrar
            End If
            Else
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveNext
            If tabelas.EOF = True Then tabelas.MoveLast
            Call mostrar
            Else
            MsgBox "NAO A CADASTROS", vbExclamation
            End If
            Call ativar
            End If
            
End Sub

Private Sub cmdProx_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o proximo Registro"
pctNav.Visible = True
pctluxus.Visible = False

End Sub


Private Sub cmdUlt_Click()

            Call desativar
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveLast
            Call mostrar
            Else
            MsgBox "NAO A CADASTROS", vbExclamation
            End If
            Call ativar
End Sub
Private Sub cmdUlt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o ultimo Registro"
pctNav.Visible = True
pctluxus.Visible = False
End Sub


Private Sub cmdAnt_Click()
             Call desativar
             If mskCodPed_Trans = Empty Then
             If tabelas.BOF = False Or tabelas.EOF = False Then
            tabelas.MoveFirst
            Call mostrar
            End If
            Else
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MovePrevious
            If tabelas.BOF = True Then tabelas.MoveFirst
            Call mostrar
            Else
            MsgBox "NAO A CADASTROS", vbExclamation
            End If
            End If
            
            Call ativar
End Sub


Private Sub cmdAnt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o Registro anterior"
pctNav.Visible = True
pctluxus.Visible = False

End Sub

Private Sub cmdSalvar_Click()
Call desativar
status = "salvas"
Dim a As Integer
Dim b As Integer
Call Pedido_trans
 If mskCodPed_Trans = Empty Then
            If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 100
        While b = Empty
        
        tabelas.Close
        tabelas.Open "select * from Pedido_trans where Codigo=" & a
                If tabelas.BOF = False Or tabelas.EOF = False Then
            a = a + 1
                Else
            b = 1
            Call Pedido_trans
                End If
        Wend
            Else
        a = 100
            End If
        mskCodPed_Trans = a
        b = Clear
End If

If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Pedido_trans", conecta, adOpenKeyset, adLockOptimistic
tabelas.Close
tabelas.Open "select * from Pedido_trans where codigo=" & mskCodPed_Trans
If tabelas.BOF = False And tabelas.EOF = False Then
If MsgBox("Deseja salvar as auterações", vbQuestion + vbYesNo + vbDefaultButton2) = vbYes Then
status = "alteradas"
Call salvar
End If
Else
Call salvar
Call crash1
End If


Call ativar


End Sub
Private Sub salvar()
If status = "salvas" Then
tabelas.AddNew
End If
navegação = mskCodPed_Trans
tabelas!codigo = mskCodPed_Trans
tabelas!Codigo_Ped = mskCod_Ped
tabelas!Codigo_Trans = mskCod_Ped_Trans
tabelas!data = DT
tabelas!Hora = Hora
tabelas!valor = Replace(txtValor_Total, "R$", "")
tabelas!entregue = entregue
tabelas!Pago = Pago
tabelas.Update
wer = Empty

End Sub

Private Sub Command1_Click()
Call Pedido_trans
End Sub

Private Sub Form_Activate()
Call Pedido_trans

End Sub

Private Sub Form_Load()
Hora.Caption = Time
actskin.ApplySkin Me.hWnd
 actskin2.ApplySkin cmdSalvar.hWnd
 actskin2.ApplySkin cmdExcluir.hWnd
 actskin2.ApplySkin cmdNovo.hWnd
 actskin2.ApplySkin cmdImprimir.hWnd
 actskin2.ApplySkin aasdf.hWnd

Call Pedido_trans
End Sub





Private Sub Form_Unload(Cancel As Integer)
If wer <> Empty Then
Call Transporte
tabelas.Close
tabelas.Open "Select * from transportes where numpedido=" & wer
tabelas!status = False
tabelas.Update
wer = Clear
Unload frmContTrans
End If



End Sub

Private Sub Frame3_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
 mouse1.Visible = True
imgBuscar.Visible = False
End Sub

Private Sub OpNao_Click()
Pago = False
End Sub

Private Sub opSim_Click()
Pago = True
End Sub

Private Sub optNao_Click()
entregue = False
End Sub

Private Sub optsim_Click()
entregue = True
End Sub

Private Sub Timer1_Timer()
If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub txtValor_Total_LostFocus()
txtValor_Total = Format(txtValor_Total, "R$#,##0.00;(R$#,##0.00)")
End Sub

Private Sub imgMouse_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse1.Visible = False
imgBuscar.Visible = True
End Sub

Private Sub Image2_Click()
Me.Enabled = False
frmB8.Show

End Sub
