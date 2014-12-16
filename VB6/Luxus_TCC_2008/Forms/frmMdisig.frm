VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form frmMdisig 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Modelos"
   ClientHeight    =   7920
   ClientLeft      =   4185
   ClientTop       =   2100
   ClientWidth     =   8235
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7920
   ScaleWidth      =   8235
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   120
      ScaleHeight     =   675
      ScaleWidth      =   8055
      TabIndex        =   56
      Top             =   7800
      Width           =   8055
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmMdisig.frx":0000
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   62
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmMdisig.frx":058A
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   61
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmMdisig.frx":0E54
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   60
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmMdisig.frx":1B1E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   59
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmMdisig.frx":27E8
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   58
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmMdisig.frx":30B2
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   57
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
         TabIndex        =   63
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame10 
      Height          =   6615
      Left            =   120
      TabIndex        =   49
      Top             =   1080
      Visible         =   0   'False
      Width           =   7935
      Begin VB.Frame Frame11 
         Caption         =   "Peças "
         Height          =   2895
         Left            =   120
         TabIndex        =   64
         Top             =   240
         Width           =   7695
         Begin VB.CommandButton cmdaddLista 
            Caption         =   "Add"
            Height          =   375
            Left            =   4800
            TabIndex        =   67
            Top             =   1320
            Width           =   855
         End
         Begin VB.CommandButton cmdRlista 
            Caption         =   "Remover"
            Height          =   375
            Left            =   5760
            TabIndex        =   66
            Top             =   1320
            Width           =   855
         End
         Begin VB.TextBox txtNomepe 
            Height          =   375
            Left            =   4920
            TabIndex        =   65
            Top             =   840
            Width           =   1455
         End
         Begin MSFlexGridLib.MSFlexGrid FlexItens 
            Height          =   2295
            Left            =   120
            TabIndex        =   68
            Top             =   360
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   4048
            _Version        =   393216
            Cols            =   3
            ForeColor       =   0
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            FormatString    =   "Cod Peça   |Nome                        |Preço                 "
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
            Height          =   375
            Left            =   4200
            OleObjectBlob   =   "frmMdisig.frx":3D7C
            TabIndex        =   69
            Top             =   840
            Width           =   975
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel19 
            Height          =   375
            Left            =   4080
            OleObjectBlob   =   "frmMdisig.frx":3DE2
            TabIndex        =   70
            Top             =   360
            Width           =   855
         End
         Begin MSMask.MaskEdBox mskcodpe 
            Height          =   375
            Left            =   4920
            TabIndex        =   71
            Top             =   360
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel20 
            Height          =   375
            Left            =   6000
            OleObjectBlob   =   "frmMdisig.frx":3E4C
            TabIndex        =   72
            Top             =   360
            Width           =   735
         End
         Begin MSMask.MaskEdBox mskQtd 
            Height          =   375
            Left            =   6720
            TabIndex        =   73
            Top             =   360
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Salvar"
         Height          =   375
         Left            =   5160
         TabIndex        =   54
         Top             =   6120
         Width           =   1095
      End
      Begin VB.Frame tttttt 
         Caption         =   "Peças"
         Height          =   2895
         Left            =   120
         TabIndex        =   52
         Top             =   3120
         Width           =   7695
         Begin MSFlexGridLib.MSFlexGrid FlexPeças 
            Height          =   2535
            Left            =   720
            TabIndex        =   53
            Top             =   240
            Width           =   6135
            _ExtentX        =   10821
            _ExtentY        =   4471
            _Version        =   393216
            Cols            =   5
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            GridLines       =   2
            FormatString    =   "Codigo      | Nome                      |Preço             |Quantidade     |Sub Total        "
         End
      End
      Begin VB.TextBox txtValor2 
         Height          =   375
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   50
         Top             =   6120
         Width           =   2655
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmMdisig.frx":3EB4
         TabIndex        =   51
         Top             =   6120
         Width           =   2295
      End
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
      Height          =   6615
      Left            =   120
      TabIndex        =   8
      Top             =   1080
      Width           =   7935
      Begin RichTextLib.RichTextBox txtDescriçao 
         Height          =   2175
         Left            =   240
         TabIndex        =   55
         Top             =   3000
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   3836
         _Version        =   393217
         Enabled         =   -1  'True
         TextRTF         =   $"frmMdisig.frx":3F2E
      End
      Begin VB.TextBox txtValor 
         Height          =   375
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   47
         Top             =   5280
         Width           =   2655
      End
      Begin VB.Frame frmjhjh 
         Height          =   1815
         Left            =   3480
         TabIndex        =   36
         Top             =   240
         Width           =   4335
         Begin VB.CommandButton cmdBuscar_Codigo_Desiger 
            Caption         =   "Busca"
            Height          =   375
            Left            =   1560
            Picture         =   "frmMdisig.frx":3FB0
            TabIndex        =   45
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox txtRs 
            Height          =   375
            Left            =   480
            MaxLength       =   50
            TabIndex        =   40
            Top             =   1320
            Width           =   1935
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Busca"
            Height          =   375
            Left            =   2520
            Picture         =   "frmMdisig.frx":4C7A
            TabIndex        =   39
            Top             =   1320
            Width           =   615
         End
         Begin VB.PictureBox imgBuscar 
            BorderStyle     =   0  'None
            Height          =   855
            Left            =   2520
            ScaleHeight     =   855
            ScaleWidth      =   915
            TabIndex        =   38
            Top             =   240
            Visible         =   0   'False
            Width           =   915
            Begin VB.Image Image2 
               Height          =   855
               Left            =   0
               MouseIcon       =   "frmMdisig.frx":5944
               MousePointer    =   99  'Custom
               Picture         =   "frmMdisig.frx":5C4E
               Stretch         =   -1  'True
               Top             =   0
               Width           =   915
            End
         End
         Begin VB.PictureBox mouse1 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   2640
            ScaleHeight     =   615
            ScaleWidth      =   675
            TabIndex        =   37
            Top             =   360
            Width           =   675
            Begin VB.Image imgMouse 
               Height          =   615
               Left            =   0
               MouseIcon       =   "frmMdisig.frx":11F90
               MousePointer    =   99  'Custom
               Picture         =   "frmMdisig.frx":1229A
               Stretch         =   -1  'True
               Top             =   0
               Width           =   675
            End
         End
         Begin MSMask.MaskEdBox mskCod_Desi 
            Height          =   375
            Left            =   480
            TabIndex        =   41
            Top             =   480
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   14737632
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   375
            Left            =   360
            OleObjectBlob   =   "frmMdisig.frx":1E5DC
            TabIndex        =   42
            Top             =   120
            Width           =   2175
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
            Height          =   375
            Left            =   240
            OleObjectBlob   =   "frmMdisig.frx":1E65A
            TabIndex        =   43
            Top             =   960
            Width           =   1455
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel13 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "frmMdisig.frx":1E6CA
            TabIndex        =   44
            Top             =   120
            Width           =   255
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "frmMdisig.frx":1E72A
            TabIndex        =   46
            Top             =   120
            Width           =   255
         End
      End
      Begin VB.ComboBox cbTipo 
         Height          =   315
         ItemData        =   "frmMdisig.frx":1E78A
         Left            =   720
         List            =   "frmMdisig.frx":1E78C
         Style           =   2  'Dropdown List
         TabIndex        =   33
         Top             =   2040
         Width           =   1695
      End
      Begin VB.Frame Frame8 
         Height          =   735
         Left            =   1440
         TabIndex        =   26
         Top             =   480
         Width           =   1815
         Begin VB.CommandButton cmdBuscCod 
            Caption         =   "Busca"
            Height          =   375
            Left            =   120
            Picture         =   "frmMdisig.frx":1E78E
            TabIndex        =   27
            Top             =   240
            Width           =   615
         End
         Begin MSMask.MaskEdBox mskcodB 
            Height          =   375
            Left            =   840
            TabIndex        =   28
            Top             =   240
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
      End
      Begin VB.TextBox txtModelo 
         Height          =   375
         Left            =   240
         MaxLength       =   50
         TabIndex        =   20
         Top             =   1440
         Width           =   2295
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   2760
         Top             =   1200
      End
      Begin VB.CommandButton cmdExclu 
         Caption         =   "Excluir"
         Height          =   495
         Left            =   6600
         TabIndex        =   19
         Top             =   6000
         Width           =   1095
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   495
         Left            =   4440
         TabIndex        =   18
         Top             =   6000
         Width           =   1095
      End
      Begin VB.CommandButton cmdnovo 
         Caption         =   "Novo"
         Height          =   495
         Left            =   5520
         TabIndex        =   17
         Top             =   6000
         Width           =   1095
      End
      Begin VB.Frame Frame3 
         Height          =   735
         Left            =   5400
         TabIndex        =   12
         Top             =   5040
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
            Picture         =   "frmMdisig.frx":1F458
            TabIndex        =   16
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
            Picture         =   "frmMdisig.frx":1F89A
            TabIndex        =   15
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
            Picture         =   "frmMdisig.frx":1FCDC
            TabIndex        =   14
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
            Picture         =   "frmMdisig.frx":2011E
            TabIndex        =   13
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.CommandButton cmdBuscNome 
         Caption         =   "Busca"
         Height          =   375
         Left            =   2640
         TabIndex        =   11
         Top             =   1440
         Width           =   615
      End
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   6840
         Top             =   5040
      End
      Begin VB.Frame Frame6 
         Height          =   2895
         Left            =   5280
         TabIndex        =   9
         Top             =   2160
         Width           =   2535
         Begin VB.PictureBox Picture1 
            BackColor       =   &H80000009&
            Height          =   2175
            Left            =   120
            ScaleHeight     =   2115
            ScaleWidth      =   2235
            TabIndex        =   25
            Top             =   240
            Width           =   2295
            Begin VB.Image Image1 
               Height          =   1935
               Left            =   0
               Picture         =   "frmMdisig.frx":20560
               Stretch         =   -1  'True
               Top             =   0
               Width           =   2295
            End
         End
         Begin VB.CommandButton cmdBf 
            Caption         =   "Buscar Foto"
            Height          =   255
            Left            =   480
            TabIndex        =   10
            Top             =   2520
            Width           =   1575
         End
      End
      Begin MSMask.MaskEdBox mskCod 
         Height          =   375
         Left            =   240
         TabIndex        =   21
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
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmMdisig.frx":23722
         TabIndex        =   22
         Top             =   1080
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmMdisig.frx":2378C
         TabIndex        =   23
         Top             =   240
         Width           =   2295
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmMdisig.frx":2380A
         TabIndex        =   24
         Top             =   2640
         Width           =   1335
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmMdisig.frx":2387A
         TabIndex        =   29
         Top             =   1440
         Width           =   255
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmMdisig.frx":238DA
         TabIndex        =   34
         Top             =   2040
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel15 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmMdisig.frx":23940
         TabIndex        =   35
         Top             =   2040
         Width           =   255
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   255
         Left            =   360
         OleObjectBlob   =   "frmMdisig.frx":239A0
         TabIndex        =   48
         Top             =   5280
         Width           =   2295
      End
   End
   Begin VB.Frame Frame7 
      Height          =   6615
      Left            =   120
      TabIndex        =   6
      Top             =   1080
      Width           =   7935
      Begin VB.Frame Frame4 
         Caption         =   "Busca"
         Height          =   855
         Left            =   720
         TabIndex        =   30
         Top             =   240
         Width           =   3495
         Begin VB.TextBox txtbuscas 
            Height          =   315
            Left            =   1200
            MaxLength       =   50
            TabIndex        =   31
            Top             =   360
            Width           =   2175
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
            Height          =   375
            Left            =   240
            OleObjectBlob   =   "frmMdisig.frx":23A1A
            TabIndex        =   32
            Top             =   360
            Width           =   1335
         End
      End
      Begin MSFlexGridLib.MSFlexGrid flexClientes 
         Height          =   5175
         Left            =   720
         TabIndex        =   7
         Top             =   1200
         Width           =   6255
         _ExtentX        =   11033
         _ExtentY        =   9128
         _Version        =   393216
         Cols            =   4
         BackColorFixed  =   14737632
         BackColorBkg    =   16777215
         FormatString    =   "Codigo     | Modelo                       |Empresa de Designe                     |Preço             "
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   7215
      Left            =   0
      TabIndex        =   4
      Top             =   600
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   12726
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Cadastro"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Peças"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Lista"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8175
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmMdisig.frx":23A84
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   5280
         OleObjectBlob   =   "frmMdisig.frx":23AE6
         TabIndex        =   2
         Top             =   120
         Width           =   1335
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmMdisig.frx":23B52
         TabIndex        =   3
         Top             =   120
         Width           =   1455
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "frmMdisig.frx":23BC0
      TabIndex        =   5
      Top             =   1920
      Width           =   735
   End
   Begin VB.Menu mnuFor 
      Caption         =   "fornecedor"
      Visible         =   0   'False
      Begin VB.Menu mnuConsFor 
         Caption         =   "Consutar Peça"
      End
   End
   Begin VB.Menu mnuPeças 
      Caption         =   "Peças"
      Visible         =   0   'False
      Begin VB.Menu mnuQuant 
         Caption         =   "Alterar Quant"
      End
      Begin VB.Menu mnuExLin 
         Caption         =   "Excluir Linha"
      End
      Begin VB.Menu trasso 
         Caption         =   "-"
      End
      Begin VB.Menu mnuConsForne 
         Caption         =   "Consutar Fornecedor"
      End
      Begin VB.Menu mnuConspE 
         Caption         =   "Consultar Peça"
      End
   End
End
Attribute VB_Name = "frmMdisig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim a As Integer
Dim b As Integer
Dim navegaçao As Integer
Dim linha As Integer
Dim lkj As Long
Private Sub Tirar()
Dim o As Object
        For Each o In Me.Controls
        If TypeOf o Is TextBox Then o = Replace(Replace(o, "'", "''"), Chr(34), "")
        If TypeOf o Is RichTextBox Then o = Replace(Replace(o, "'", "''"), Chr(34), "")

        Next
End Sub
Private Sub por()
Dim o As Object
        For Each o In Me.Controls
        If TypeOf o Is TextBox Then o = Replace(o, "''", "'")
        If TypeOf o Is RichTextBox Then o = Replace(Replace(o, "''", "'"), Chr(34), "")

        Next
End Sub

Private Sub salvar_itens()
        Dim cont As Integer
        Call desativar
        If tabelas2.State = adStateOpen Then tabelas2.Close
        tabelas2.Open "Peças_mod", conecta, adOpenKeyset, adLockOptimistic
        
        While cont < FlexPeças.Rows - 1
        cont = cont + 1
        tabelas2.AddNew
        tabelas2!codmodelo = mskCod
        tabelas2!codpe = FlexPeças.TextMatrix(cont, 0)
        tabelas2!qtd = FlexPeças.TextMatrix(cont, 3)
            tabelas2.Update
        Wend
        Call ativar
        
        tabelas2.Close

End Sub

Private Sub cmdaddLista_Click()
Call desativar
If mskCodpe = Empty Then Exit Sub


If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "peças", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from peças where codigo=" & mskCodpe
If tabelas2.EOF = True Or tabelas2.BOF = True Then
MsgBox "Este produto não e Valido", vbExclamation
tabelas2.Close
Exit Sub
End If

With FlexPeças
Dim cont As Integer
cont = 1
While cont < .Rows
If mskCodpe = .TextMatrix(cont, 0) Then
.TextMatrix(cont, 3) = CCur(.TextMatrix(cont, 3)) + CCur(mskqtd)
.TextMatrix(cont, 4) = Format(Replace(tabelas2!preço_venda, "R$ ", "") * .TextMatrix(cont, 3), "R$ #,##0.00;(R$#,##0.00)")
If txtValor = Empty Then txtValor = "0"
txtValor = Format(CCur(Replace(txtValor, "R$ ", "")) + CCur(Replace(tabelas2!preço_venda * mskqtd, "R$ ", "")), "R$ #,##0.00;(R$#,##0.00)")
txtValor2 = txtValor

Exit Sub
End If
cont = cont + 1
Wend




.Rows = .Rows + 1
linha = linha + 1
.TextMatrix(linha, 3) = mskqtd
.TextMatrix(linha, 0) = mskCodpe
.TextMatrix(linha, 1) = txtNomepe
.TextMatrix(linha, 2) = Format(tabelas2!preço_venda, "R$ #,##0.00;(R$#,##0.00)")
.TextMatrix(linha, 4) = Format(mskqtd * tabelas2!preço_venda, "R$ #,##0.00;(R$#,##0.00)")

If txtValor = Empty Then txtValor = "0"
txtValor = Format(CCur(Replace(txtValor, "R$ ", "")) + CCur(Replace(.TextMatrix(linha, 4), "R$ ", "")), "R$ #,##0.00;(R$#,##0.00)")
txtValor2 = txtValor
If .TextMatrix(.Rows - 1, 0) = Empty Then .Rows = .Rows - 1

If tabelas2.State = adStateOpen Then tabelas2.Close
End With


Call ativar
End Sub

Private Sub cmdRlista_Click()
If FlexPeças.TextMatrix(1, 0) = "" Then
MsgBox "Nao a itens a serem excluidos", vbInformation
Exit Sub
End If
FlexPeças.Rows = FlexPeças.Rows + 1
txtValor = Format(Replace(txtValor, "R$ ", "") - CCur(FlexPeças.TextMatrix(FlexPeças.Rows - 2, 4)), "R$ #,##0.00;(R$#,##0.00)")
txtValor2 = txtValor
If FlexPeças.Rows > 3 Then
FlexPeças.Row = FlexPeças.Rows - 1
End If
FlexPeças.RemoveItem (FlexPeças.Row)
If FlexPeças.Rows > 2 Then FlexPeças.Rows = FlexPeças.Rows - 1
linha = linha - 1

End Sub

Private Sub Command4_Click()
cmdSalvar = True
End Sub

Private Sub FlexItens_Click()
Call desativar
mskCodpe = FlexItens.TextMatrix(FlexItens.Row, 0)
txtNomepe = FlexItens.TextMatrix(FlexItens.Row, 1)
mskqtd = 1
Call ativar
End Sub

Private Sub FlexItens_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
If Not FlexItens.TextMatrix(1, 0) = Empty Then
If Button = vbRightButton Then
PopupMenu mnuFor
End If
End If
End Sub

Private Sub FlexPeças_Click()
Call desativar
Command2 = True
Call ativar
End Sub

Private Sub FlexPeças_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
If Not FlexPeças.TextMatrix(1, 0) = Empty Then
If Button = vbRightButton Then
PopupMenu mnuPeças
End If
End If


End Sub

Private Sub Frame9_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse2.Visible = True
imgBuscar2.Visible = False
End Sub



Private Sub Image2_Click()
Me.Enabled = False
B_designe = True
frmB3.Show
End Sub

Private Sub imgMouse_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse1.Visible = False
imgBuscar.Visible = True
End Sub

Private Sub desativar()
          mskCod.PromptInclude = False
          mskCod_Desi.PromptInclude = False
            mskcodB.PromptInclude = False
            
            mskCodpe.PromptInclude = False
            mskqtd.PromptInclude = False
            Call por
End Sub
Private Sub ativar()

          mskCod.PromptInclude = True
          mskCod_Desi.PromptInclude = True
          mskcodB.PromptInclude = True
         
            mskqtd.PromptInclude = True
            Call Tirar
End Sub


Private Sub cmdAnt_Click()
            Call desativar
            
              If mskCod = Empty Then
             If tabelas.EOF = False Or tabelas.BOF = False Then

            tabelas.MoveFirst
            Call mostrar
            End If
            Else
            
            
            If navegaçao <> Empty Then
            tabelas.MoveFirst
            While navegaçao <> Empty
            If tabelas!codigo = navegaçao Then
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
            MsgBox "NAO A  MODELOS CADASTRADOS", vbExclamation
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

Private Sub cmdBf_Click()
Me.Enabled = False
frmBF.Show
End Sub

Private Sub cmdBuscar_Codigo_Desiger_Click()
                        
             
            Call desativar
            If mskCod_Desi = Empty Then
            Else
            
            tabelas2.Open "designe", conecta, adOpenKeyset, adLockOptimistic
        
            tabelas2.Close
            tabelas2.Open "select * from designe where Codigo=" & mskCod_Desi
            If tabelas2.BOF = False Or tabelas2.EOF = False Then
            txtRs = tabelas2!razaosocial
            End If
             
            End If
            Call ativar
            If tabelas2.State = adStateOpen Then tabelas2.Close
          
            
End Sub

Private Sub cmdBuscCod_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            cmdBuscCod = True
            End If
End Sub

Private Sub cmdBuscCod_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Faça busca por Codigo"
pctBuscar.Visible = True
pctluxus.Visible = False
End Sub

Private Sub cmdBuscNome_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Faça busca por um pedaço, ou nome inteiro"
pctBuscar.Visible = True
pctluxus.Visible = False
End Sub

Private Sub cmdBuscCod_Click()
           
            Call desativar
            If mskcodB = Empty Then
            
            Else
            tabelas.Close
            tabelas.Open "select * from M_designe where Codigo =" & mskcodB
            If tabelas.EOF = False Or tabelas.BOF = False Then
            Call mostrar
            End If
            End If
            Call Modelos
            Call ativar
            

End Sub


Private Sub cmdExclu_Click()
        
           Call desativar
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If mskCod = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
           On Error GoTo d
           conecta.Execute "delete * from peças_mod where codmodelo=" & mskCod
           conecta.Execute "delete * from M_designe where codigo=" & mskCod
           linha = Clear
           On Error GoTo q
           Kill App.Path & "\modelos\" & mskCod & ".jpeg"
q:
           cmdNovo = True
           status = "excluidos"
           Call crash1
           navegaçao = Clear
           Call Modelos
           End If
           End If
           Call ativar
         Exit Sub
d:
 Call Modelos
MsgBox "Este Designer não pode ser excluido pois ja possui um historico", vbExclamation
Call salvar_itens
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
            MsgBox "NAO A MODELOS CADASTRADOS", vbExclamation
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
            
            If mskCod = Empty Then
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            Call mostrar
            End If
            Else
            If navegaçao <> Empty Then
            tabelas.MoveFirst
            While navegaçao <> Empty
            If tabelas!codigo = navegaçao Then
            tabelas.MoveNext
            If tabelas.EOF = False Then Call mostrar Else Exit Sub
            navegaçao = Clear
            Else
            tabelas.MoveNext
            End If
            Wend
            Else
            
            If tabelas.EOF = False And tabelas.BOF = False Then
            tabelas.MoveNext
            If tabelas.EOF = True Then tabelas.MoveLast
            Call mostrar
            Else
            MsgBox "NAO A CADASTROS", vbExclamation
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
        If txtValor = Empty Or txtModelo = Empty Or mskCod_Desi = Empty Or cbTipo.Text = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        
        If tabelas2.State = adStateOpen Then tabelas2.Close
        tabelas2.Open "designe", conecta, adOpenKeyset, adLockOptimistic
        tabelas2.Close
        tabelas2.Open "select * from designe where codigo=" & mskCod_Desi
        If tabelas2.EOF = True Or tabelas2.BOF = True Then
        MsgBox "Este Designer não e Valido", vbExclamation
        tabelas2.Close
        Exit Sub
        End If
        tabelas2.Close
        cmdBuscar_Codigo_Desiger = True
        Call desativar
        
        If Not mskCod = Empty Then GoTo alterar
          'codigo autometico
        If mskCod = Empty Then
        If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 1000
        While b = Empty

        tabelas.Close
        tabelas.Open "select * from m_designe where codigo=" & a
        If tabelas.BOF = False Or tabelas.EOF = False Then
        a = a + 1
        Else
        b = 1
        Call Modelos
        End If
        Wend
        Else
        a = 1000
        End If
        mskCod = a
        b = Clear
        End If
        
alterar:
        
        tabelas.Close
        tabelas.Open "select * from M_designe where codigo=" & mskCod
        If tabelas.BOF = False Or tabelas.EOF = False Then
        If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
        status = "alteradas"
       conecta.Execute "delete * from peças_mod where codmodelo=" & mskCod
        Call salvar
         Call salvar_itens
       
        Call Modelos
        End If
        
        Else
        status = "salvos"
        conecta.Execute "delete * from peças_mod where codmodelo=" & mskCod
            Call salvar
        Call salvar_itens
        
        Call Modelos
        End If
        End If
        Call ativar
      
End Sub

Private Sub salvar()
If status = "salvos" Then
tabelas.AddNew
End If
Call desativar
tabelas!codigo = mskCod
tabelas!modelo = txtModelo
tabelas!cod_d = mskCod_Desi
tabelas!Descriçao = txtDescriçao.Text
tabelas!tipo = cbTipo.Text
tabelas!preço_cust = txtValor
On Error GoTo d
tabelas.Update
If caminho = Empty Then caminho = App.Path & "\logo.jpeg"
FileCopy caminho, App.Path & "\modelos\" & mskCod & ".jpeg"
Call Modelos
Call crash1
status = Clear
Call ativar
Exit Sub
d:
lkj = 1
MsgBox "Este iten possue um historico para com os produtos e nao pode ser alterado", vbExclamation
tabelas.CancelUpdate
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
            MsgBox "NAO A MODELOS CADASTRADOS", vbExclamation
            End If
            Call ativar
End Sub

            

Private Sub cmdBuscNome_Click()
            Call desativar
            If txtModelo = Empty Then
            MsgBox "Digite um nome para busca-lo", vbExclamation
            Else
            tabelas.Close
            tabelas.Open "select * from M_designe where Modelo like '" & txtModelo & "%'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            End If
            End If
            Call ativar
            Call Modelos
End Sub

Private Sub cmdNovo_Click()
            Call desativar
mskCod = Clear
txtAltura = Clear
txtLargura = Clear
txtComprimento = Clear
txtModelo = Clear
mskCod_Desi = Clear
txtURL = Clear
txtDescriçao.Text = Clear
txtRs = Clear
txtValor = Clear
mskCodfor = Clear
txtNomeFor = Clear
txtValor2 = Clear
mskCodpe = Clear
txtNomepe = Clear
mskqtd = Clear
linha = Clear
 FlexPeças.Clear
 FlexPeças.FormatString = ("Codigo      | Nome                      |Preço             |Quantidade     |Sub Total        ")
FlexPeças.Rows = 2
Image1.Picture = LoadPicture(App.Path & "\modelos\logo.jpeg")

            Call ativar
End Sub

Private Sub cmdUlt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o ultimo Registro"
pctNav.Visible = True
pctluxus.Visible = False
End Sub


           
Private Sub Command1_Click()
            Call desativar
            If txtRs = Empty Then
            Else
            tabelas2.Open "designe", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from designe where razaosocial like '" & txtRs & "%'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            mskCod_Desi = tabelas2!codigo
            tabelas2.Close
            End If
            End If
            Call ativar
            
End Sub

Private Sub flexClientes_Click()
             Call desativar
             mskcodB = flexClientes.TextMatrix(flexClientes.Row, 0)
            cmdBuscCod = True
            Call ativar
            Frame2.Visible = True
           
            TabStrip1.MultiSelect = True
            actskin2.ApplySkin (TabStrip1.hWnd)
            txtbuscas = Clear
            
End Sub

Private Sub flexClientes_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
 lblh.Caption = "Clique em um registro para levalo a outra aba"
            pctluxus.Visible = False
            pctBuscar.Visible = True
End Sub

Private Sub Form_Activate()
Call Modelos
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            SendKeys "{Tab}"
            End If

End Sub


Private Sub Form_Load()


            actskin.ApplySkin Me.hWnd
             actskin2.ApplySkin (cmdSalvar.hWnd)
             actskin2.ApplySkin (cmdNovo.hWnd)
             actskin2.ApplySkin (cmdExclu.hWnd)
             actskin2.ApplySkin (cmdBf.hWnd)
            actskin2.ApplySkin (Command4.hWnd)
             actskin2.ApplySkin (cmdaddLista.hWnd)
            actskin2.ApplySkin (cmdRlista.hWnd)
            actskin2.ApplySkin (TabStrip1.hWnd)
             actskin2.ApplySkin (Frame5.hWnd)
            
            Dim cont As Integer
                 Call tipos
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            cbTipo.AddItem (tabelas!nome)
            
            While cont = Empty
            tabelas.MoveNext
            If tabelas.EOF = False Then
            cbTipo.AddItem (tabelas!nome)
            Else
            cont = 1
            End If
            Wend
            End If
            Call Modelos
           
           Call carrega_lista_porfavor
            
End Sub
Private Sub carregar_lista()
 With flexClientes
            
            Dim cont1 As Integer
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!modelo
            .TextMatrix(cont1, 3) = Format(txtValor, "R$ #,##0.00;(R$#,##0.00)")
            
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "designe", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from designe where codigo=" & tabelas!cod_d
            .TextMatrix(cont1, 2) = tabelas2!razaosocial
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!modelo
            .TextMatrix(cont1, 3) = Format(txtValor, "R$ #,##0.00;(R$#,##0.00)")
            tabelas2.Close
            tabelas2.Open "select * from designe where codigo=" & tabelas!cod_d
            .TextMatrix(cont1, 2) = tabelas2!razaosocial
            Else
            cont1 = Clear
            End If
            Wend
           
             End If
            End With
           If tabelas2.State = adStateOpen Then tabelas2.Close
End Sub


Private Sub carrega_lista_porfavor()
            FlexItens.Clear
            FlexItens.Rows = 2
            FlexItens.FormatString = "Cod Peça   |Nome                        |Preço                 "
            If tabelas3.State = adStateOpen Then tabelas3.Close
             tabelas3.Open "peças", conecta, adOpenKeyset, adLockOptimistic
             If tabelas3.BOF = False Or tabelas3.EOF = False Then
            Dim cont As Integer
            cont = 1
            While tabelas3.EOF = False
            FlexItens.TextMatrix(cont, 0) = tabelas3!codigo
            FlexItens.TextMatrix(cont, 1) = tabelas3!nome
            FlexItens.TextMatrix(cont, 2) = Format(tabelas3!preço_venda, "R$ #,##0.00;(R$#,##0.00)")
            cont = cont + 1
            FlexItens.Rows = FlexItens.Rows + 1
            tabelas3.MoveNext
            Wend
            
            FlexItens.Rows = FlexItens.Rows - 1
            
           
            End If
            
            If tabelas2.State = adStateOpen Then tabelas2.Close
            If tabelas3.State = adStateOpen Then tabelas3.Close
           


End Sub

Private Sub Form_Unload(Cancel As Integer)
            If tabelas.State = adStateOpen Then tabelas.Close
            linha = Clear
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
imgBuscar.Visible = False

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

End Sub

Private Sub mnuConsFor_Click()
frmPeças.Show
frmPeças.mskCod.PromptInclude = False
frmPeças.mskCod = FlexItens.TextMatrix(FlexItens.Row, 0)
frmPeças.mskCod.PromptInclude = True
frmPeças.cmdBusca = True

End Sub

Private Sub mnuConsForne_Click()
frmForneced.Show
frmForneced.mskCod.PromptInclude = False
frmForneced.mskCod.PromptInclude = True
frmForneced.cmdBuscCod = True
End Sub

Private Sub mnuConspE_Click()
frmPeças.Show
frmPeças.mskCod.PromptInclude = False
frmPeças.mskCod = FlexPeças.TextMatrix(FlexItens.Row, 0)
frmPeças.mskCod.PromptInclude = True
frmPeças.cmdBusca = True

End Sub

Private Sub mnuExLin_Click()
If FlexPeças.TextMatrix(1, 0) = "" Then
MsgBox "Nao a itens a serem excluidos", vbInformation
Exit Sub
End If
FlexPeças.Rows = FlexPeças.Rows + 1
txtValor = txtValor - CCur(FlexPeças.TextMatrix(FlexPeças.Row, 4))
txtValor2 = txtValor
If FlexPeças.Rows > 3 Then
FlexPeças.Row = FlexPeças.Rows - 1
End If
FlexPeças.RemoveItem (FlexPeças.Row)
If FlexPeças.Rows > 2 Then FlexPeças.Rows = FlexPeças.Rows - 1
linha = linha - 1
End Sub

Private Sub mnuQuant_Click()
FlexPeças.TextMatrix(FlexPeças.Row, 3) = InputBox("Digite a quantidade")
End Sub

Private Sub mskCod_Desi_LostFocus()
cmdBuscar_Codigo_Desiger = True
End Sub

Private Sub mskCod_LostFocus()
            cmdBuscCod = True
End Sub

Private Sub mostrar()
cbTipo.Text = tabelas!tipo
mskCod = tabelas!codigo
txtModelo = tabelas!modelo
mskCod_Desi = tabelas!cod_d
txtDescriçao.Text = tabelas!Descriçao
txtValor = Format(tabelas!preço_cust, "R$ #,##0.00;(R$#,##0.00)")
txtValor2 = Format(tabelas!preço_cust, "R$ #,##0.00;(R$#,##0.00)")
navegaçao = tabelas!codigo

FlexPeças.Clear
FlexPeças.Rows = 2
FlexPeças.FormatString = "Codigo      | Nome                      |Preço             |Quantidade     |Sub Total        "
tabelas2.Open "peças", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from Peças_mod where codmodelo=" & mskCod
Dim cont As Integer
cont = 1
While tabelas2.EOF = False
FlexPeças.TextMatrix(cont, 0) = tabelas2!codpe


If tabelas4.State = adStateOpen Then tabelas4.Close
tabelas4.Open "peças", conecta, adOpenKeyset, adLockOptimistic
If tabelas4.State = adStateOpen Then tabelas4.Close
tabelas4.Open "select *from peças where codigo=" & tabelas2!codpe


FlexPeças.TextMatrix(cont, 2) = Format(tabelas4!preço_venda, "R$ #,##0.00;(R$#,##0.00)")
FlexPeças.TextMatrix(cont, 4) = Format(tabelas2!qtd * tabelas4!preço_venda, "R$ #,##0.00;(R$#,##0.00)")
FlexPeças.TextMatrix(cont, 3) = tabelas2!qtd


tabelas3.Open "peças", conecta, adOpenKeyset, adLockOptimistic
tabelas3.Close
tabelas3.Open "select * from peças where codigo =" & tabelas2!codpe
FlexPeças.TextMatrix(cont, 1) = tabelas3!nome
tabelas3.Close


cont = cont + 1
FlexPeças.Rows = FlexPeças.Rows + 1
tabelas2.MoveNext
Wend
FlexPeças.Rows = FlexPeças.Rows - 1
tabelas2.Close
linha = FlexPeças.Rows - 1
cmdBuscar_Codigo_Desiger = True

On Error GoTo Img
Image1.Picture = LoadPicture(App.Path & "\modelos\logo.jpeg")
Image1.Picture = LoadPicture(App.Path & "\Modelos\" & tabelas!codigo & ".jpeg")
Exit Sub
Img:
MsgBox "O windows nao pode encontrar o URL(endereço) da imagem:" & Chr(13) & txtURL, vbCritical
End Sub


Private Sub TabStrip1_Click()
Select Case TabStrip1.SelectedItem.Index
Case Is = 1
Frame7.Visible = False
Frame2.Visible = True
Frame10.Visible = False
Case Is = 3
Frame7.Visible = True
Frame10.Visible = False
Frame2.Visible = False
Case Is = 2
Frame7.Visible = False
Frame10.Visible = True
Frame2.Visible = False
End Select
Call carregar_lista
End Sub

Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub txtbuscas_Change()
             tabelas.Close
             tabelas.Open "select * from m_designe where modelo like '" & Replace(txtbuscas, "'", "''") & "%' order by codigo"
              Call carregar_lista
End Sub
