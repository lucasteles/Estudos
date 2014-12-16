VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmClientes 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Clientes"
   ClientHeight    =   9315
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   9225
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   9315
   ScaleWidth      =   9225
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   555
      Left            =   240
      ScaleHeight     =   555
      ScaleWidth      =   9135
      TabIndex        =   36
      Top             =   6840
      Width           =   9135
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmClientes.frx":0000
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   34
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmClientes.frx":0CCA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   33
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmClientes.frx":1594
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   62
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmClientes.frx":225E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   61
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmClientes.frx":2F28
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   60
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmClientes.frx":37F2
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   59
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
         TabIndex        =   35
         Top             =   240
         Width           =   975
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
      Height          =   5295
      Left            =   120
      TabIndex        =   37
      Top             =   1200
      Width           =   8895
      Begin VB.CommandButton Command1 
         Caption         =   "Busca"
         Height          =   375
         Left            =   7920
         TabIndex        =   65
         ToolTipText     =   "Faz busca pelo CNPJ"
         Top             =   1440
         Width           =   615
      End
      Begin MSComCtl2.DTPicker mskdtnasc 
         Height          =   375
         Left            =   3360
         TabIndex        =   14
         Top             =   3960
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         Format          =   96731137
         CurrentDate     =   39748
      End
      Begin VB.Frame Frame6 
         Height          =   855
         Left            =   7080
         TabIndex        =   45
         Top             =   1920
         Width           =   1215
         Begin VB.OptionButton Option2 
            Caption         =   "Juridica"
            Height          =   195
            Left            =   120
            TabIndex        =   64
            Top             =   480
            Width           =   975
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Fisica"
            Height          =   375
            Left            =   120
            TabIndex        =   63
            Top             =   120
            Width           =   975
         End
      End
      Begin VB.TextBox txtNFantasia 
         Height          =   375
         Left            =   5880
         MaxLength       =   50
         TabIndex        =   5
         Top             =   1440
         Width           =   1935
      End
      Begin VB.CommandButton cmdBuscar_CNPJ_Cliente 
         Caption         =   "Busca"
         Height          =   375
         Left            =   7680
         TabIndex        =   17
         ToolTipText     =   "Faz busca pelo CNPJ"
         Top             =   600
         Width           =   615
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
         ItemData        =   "frmClientes.frx":3D7C
         Left            =   480
         List            =   "frmClientes.frx":3DD1
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   3960
         Width           =   975
      End
      Begin VB.Frame Frame3 
         Height          =   735
         Left            =   240
         TabIndex        =   58
         Top             =   4440
         Width           =   2415
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
            Picture         =   "frmClientes.frx":3E41
            TabIndex        =   19
            ToolTipText     =   "Vai para o primeiro registro"
            Top             =   240
            Width           =   615
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
            Picture         =   "frmClientes.frx":4283
            TabIndex        =   21
            ToolTipText     =   "Vai para o próximo registro"
            Top             =   240
            Width           =   495
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
            Picture         =   "frmClientes.frx":46C5
            TabIndex        =   20
            ToolTipText     =   "Vai para o registro anterior"
            Top             =   240
            Width           =   495
         End
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
            Picture         =   "frmClientes.frx":4B07
            TabIndex        =   22
            ToolTipText     =   "Vai para o último registro "
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   7440
         Top             =   3000
      End
      Begin VB.TextBox txtNome 
         Height          =   375
         Left            =   2160
         MaxLength       =   50
         TabIndex        =   1
         Top             =   600
         Width           =   2895
      End
      Begin VB.TextBox txtLog 
         Height          =   375
         Left            =   360
         MaxLength       =   50
         TabIndex        =   4
         Top             =   1440
         Width           =   4695
      End
      Begin VB.TextBox txtCidade 
         Height          =   375
         Left            =   4680
         MaxLength       =   50
         TabIndex        =   8
         Top             =   2280
         Width           =   1815
      End
      Begin VB.TextBox txtBairro 
         Height          =   375
         Left            =   480
         MaxLength       =   50
         TabIndex        =   6
         Top             =   2280
         Width           =   2655
      End
      Begin VB.TextBox txtNumero 
         Height          =   375
         Left            =   3480
         MaxLength       =   10
         TabIndex        =   7
         Top             =   2280
         Width           =   975
      End
      Begin VB.CommandButton cmdBuscCod 
         Caption         =   "Busca"
         Height          =   375
         Left            =   1320
         Picture         =   "frmClientes.frx":4F49
         TabIndex        =   15
         ToolTipText     =   "Faz a busca pelo código do cliente"
         Top             =   600
         Width           =   615
      End
      Begin VB.CommandButton cmdBuscRg 
         Caption         =   "Busca"
         Height          =   375
         Left            =   4920
         TabIndex        =   18
         ToolTipText     =   "Faz a busca pelo RG"
         Top             =   3120
         Width           =   615
      End
      Begin VB.CommandButton cmdExclu 
         Caption         =   "Excluir"
         Height          =   495
         Left            =   3240
         TabIndex        =   23
         ToolTipText     =   "Este botão Exclui o registro"
         Top             =   4560
         Width           =   1095
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   495
         Left            =   4320
         TabIndex        =   24
         ToolTipText     =   "Este botão Salva/Altera o registro "
         Top             =   4560
         Width           =   1095
      End
      Begin VB.CommandButton cmdnovo 
         Caption         =   "Novo"
         Height          =   495
         Left            =   5400
         TabIndex        =   25
         ToolTipText     =   "Esta botão limpa todos os campos preenchidos"
         Top             =   4560
         Width           =   1095
      End
      Begin VB.CommandButton cmdBuscNome 
         Caption         =   "Busca"
         Height          =   375
         Left            =   5160
         TabIndex        =   16
         ToolTipText     =   "Faz a busca pelo nome/Razão Social"
         Top             =   600
         Width           =   615
      End
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   7440
         Top             =   3000
      End
      Begin MSMask.MaskEdBox mskRg 
         Height          =   375
         Left            =   3480
         TabIndex        =   11
         Top             =   3120
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   13
         Mask            =   "###.###.###-&"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCep 
         Height          =   375
         Left            =   1920
         TabIndex        =   13
         Top             =   3960
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   9
         Mask            =   "#####-###"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCel 
         Height          =   375
         Left            =   2040
         TabIndex        =   10
         Top             =   3120
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
         TabIndex        =   0
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
         Left            =   480
         TabIndex        =   9
         Top             =   3120
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   13
         Mask            =   "(##)####-####"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel x 
         Height          =   255
         Left            =   3240
         OleObjectBlob   =   "frmClientes.frx":5C13
         TabIndex        =   39
         Top             =   3720
         Width           =   1935
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   1920
         OleObjectBlob   =   "frmClientes.frx":5C95
         TabIndex        =   40
         Top             =   3720
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   255
         Left            =   480
         OleObjectBlob   =   "frmClientes.frx":5CF9
         TabIndex        =   41
         Top             =   3720
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel z 
         Height          =   255
         Left            =   3360
         OleObjectBlob   =   "frmClientes.frx":5D5F
         TabIndex        =   42
         Top             =   2880
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   255
         Left            =   1800
         OleObjectBlob   =   "frmClientes.frx":5DC1
         TabIndex        =   43
         Top             =   2880
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmClientes.frx":5E2D
         TabIndex        =   44
         Top             =   2880
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   255
         Left            =   4560
         OleObjectBlob   =   "frmClientes.frx":5E9B
         TabIndex        =   46
         Top             =   2040
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmClientes.frx":5F05
         TabIndex        =   51
         Top             =   1200
         Width           =   1455
      End
      Begin ACTIVESKINLibCtl.SkinLabel eee 
         Height          =   255
         Left            =   2040
         OleObjectBlob   =   "frmClientes.frx":5F77
         TabIndex        =   53
         Top             =   360
         Width           =   2175
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmClientes.frx":5FFB
         TabIndex        =   52
         Top             =   360
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmClientes.frx":6065
         TabIndex        =   48
         Top             =   2040
         Width           =   1455
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
         Height          =   255
         Left            =   3360
         OleObjectBlob   =   "frmClientes.frx":60CF
         TabIndex        =   47
         Top             =   2040
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel www 
         Height          =   255
         Left            =   5880
         OleObjectBlob   =   "frmClientes.frx":6139
         TabIndex        =   50
         Top             =   360
         Width           =   2655
      End
      Begin MSMask.MaskEdBox mskCNPJ 
         Height          =   375
         Left            =   5880
         TabIndex        =   2
         Top             =   600
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   18
         Mask            =   "##-###-###/####-##"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel asdf 
         Height          =   255
         Left            =   5880
         OleObjectBlob   =   "frmClientes.frx":619F
         TabIndex        =   49
         Top             =   1200
         Width           =   2175
      End
      Begin MSMask.MaskEdBox mskCPF 
         Height          =   375
         Left            =   5880
         TabIndex        =   3
         Top             =   600
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   13
         Mask            =   "###-###-###-#"
         PromptChar      =   "_"
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
         TabIndex        =   55
         Top             =   600
         Width           =   105
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   5895
      Left            =   0
      TabIndex        =   54
      Top             =   840
      Width           =   9135
      _ExtentX        =   16113
      _ExtentY        =   10398
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Cadastro"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Lista"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   29
      Top             =   120
      Width           =   9015
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmClientes.frx":6217
         TabIndex        =   32
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   6600
         OleObjectBlob   =   "frmClientes.frx":6279
         TabIndex        =   31
         Top             =   120
         Width           =   1335
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmClientes.frx":62E7
         TabIndex        =   30
         Top             =   120
         Width           =   1455
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
      Height          =   255
      Left            =   0
      OleObjectBlob   =   "frmClientes.frx":6355
      TabIndex        =   57
      Top             =   1920
      Width           =   735
   End
   Begin VB.Frame frame1 
      Height          =   5295
      Left            =   120
      TabIndex        =   56
      Top             =   1200
      Visible         =   0   'False
      Width           =   8895
      Begin VB.Frame Frame4 
         Caption         =   "Busca"
         Height          =   855
         Left            =   600
         TabIndex        =   38
         Top             =   120
         Width           =   4335
         Begin VB.ComboBox cmbBusca 
            Height          =   315
            ItemData        =   "frmClientes.frx":63C3
            Left            =   120
            List            =   "frmClientes.frx":63D0
            TabIndex        =   26
            Text            =   "Nome"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtbuscas 
            Height          =   315
            Left            =   1680
            MaxLength       =   50
            TabIndex        =   27
            Top             =   360
            Width           =   1455
         End
      End
      Begin MSFlexGridLib.MSFlexGrid flexClientes 
         Height          =   3975
         Left            =   1320
         TabIndex        =   28
         Top             =   1080
         Width           =   6375
         _ExtentX        =   11245
         _ExtentY        =   7011
         _Version        =   393216
         Cols            =   4
         FixedCols       =   0
         BackColor       =   16777215
         ForeColor       =   -2147483625
         BackColorFixed  =   14737632
         BackColorSel    =   -2147483643
         ForeColorSel    =   -2147483647
         BackColorBkg    =   16777215
         GridColor       =   0
         FormatString    =   "Codigo     | Nome                                                |Telefone             | Celular                "
      End
   End
End
Attribute VB_Name = "frmClientes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As Long
Dim b As Integer
Dim navegaçao As Integer


Private Sub desativar()
            mskCel.PromptInclude = False
            mskCep.PromptInclude = False
            mskRg.PromptInclude = False
           mskCNPJ.PromptInclude = False
            mskCod.PromptInclude = False
            mskTel.PromptInclude = False
            mskCPF.PromptInclude = False
End Sub
Private Sub ativar()
            mskCel.PromptInclude = True
            mskCep.PromptInclude = True
            mskRg.PromptInclude = True
            mskCel.PromptInclude = True
            mskCod.PromptInclude = True
            mskCNPJ.PromptInclude = True
            mskCPF.PromptInclude = True
End Sub


Private Sub cmdAnt_Click()
            Call desativar
            
              If mskCod = Empty Then
            tabelas.MoveFirst
            Call mostrar
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
            MsgBox "NAO A CLIENTES CADASTRADOS", vbExclamation
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

Private Sub cmdBuscar_CNPJ_Cliente_Click()
Call Tirar
            Call desativar
            If mskCNPJ = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from clientes where CNPJ= '" & mskCNPJ & "'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            Else
            MsgBox "CNPJ Inexistente", vbCritical
            End If
            End If
            Call ativar
             Call clientes
          Call por


End Sub

Private Sub cmdBuscCod_Click()
 Call Tirar
            Call desativar
            If mskCod = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from clientes where codigo=" & mskCod
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            End If
            End If
            Call ativar
             Call clientes
          Call por
            
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

Private Sub cmdBuscRg_Click()
        
            Call desativar
            If mskRg = Empty Then
            MsgBox "Digite um Rg para Busca-lo", vbExclamation
            Else
            tabelas.Close
            tabelas.Open "select * from clientes where rg = '" & mskRg & "'"
            If tabelas.EOF = False Or tabelas.BOF = False Then
            Call mostrar
            End If
            End If
            Call clientes
            Call ativar
            

End Sub

Private Sub cmdBuscRg_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Faça busca por Rg"
pctBuscar.Visible = True
pctluxus.Visible = False
End Sub

Private Sub cmdExclu_Click()
Call Tirar
           Call desativar
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If mskCod = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
           
           On Error GoTo d:
           conecta.Execute "delete * from clientes where codigo=" & mskCod
           cmdnovo = True
           status = "excluidos"
           Call crash1
           navegaçao = Clear
           Call clientes
           End If
           End If

           Call ativar
           Call por
           
           Exit Sub
d:
MsgBox "Este cliente não pode ser excluido pois ja possui um historico", vbExclamation
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
            MsgBox "NAO A CLIENTES CADASTRADOS", vbExclamation
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
            tabelas.MoveFirst
            Call mostrar
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
            
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveNext
            If tabelas.EOF = True Then tabelas.MoveLast
            Call mostrar
            Else
            MsgBox "NAO A CLIENTES CADASTRADOS", vbExclamation
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

Call Tirar
        Call desativar
        If txtNome = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
       
        
     'codigo autometico
        If mskCod = Empty Then
        If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 1
        While b = Empty
        
        tabelas.Close
        tabelas.Open "select * from clientes where codigo=" & a
        If tabelas.BOF = False Or tabelas.EOF = False Then
        a = a + 1
        Else
        b = 1
        Call clientes
        End If
        Wend
        Else
        a = 1
        End If
        mskCod = a
        navegaçao = a
        b = Clear
        End If
        
     
        
     
         
        tabelas.Close
        tabelas.Open "select * from clientes where codigo=" & mskCod
        If tabelas.BOF = False Or tabelas.EOF = False Then
        If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
        conecta.Execute "update clientes set  nome='" & txtNome.Text & "',logradouro= '" & txtLog.Text & "',numero= '" & txtNumero.Text & "',bairro= '" & txtBairro.Text & "',cidade= '" & txtCidade.Text & "',uf= '" & txtUF.Text & "', cep= '" & mskCep.Text & "', rg= '" & mskRg.Text & "', celular=  '" & mskCel.Text & "', dtnasc= '" & mskdtnasc.Value & "',telefone= '" & mskTel.Text & "', CNPJ= '" & mskCNPJ & "',nomefantasia= '" & txtNFantasia & "', cpf= '" & mskCPF & "' where codigo=" & mskCod
        status = "alteradas"
        
        Call crash1
        Call clientes
        End If
        Else
        conecta.Execute "insert into clientes (codigo, nome, logradouro, numero, bairro, cidade, uf, cep, rg, celular, dtnasc, telefone, cnpj, nomefantasia,cpf)" & _
        "values('" & mskCod.Text & "', '" & txtNome.Text & "', '" & txtLog.Text & "', '" & txtNumero.Text & "', '" & txtBairro.Text & "', '" & txtCidade.Text & "', '" & txtUF.Text & "', '" & mskCep.Text & "', '" & mskRg.Text & "',  '" & mskCel.Text & "', '" & mskdtnasc.Value & "', '" & mskTel.Text & "', '" & mskCNPJ.Text & "', '" & txtNFantasia.Text & "', '" & mskCPF.Text & "')"
        Call ativar
        status = "salvos"
        Call crash1
        Call clientes
        End If
        End If
        
       Call por
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
            MsgBox "NAO A CLIENTES CADASTRADOS", vbExclamation
            End If
            Call ativar
End Sub

            

Private Sub cmdBuscNome_Click()
Call Tirar
            Call desativar
            If txtNome = Empty Then
            MsgBox "Digite um nome para busca-lo", vbExclamation
            Else
            tabelas.Close
            tabelas.Open "select * from clientes where nome like '" & Replace(txtNome, "'", "''") & "%'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            End If
            End If
            Call ativar
            Call clientes
            Call por
End Sub

Private Sub cmdNovo_Click()
            Call desativar
            mskCel = Clear
            mskCep = Clear
            mskRg = Clear
            mskCPF = Clear
            mskCod = Clear
            mskTel = Clear
       
           
            mskdtnasc.Value = Date
            
            txtNome = Clear
            txtLog = Clear
            txtNumero = Clear
            txtBairro = Clear
            txtCidade = Clear
            txtNFantasia = Clear
            mskCNPJ = Clear
            optm = False
            optf = False
            Option1 = False
            Option2 = False
                 Call ativar
            
        
End Sub

Private Sub cmdUlt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o ultimo Registro"
pctNav.Visible = True
pctluxus.Visible = False
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




Private Sub Command1_Click()
Call Tirar
            Call desativar
            If mskCPF = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from clientes where cpf= '" & mskCPF & "'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            Else
            MsgBox "Cpf Inexistente", vbCritical
            End If
            End If
            Call ativar
             Call clientes
          Call por

End Sub

Private Sub flexClientes_Click()
             Call desativar
             mskCod = flexClientes.TextMatrix(flexClientes.Row, 0)
            cmdBuscCod = True
            Call ativar
            Frame2.Visible = True
            frame1.Visible = False
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
Call clientes
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            SendKeys "{Tab}"
            End If

End Sub


Private Sub Form_Load()

            
             actskin.ApplySkin Me.hWnd
             actskin2.ApplySkin (cmdSalvar.hWnd)
             actskin2.ApplySkin (cmdnovo.hWnd)
             actskin2.ApplySkin (cmdExclu.hWnd)
             actskin2.ApplySkin (TabStrip1.hWnd)
            actskin2.ApplySkin (Frame5.hWnd)
           Option1 = True
           mskdtnasc.Value = Date
            Call clientes
           
            
           
            
End Sub
Private Sub carregar_lista()
 With flexClientes
            
            Dim cont1 As Integer
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
            .TextMatrix(cont1, 2) = Format(tabelas!telefone, "(##) ####-####")
            .TextMatrix(cont1, 3) = Format(tabelas!Celular, "(##) ####-####")
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
            .TextMatrix(cont1, 2) = Format(tabelas!telefone, "(##) ####-####")
            .TextMatrix(cont1, 3) = Format(tabelas!Celular, "(##) ####-####")
            Else
            cont1 = Clear
            End If
            Wend
            
             End If
            End With
           
End Sub

Private Sub Form_Unload(Cancel As Integer)
            If tabelas.State = adStateOpen Then tabelas.Close
End Sub

Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
End Sub

Private Sub Frame2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
End Sub

Private Sub Label6_Click()

End Sub

Private Sub mskCod_LostFocus()
            cmdBuscCod = True
End Sub

Private Sub mostrar()
            mskCod = tabelas!codigo
            navegaçao = tabelas!codigo
            txtNome = tabelas!nome
            mskCel = tabelas!Celular
            txtLog = tabelas!logradouro
            txtNumero = tabelas!numero
            txtBairro = tabelas!bairro
            txtCidade = tabelas!cidade
            txtUF = tabelas!uf
            mskCep = tabelas!cep
            mskRg = tabelas!rg
            mskTel = tabelas!telefone
            txtNFantasia = tabelas!Nomefantasia
            mskCNPJ = IIf(IsNull(tabelas!cnpj), "", tabelas!cnpj)
            mskCPF = IIf(IsNull(tabelas!cpf), "", tabelas!cpf)
            If mskCPF <> Empty Then Option1 = True Else Option2 = True
            If mskCPF = Empty And mskCNPJ = Empty Then Option1 = True
            
            mskdtnasc.Value = tabelas!dtnasc
      
            
           
            
            
                                
End Sub


Private Sub mskRg_LostFocus()
mskRg.PromptInclude = False
mskRg = Replace(mskRg, "'", Chr(63))
mskRg.PromptInclude = True

End Sub

Private Sub Option1_Click()
eee.Caption = "Nome"
www.Caption = "CPF"
txtNFantasia.Visible = False
asdf.Visible = False
mskCPF.Visible = True
mskCNPJ.Visible = False
z.Visible = True
x.Visible = True
mskdtnasc.Visible = True
mskRg.Visible = True
cmdBuscRg.Visible = True
cmdBuscar_CNPJ_Cliente.Visible = False
Command1.Visible = True
End Sub

Private Sub Option2_Click()
eee.Caption = "Razao Social"
www.Caption = "CNPJ"
txtNFantasia.Visible = True
asdf.Visible = True
mskCPF.Visible = False
mskCNPJ.Visible = True
z.Visible = False
x.Visible = False
mskdtnasc.Visible = False
mskRg.Visible = False
cmdBuscRg.Visible = False
cmdBuscar_CNPJ_Cliente.Visible = True
Command1.Visible = False
End Sub

Private Sub TabStrip1_Click()
Select Case TabStrip1.SelectedItem.Index
Case Is = 1
frame1.Visible = False
Frame2.Visible = True
Case Is = 2
frame1.Visible = True
Frame2.Visible = False
End Select
Call carregar_lista
End Sub

Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub


            

Private Sub txtbuscas_Change()
            If cmbBusca = "Nome" Then
             tabelas.Close
             tabelas.Open "select * from clientes where nome like '" & Replace(txtbuscas, "'", "''") & "%' order by codigo"
              Call carregar_lista
            ElseIf cmbBusca = "Telefone" Then
             tabelas.Close
             tabelas.Open "select * from clientes where telefone like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "Celular" Then
            tabelas.Close
             tabelas.Open "select * from clientes where celular like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            End If
End Sub

