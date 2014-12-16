VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmNotafiscal 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chcobomba Industria e Comércio Ltda."
   ClientHeight    =   11040
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   12585
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   11040
   ScaleWidth      =   12585
   Begin VB.CommandButton cmdGravar 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   525
      Left            =   10800
      Picture         =   "frmNotafiscal.frx":0000
      Style           =   1  'Graphical
      TabIndex        =   98
      ToolTipText     =   "Salvar"
      Top             =   7800
      Width           =   615
   End
   Begin VB.CommandButton cmdAlterar 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   525
      Left            =   10800
      Picture         =   "frmNotafiscal.frx":5A3D
      Style           =   1  'Graphical
      TabIndex        =   97
      ToolTipText     =   "Alterar"
      Top             =   8400
      Width           =   615
   End
   Begin VB.CommandButton cmdExcluir 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   525
      Left            =   10800
      Picture         =   "frmNotafiscal.frx":B4A7
      Style           =   1  'Graphical
      TabIndex        =   96
      Top             =   9000
      Width           =   615
   End
   Begin VB.CommandButton cmdNovo 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   525
      Left            =   10800
      Picture         =   "frmNotafiscal.frx":10FE5
      Style           =   1  'Graphical
      TabIndex        =   95
      Top             =   9600
      Width           =   615
   End
   Begin VB.CommandButton cmdPri 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   10800
      MaskColor       =   &H00FFFFFF&
      Picture         =   "frmNotafiscal.frx":1687F
      Style           =   1  'Graphical
      TabIndex        =   94
      Top             =   10425
      Width           =   405
   End
   Begin VB.CommandButton cmdAnt 
      Appearance      =   0  'Flat
      BackColor       =   &H80000009&
      Height          =   375
      Left            =   11190
      MaskColor       =   &H00FFFFFF&
      Picture         =   "frmNotafiscal.frx":1C0FB
      Style           =   1  'Graphical
      TabIndex        =   93
      Top             =   10425
      Width           =   405
   End
   Begin VB.CommandButton cmdProx 
      Appearance      =   0  'Flat
      BackColor       =   &H80000009&
      Height          =   375
      Left            =   11580
      MaskColor       =   &H00FFFFFF&
      Picture         =   "frmNotafiscal.frx":219A9
      Style           =   1  'Graphical
      TabIndex        =   92
      Top             =   10425
      Width           =   405
   End
   Begin VB.CommandButton cmdUlt 
      Appearance      =   0  'Flat
      BackColor       =   &H80000009&
      Height          =   375
      Left            =   12000
      MaskColor       =   &H00FFFFFF&
      Picture         =   "frmNotafiscal.frx":27239
      Style           =   1  'Graphical
      TabIndex        =   91
      Top             =   10425
      Width           =   405
   End
   Begin VB.CommandButton Command5 
      Appearance      =   0  'Flat
      BackColor       =   &H80000009&
      Height          =   525
      Left            =   13785
      MaskColor       =   &H00FFFFFF&
      Picture         =   "frmNotafiscal.frx":2CA9B
      Style           =   1  'Graphical
      TabIndex        =   90
      Top             =   4320
      Width           =   555
   End
   Begin VB.TextBox txtNomeCobrança 
      Height          =   285
      Left            =   7920
      TabIndex        =   89
      Top             =   10680
      Width           =   2655
   End
   Begin VB.TextBox txtTelCobrança 
      Height          =   285
      Left            =   5520
      TabIndex        =   88
      Top             =   10680
      Width           =   2175
   End
   Begin VB.TextBox txtBairroCobrança 
      Height          =   285
      Left            =   3840
      TabIndex        =   87
      Top             =   10680
      Width           =   1575
   End
   Begin VB.TextBox txtEndCobrança 
      Height          =   285
      Left            =   120
      TabIndex        =   86
      Top             =   10680
      Width           =   3495
   End
   Begin VB.TextBox txtNomeEnt 
      Height          =   285
      Left            =   7920
      TabIndex        =   81
      Top             =   10200
      Width           =   2655
   End
   Begin VB.TextBox txtTelEnt 
      Height          =   285
      Left            =   5520
      TabIndex        =   80
      Top             =   10200
      Width           =   2175
   End
   Begin VB.TextBox xtBairroEnt 
      Height          =   285
      Left            =   3840
      TabIndex        =   79
      Top             =   10200
      Width           =   1575
   End
   Begin VB.TextBox txtEndEntrega 
      Height          =   285
      Left            =   120
      TabIndex        =   78
      Top             =   10200
      Width           =   3495
   End
   Begin VB.TextBox txtContForm 
      Height          =   1095
      Left            =   9720
      TabIndex        =   72
      Top             =   8760
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   1575
      Left            =   5400
      TabIndex        =   70
      Top             =   8280
      Width           =   4215
   End
   Begin VB.TextBox txtNPed 
      Height          =   315
      Left            =   4440
      TabIndex        =   68
      Top             =   9480
      Width           =   855
   End
   Begin VB.TextBox txtSPed 
      Height          =   285
      Left            =   4440
      TabIndex        =   66
      Top             =   8880
      Width           =   855
   End
   Begin VB.TextBox txtVend 
      Height          =   285
      Left            =   4440
      TabIndex        =   64
      Top             =   8280
      Width           =   855
   End
   Begin VB.TextBox txtAdicionais 
      Height          =   1575
      Left            =   120
      TabIndex        =   62
      Top             =   8280
      Width           =   4215
   End
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "CALCULO DO IMPOSTO"
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   38
      Top             =   6480
      Width           =   10575
      Begin MSMask.MaskEdBox mskCalcIcms 
         Height          =   255
         Left            =   120
         TabIndex        =   44
         Top             =   480
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskValIcms 
         Height          =   255
         Left            =   2040
         TabIndex        =   45
         Top             =   480
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCalcIcmsSubst 
         Height          =   255
         Left            =   3360
         TabIndex        =   46
         Top             =   480
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskValIcmsSubst 
         Height          =   255
         Left            =   6600
         TabIndex        =   47
         Top             =   480
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox1 
         Height          =   255
         Left            =   9000
         TabIndex        =   48
         Top             =   480
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox3 
         Height          =   255
         Left            =   120
         TabIndex        =   56
         Top             =   1080
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox4 
         Height          =   255
         Left            =   2040
         TabIndex        =   57
         Top             =   1080
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox12 
         Height          =   255
         Left            =   3360
         TabIndex        =   58
         Top             =   1080
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox13 
         Height          =   255
         Left            =   6600
         TabIndex        =   59
         Top             =   1080
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox14 
         Height          =   255
         Left            =   9000
         TabIndex        =   60
         Top             =   1080
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin VB.Label Label29 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Valor Total da Nota"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   9000
         TabIndex        =   55
         Top             =   840
         Width           =   1380
      End
      Begin VB.Label Label28 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Valor Total do  I.P.I."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   6600
         TabIndex        =   54
         Top             =   840
         Width           =   1380
      End
      Begin VB.Label Label27 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Outra Despesas"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   3480
         TabIndex        =   53
         Top             =   840
         Width           =   1185
      End
      Begin VB.Label Label26 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Valor do Seguro"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   2040
         TabIndex        =   52
         Top             =   840
         Width           =   1185
      End
      Begin VB.Label Label25 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Valor do Frete"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   120
         TabIndex        =   51
         Top             =   840
         Width           =   1035
      End
      Begin VB.Label Label24 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Valor dos Produtos"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   9000
         TabIndex        =   43
         Top             =   240
         Width           =   1395
      End
      Begin VB.Label Label23 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Valor do ICMS com substituição"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   6600
         TabIndex        =   42
         Top             =   240
         Width           =   2280
      End
      Begin VB.Label Label22 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Base de calculo do ICMS com substituição"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   3360
         TabIndex        =   41
         Top             =   240
         Width           =   3045
      End
      Begin VB.Label Label21 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Valor do ICMS"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   2160
         TabIndex        =   40
         Top             =   240
         Width           =   1020
      End
      Begin VB.Label Label20 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Base de cálculo do ICMS"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   120
         TabIndex        =   39
         Top             =   240
         Width           =   1785
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "DADOS DOS PRODUTOS"
      ForeColor       =   &H80000008&
      Height          =   1095
      Left            =   120
      TabIndex        =   36
      Top             =   5280
      Width           =   10575
      Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
         Height          =   735
         Left            =   120
         TabIndex        =   37
         Top             =   240
         Width           =   9735
         _ExtentX        =   17171
         _ExtentY        =   1296
         _Version        =   393216
         Cols            =   10
         FormatString    =   $"frmNotafiscal.frx":2CDA5
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "DESTINATÁRIO/REMETENTE"
      ForeColor       =   &H80000008&
      Height          =   2895
      Left            =   120
      TabIndex        =   13
      Top             =   2280
      Width           =   10575
      Begin VB.ComboBox cboUf 
         Height          =   315
         Left            =   5760
         TabIndex        =   50
         Text            =   "AC"
         Top             =   1560
         Width           =   735
      End
      Begin MSMask.MaskEdBox mskCnpjDest 
         Height          =   255
         Left            =   4320
         TabIndex        =   31
         Top             =   600
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtInscDest 
         Height          =   285
         Left            =   6960
         TabIndex        =   30
         Top             =   1560
         Width           =   2175
      End
      Begin VB.TextBox txtMunic 
         Height          =   285
         Left            =   120
         TabIndex        =   29
         Top             =   1560
         Width           =   2895
      End
      Begin VB.TextBox txtBairro 
         Height          =   285
         Left            =   3240
         TabIndex        =   28
         Top             =   1080
         Width           =   2055
      End
      Begin VB.TextBox txtLog 
         Height          =   285
         Left            =   120
         TabIndex        =   27
         Top             =   1080
         Width           =   2895
      End
      Begin VB.TextBox txtNomeDest 
         Height          =   285
         Left            =   120
         TabIndex        =   26
         Top             =   600
         Width           =   2895
      End
      Begin MSMask.MaskEdBox mskDtemit 
         Height          =   255
         Left            =   7560
         TabIndex        =   32
         Top             =   600
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskDtSaida 
         Height          =   255
         Left            =   7560
         TabIndex        =   33
         Top             =   1080
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskTel 
         Height          =   255
         Left            =   3240
         TabIndex        =   34
         Top             =   1560
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskFatura 
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   2400
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox MaskEdBox2 
         Height          =   255
         Left            =   5760
         TabIndex        =   49
         Top             =   1080
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   450
         _Version        =   393216
         PromptChar      =   "_"
      End
      Begin VB.Label Label19 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Fatura"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   120
         TabIndex        =   25
         Top             =   2160
         Width           =   555
      End
      Begin VB.Label Label18 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Inscrição Estadual"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   6960
         TabIndex        =   24
         Top             =   1320
         Width           =   1605
      End
      Begin VB.Label Label17 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "UF"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   5760
         TabIndex        =   23
         Top             =   1320
         Width           =   255
      End
      Begin VB.Label Label16 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Fone/Fax"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   3240
         TabIndex        =   22
         Top             =   1320
         Width           =   825
      End
      Begin VB.Label Label15 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Município"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   120
         TabIndex        =   21
         Top             =   1320
         Width           =   825
      End
      Begin VB.Label Label14 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Data Saída/Entrada"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   7560
         TabIndex        =   20
         Top             =   840
         Width           =   1695
      End
      Begin VB.Label Label13 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "CEP"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   5760
         TabIndex        =   19
         Top             =   840
         Width           =   405
      End
      Begin VB.Label Label12 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Bairro/Distrito"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   3240
         TabIndex        =   18
         Top             =   840
         Width           =   1185
      End
      Begin VB.Label Label11 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Logradouro"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   120
         TabIndex        =   17
         Top             =   840
         Width           =   960
      End
      Begin VB.Label Label10 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Data da Emissão"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   7560
         TabIndex        =   16
         Top             =   360
         Width           =   1500
      End
      Begin VB.Label Label9 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "CNPJ/CPF"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   4320
         TabIndex        =   15
         Top             =   360
         Width           =   945
      End
      Begin VB.Label Label8 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "Nome/Razão Social"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   120
         TabIndex        =   14
         Top             =   360
         Width           =   1725
      End
   End
   Begin MSMask.MaskEdBox MmskNumNf 
      Height          =   255
      Left            =   7440
      TabIndex        =   9
      Top             =   720
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   450
      _Version        =   393216
      PromptChar      =   "_"
   End
   Begin VB.TextBox Text1 
      Height          =   195
      Left            =   7440
      TabIndex        =   8
      Top             =   1320
      Width           =   735
   End
   Begin VB.TextBox txtRazão_nome 
      Height          =   285
      Left            =   120
      TabIndex        =   7
      Top             =   1320
      Width           =   4215
   End
   Begin MSMask.MaskEdBox mskCnpj 
      Height          =   255
      Left            =   4560
      TabIndex        =   10
      Top             =   1320
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   450
      _Version        =   393216
      PromptChar      =   "_"
   End
   Begin MSMask.MaskEdBox mskInsc 
      Height          =   255
      Left            =   4560
      TabIndex        =   11
      Top             =   1920
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   450
      _Version        =   393216
      PromptChar      =   "_"
   End
   Begin MSMask.MaskEdBox dtLimiteEmi 
      Height          =   255
      Left            =   7440
      TabIndex        =   12
      Top             =   1920
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   450
      _Version        =   393216
      PromptChar      =   "_"
   End
   Begin VB.Label Label44 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Nome"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   7920
      TabIndex        =   85
      Top             =   10440
      Width           =   405
   End
   Begin VB.Label Label43 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Telefone/Ramal"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   5520
      TabIndex        =   84
      Top             =   10440
      Width           =   1110
   End
   Begin VB.Label Label42 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Bairro"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   3960
      TabIndex        =   83
      Top             =   10440
      Width           =   435
   End
   Begin VB.Label Label41 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Endereço de Cobrança"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   120
      TabIndex        =   82
      Top             =   10440
      Width           =   1665
   End
   Begin VB.Label Label40 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Nome"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   7920
      TabIndex        =   77
      Top             =   9960
      Width           =   405
   End
   Begin VB.Label Label39 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Telefone/Ramal"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   5520
      TabIndex        =   76
      Top             =   9960
      Width           =   1110
   End
   Begin VB.Label Label38 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Bairro"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   3960
      TabIndex        =   75
      Top             =   9960
      Width           =   435
   End
   Begin VB.Label Label37 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Endereço de Entrega"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   120
      TabIndex        =   74
      Top             =   9960
      Width           =   1515
   End
   Begin VB.Label Label36 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "N/ Pedido N°"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   15
      Left            =   2280
      TabIndex        =   73
      Top             =   8955
      Width           =   885
   End
   Begin VB.Label Label35 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Número do controle de Formulários"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   690
      Left            =   9720
      TabIndex        =   71
      Top             =   8040
      Width           =   1200
   End
   Begin VB.Label Label34 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "RESERVADO AO FISCO"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   5400
      TabIndex        =   69
      Top             =   8040
      Width           =   1740
   End
   Begin VB.Label Label33 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "N/ Pedido N°"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   4440
      TabIndex        =   67
      Top             =   9240
      Width           =   885
   End
   Begin VB.Label Label32 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "S/ Pedido N°"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   4440
      TabIndex        =   65
      Top             =   8640
      Width           =   885
   End
   Begin VB.Label Label31 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Vendedor"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   4440
      TabIndex        =   63
      Top             =   8040
      Width           =   720
   End
   Begin VB.Label Label30 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "DADOS ADICIONAIS"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   120
      TabIndex        =   61
      Top             =   8040
      Width           =   1470
   End
   Begin VB.Label Label7 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Razão social/Nome Fantasia"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   120
      TabIndex        =   6
      Top             =   1080
      Width           =   2505
   End
   Begin VB.Label Label6 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Data Limite Para emissão"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   7440
      TabIndex        =   5
      Top             =   1680
      Width           =   2250
   End
   Begin VB.Label Label5 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Inscrição estadual"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4560
      TabIndex        =   4
      Top             =   1680
      Width           =   1575
   End
   Begin VB.Label Label4 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "CNPJ"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4560
      TabIndex        =   3
      Top             =   1080
      Width           =   495
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Série"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   7440
      TabIndex        =   2
      Top             =   1080
      Width           =   450
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "N°"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   7440
      TabIndex        =   1
      Top             =   480
      Width           =   210
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Nota Fiscal"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   26.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   600
      Left            =   3480
      TabIndex        =   0
      Top             =   120
      Width           =   2550
   End
End
Attribute VB_Name = "frmNotafiscal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


