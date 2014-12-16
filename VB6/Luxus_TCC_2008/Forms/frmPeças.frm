VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmPeças 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Peças"
   ClientHeight    =   7245
   ClientLeft      =   4200
   ClientTop       =   2115
   ClientWidth     =   8790
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7245
   ScaleWidth      =   8790
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   120
      ScaleHeight     =   675
      ScaleWidth      =   8655
      TabIndex        =   46
      Top             =   7200
      Width           =   8655
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmPeças.frx":0000
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   52
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPeças.frx":0CCA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   51
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPeças.frx":1594
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   50
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPeças.frx":225E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   49
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmPeças.frx":2F28
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   48
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmPeças.frx":37F2
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   47
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
         TabIndex        =   53
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Height          =   5895
      Left            =   -7200
      TabIndex        =   39
      Top             =   1440
      Visible         =   0   'False
      Width           =   8535
      Begin VB.Frame Frame4 
         Caption         =   "Busca"
         Height          =   855
         Left            =   240
         TabIndex        =   40
         Top             =   240
         Width           =   4095
         Begin VB.TextBox txtbuscas 
            Height          =   315
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   42
            Top             =   360
            Width           =   2175
         End
         Begin VB.ComboBox cmbBusca 
            Height          =   315
            ItemData        =   "frmPeças.frx":3D7C
            Left            =   240
            List            =   "frmPeças.frx":3D86
            TabIndex        =   41
            Text            =   "Nome"
            Top             =   360
            Width           =   1455
         End
      End
      Begin MSFlexGridLib.MSFlexGrid flexClientes 
         Height          =   4455
         Left            =   1680
         TabIndex        =   43
         Top             =   1320
         Width           =   5055
         _ExtentX        =   8916
         _ExtentY        =   7858
         _Version        =   393216
         Cols            =   3
         BackColorFixed  =   14737632
         BackColorBkg    =   16777215
         FormatString    =   "Codigo            | Nome                                     |Matrerial                   "
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
      Height          =   6015
      Left            =   120
      TabIndex        =   5
      Top             =   960
      Width           =   8535
      Begin VB.TextBox txtDescriçao 
         Height          =   1335
         Left            =   600
         MultiLine       =   -1  'True
         TabIndex        =   56
         Top             =   3720
         Width           =   2775
      End
      Begin VB.TextBox txtValor 
         Height          =   375
         Left            =   1440
         TabIndex        =   54
         Top             =   3000
         Width           =   1815
      End
      Begin VB.TextBox txtNome 
         Height          =   375
         Left            =   1440
         TabIndex        =   44
         Top             =   2640
         Width           =   1815
      End
      Begin VB.TextBox txtComp 
         Height          =   375
         Left            =   1440
         TabIndex        =   33
         Top             =   1920
         Width           =   1815
      End
      Begin VB.TextBox txtMat 
         Height          =   375
         Left            =   1440
         TabIndex        =   31
         Top             =   2280
         Width           =   1815
      End
      Begin VB.TextBox txtAltura 
         Height          =   375
         Left            =   1440
         TabIndex        =   30
         Top             =   1200
         Width           =   1815
      End
      Begin VB.TextBox txtLargura 
         Height          =   375
         Left            =   1440
         TabIndex        =   28
         Top             =   1560
         Width           =   1815
      End
      Begin VB.Frame Frame3 
         Height          =   735
         Left            =   600
         TabIndex        =   19
         Top             =   5160
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
            Picture         =   "frmPeças.frx":3D9A
            TabIndex        =   23
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
            Picture         =   "frmPeças.frx":41DC
            TabIndex        =   22
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
            Picture         =   "frmPeças.frx":461E
            TabIndex        =   21
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
            Picture         =   "frmPeças.frx":4A60
            TabIndex        =   20
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Frame Frame9 
         Caption         =   "Fornecedores"
         Height          =   4575
         Left            =   3600
         TabIndex        =   11
         Top             =   360
         Width           =   4815
         Begin VB.CommandButton cmdaddLista 
            Caption         =   "Add"
            Height          =   375
            Left            =   120
            TabIndex        =   27
            Top             =   1680
            Width           =   855
         End
         Begin VB.CommandButton cmdRlista 
            Caption         =   "Remover"
            Height          =   375
            Left            =   1080
            TabIndex        =   26
            Top             =   1680
            Width           =   855
         End
         Begin VB.TextBox txtNomeFor 
            Height          =   375
            Left            =   960
            TabIndex        =   25
            Top             =   600
            Width           =   1935
         End
         Begin VB.PictureBox mouse2 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   3360
            ScaleHeight     =   615
            ScaleWidth      =   675
            TabIndex        =   18
            Top             =   480
            Width           =   675
            Begin VB.Image imgMouse2 
               Height          =   615
               Left            =   0
               MouseIcon       =   "frmPeças.frx":4EA2
               MousePointer    =   99  'Custom
               Picture         =   "frmPeças.frx":51AC
               Stretch         =   -1  'True
               Top             =   0
               Width           =   675
            End
         End
         Begin VB.PictureBox imgBuscar2 
            BorderStyle     =   0  'None
            Height          =   855
            Left            =   3240
            ScaleHeight     =   855
            ScaleWidth      =   855
            TabIndex        =   17
            Top             =   360
            Visible         =   0   'False
            Width           =   855
            Begin VB.Image Image1 
               Height          =   855
               Left            =   0
               MouseIcon       =   "frmPeças.frx":114EE
               MousePointer    =   99  'Custom
               Picture         =   "frmPeças.frx":117F8
               Stretch         =   -1  'True
               Top             =   0
               Width           =   945
            End
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Buscar"
            Height          =   255
            Left            =   1920
            TabIndex        =   16
            Top             =   240
            Width           =   615
         End
         Begin VB.TextBox txtPreço 
            Height          =   375
            Left            =   960
            TabIndex        =   14
            Top             =   1080
            Width           =   1095
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "frmPeças.frx":1DB3A
            TabIndex        =   12
            Top             =   600
            Width           =   975
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "frmPeças.frx":1DBA0
            TabIndex        =   13
            Top             =   240
            Width           =   855
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "frmPeças.frx":1DC0A
            TabIndex        =   15
            Top             =   1080
            Width           =   855
         End
         Begin MSFlexGridLib.MSFlexGrid FlexItens 
            Height          =   2295
            Left            =   120
            TabIndex        =   24
            Top             =   2160
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   4048
            _Version        =   393216
            Cols            =   3
            ForeColor       =   0
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            FormatString    =   "Cod fornecedor |Nome Fornecedor             |Preço                 "
         End
         Begin MSMask.MaskEdBox mskCodfor 
            Height          =   375
            Left            =   960
            TabIndex        =   37
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
      Begin VB.CommandButton cmdExclu 
         Caption         =   "Excluir"
         Height          =   495
         Left            =   4320
         TabIndex        =   9
         Top             =   5280
         Width           =   975
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   495
         Left            =   5280
         TabIndex        =   8
         Top             =   5280
         Width           =   1095
      End
      Begin VB.CommandButton cmdnovo 
         Caption         =   "Novo"
         Height          =   495
         Left            =   3360
         TabIndex        =   7
         Top             =   5280
         Width           =   975
      End
      Begin VB.CommandButton cmdBusca 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   2040
         TabIndex        =   1
         Top             =   360
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   375
         Left            =   360
         OleObjectBlob   =   "frmPeças.frx":1DC72
         TabIndex        =   6
         Top             =   1560
         Width           =   2055
      End
      Begin MSMask.MaskEdBox mskcod 
         Height          =   375
         Left            =   1080
         TabIndex        =   10
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
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   255
         Left            =   600
         OleObjectBlob   =   "frmPeças.frx":1DCDE
         TabIndex        =   29
         Top             =   1200
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   255
         Left            =   360
         OleObjectBlob   =   "frmPeças.frx":1DD48
         TabIndex        =   32
         Top             =   2280
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
         Height          =   375
         Left            =   600
         OleObjectBlob   =   "frmPeças.frx":1DDB6
         TabIndex        =   34
         Top             =   1920
         Width           =   1455
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmPeças.frx":1DE1C
         TabIndex        =   35
         Top             =   3360
         Width           =   1695
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmPeças.frx":1DE8C
         TabIndex        =   36
         Top             =   360
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
         Height          =   255
         Left            =   600
         OleObjectBlob   =   "frmPeças.frx":1DEF6
         TabIndex        =   45
         Top             =   2640
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
         Height          =   255
         Left            =   600
         OleObjectBlob   =   "frmPeças.frx":1DF5C
         TabIndex        =   55
         Top             =   3000
         Width           =   855
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   8175
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   0
         Top             =   0
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmPeças.frx":1DFC4
         TabIndex        =   2
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   5280
         OleObjectBlob   =   "frmPeças.frx":1E026
         TabIndex        =   3
         Top             =   120
         Width           =   2055
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmPeças.frx":1E08E
         TabIndex        =   4
         Top             =   120
         Width           =   1455
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   6615
      Left            =   0
      TabIndex        =   38
      Top             =   600
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   11668
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
   Begin VB.Menu mnuFor 
      Caption         =   "menu"
      Visible         =   0   'False
      Begin VB.Menu mnuConsForn 
         Caption         =   "Consultar Fornecedor"
      End
      Begin VB.Menu mnuexc 
         Caption         =   "Excluir"
      End
   End
End
Attribute VB_Name = "frmPeças"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As Integer
Dim b As Integer
Dim navegaçao As Integer
Dim linha As Integer

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
Call Tirar
      mskCod.PromptInclude = False
      mskCodfor.PromptInclude = False
      Call por
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
            .TextMatrix(cont1, 2) = tabelas!material
           
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
           .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
            .TextMatrix(cont1, 2) = tabelas!material

            Else
            cont1 = Clear
            End If
            Wend
            
             End If
            End With
           
End Sub



Private Sub cmdaddLista_Click()
Call desativar
If txtpreço = Empty Then
MsgBox "Digite um valor", vbExclamation
Exit Sub
End If

If mskCodfor = Empty Then
MsgBox "Digite um codigo", vbExclamation
Exit Sub
End If

If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from fornecedores where codigo=" & mskCodfor
If tabelas2.EOF = True Or tabelas2.BOF = True Then
MsgBox "Este Fornecedor não e Valido", vbExclamation
tabelas2.Close
Exit Sub
End If
tabelas2.Close
Command1 = True
Call desativar

tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from fornecedores where codigo=" & mskCodfor
If tabelas2.EOF = True Or tabelas2.BOF = True Then
MsgBox "Este fornecedor não e Valido", vbExclamation
tabelas2.Close
Exit Sub
End If
tabelas2.Close
Command1 = True
Call desativar

With FlexItens
Dim cont As Integer
cont = 1
While cont < .Rows
If mskCodfor = .TextMatrix(cont, 0) Then
MsgBox "Este fornecedor ja esta na lista!", vbInformation
Exit Sub
End If
cont = cont + 1
Wend


.Rows = .Rows + 1
linha = linha + 1
.TextMatrix(linha, 0) = mskCodfor
.TextMatrix(linha, 1) = txtNomeFor
.TextMatrix(linha, 2) = txtpreço

If .TextMatrix(.Rows - 1, 0) = Empty Then .Rows = .Rows - 1
End With


Call ativar

End Sub




Private Sub cmdBusca_Pedido_Click()

End Sub

Private Sub cmdbusca_Click()
Call Tirar
            Call desativar
            If mskCod = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from peças where codigo=" & mskCod
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            End If
            End If
            Call ativar
             Call Peças
          Call por
            
End Sub

Private Sub cmdRlista_Click()
If FlexItens.TextMatrix(1, 0) = "" Then
MsgBox "Nao a itens a serem excluidos", vbInformation
Exit Sub
End If
FlexItens.Rows = FlexItens.Rows + 1
If FlexItens.Rows > 3 Then
FlexItens.Row = FlexItens.Rows - 1
End If
FlexItens.RemoveItem (FlexItens.Row)
If FlexItens.Rows > 2 Then FlexItens.Rows = FlexItens.Rows - 1
linha = linha - 1
End Sub




Private Sub ativar()
         mskCod.PromptInclude = True
         mskCodfor.PromptInclude = True
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


Private Sub cmdExclu_Click()
           Call desativar
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If mskCod = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
           On Error GoTo d
           conecta.Execute "delete * from peças where codigo=" & mskCod
           cmdNovo = True
           status = "excluidos"
           Call crash1
           navegaçao = Clear
           Call Peças
           End If
           End If
           Call ativar
         Exit Sub
d:
MsgBox "Este Designer não pode ser excluido pois ja possui um historico", vbExclamation
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
        If txtNome = Empty Or txtMat = Empty Or txtLargura = Empty Or txtComp = Empty Or txtAltura = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        
     'codigo autometico
        If mskCod = Empty Then
        If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 10
        While b = Empty
        tabelas.Close
        tabelas.Open "select * from peças where codigo=" & a
        If tabelas.BOF = False Or tabelas.EOF = False Then
        a = a + 1
        Else
        b = 1
        Call Pedidos
        End If
        Wend
        Else
        a = 10
        End If
        mskCod = a
        b = Clear
        End If
         
        tabelas.Close
        tabelas.Open "select * from peças where codigo=" & mskCod
        If tabelas.BOF = False Or tabelas.EOF = False Then
        If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
        status = "alteradas"
         conecta.Execute "delete * from preços where codpe=" & mskCod
        Call salvar
        Call salvar_itens
        End If
        Else
        status = "salvas"
         conecta.Execute "delete * from preços where codpe=" & mskCod
        Call salvar
        Call salvar_itens
        
        End If
        End If
        
        
        
      
        Call ativar
        
End Sub

Private Sub salvar_itens()
        Dim cont As Integer
        
        Call Preços
       
        While cont < FlexItens.Rows - 1
        cont = cont + 1
        tabelas.AddNew
        tabelas!codpe = mskCod
        tabelas!codFor = FlexItens.TextMatrix(cont, 0)
        tabelas!Preço = Replace(FlexItens.TextMatrix(cont, 2), "R$ ", "")
            tabelas.Update
        Wend
        Call Peças

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
            End If
            tabelas2.Close
            End If
            Call ativar
End Sub

Private Sub cmdNovo_Click()
          Call desativar
      mskCod = Clear
      txtAltura = Clear
      txtComp = Clear
      txtLargura = Clear
      txtDescriçao.Text = Clear
      txtMat = Clear
      mskCodfor = Clear
      txtNomeFor = Clear
      txtpreço = Clear
      txtNome = Clear
      FlexItens.Clear
      txtValor = Clear
         FlexItens.FormatString = "Cod fornecedor |Nome Fornecedor             |Preço                 "
         FlexItens.Rows = 2
         linha = Clear
             Call ativar
            
        
End Sub

Private Sub cmdUlt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o ultimo Registro"
pctNav.Visible = True
pctluxus.Visible = False
End Sub


Private Sub Command1_Click()
             Call desativar
            If mskCodfor = Empty Then
            Else
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from fornecedores  where codigo=" & mskCodfor
            If tabelas2.BOF = False Or tabelas2.EOF = False Then
            txtNomeFor = tabelas2!razaosocial
            End If
            tabelas2.Close
            End If
            Call ativar
           
End Sub

Private Sub flexClientes_Click()
              Call desativar
             mskCod = flexClientes.TextMatrix(flexClientes.Row, 0)
            cmdBusca = True
            Call ativar
            Frame2.Visible = True
            Frame1.Visible = False
            TabStrip1.MultiSelect = True
            actskin2.ApplySkin (TabStrip1.hWnd)
            txtbuscas = Clear
End Sub

Private Sub FlexItens_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
If Not FlexItens.TextMatrix(1, 0) = Empty Then
If Button = vbRightButton Then
PopupMenu mnuFor


End If
End If
End Sub

Private Sub Form_Activate()
Call Peças
End Sub


Private Sub salvar()
If status = "salvas" Then
Call estoque
tabelas.AddNew
tabelas!codigo = mskCod
tabelas!qtd_min = 0
tabelas!qtd_min = 0
tabelas!Qtd_atual = 0
tabelas!local = "?"
tabelas.Update
Call Peças
tabelas.AddNew
End If
tabelas!codigo = mskCod
navegaçao = mskCod
tabelas!Altura = txtAltura
tabelas!preço_venda = Replace(txtValor, "R$ ", "")
tabelas!largura = txtLargura
tabelas!comprimento = txtComp
tabelas!material = txtMat
tabelas!Descriçao = txtDescriçao.Text
tabelas!nome = txtNome
tabelas.Update
Call crash1
Call Peças
status = Clear
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
           
            actskin2.ApplySkin (cmdaddLista.hWnd)
            actskin2.ApplySkin (cmdRlista.hWnd)
             actskin2.ApplySkin (TabStrip1.hWnd)
             actskin2.ApplySkin (Frame5.hWnd)
         
            
        
            Call Peças
           
            
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
           
End Sub

Private Sub Frame2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
                                  
mouse2.Visible = True
imgBuscar2.Visible = False

End Sub


Private Sub mostrar()
Call desativar
 mskCod = tabelas!codigo
      txtAltura = tabelas!Altura
      txtComp = tabelas!comprimento
      txtLargura = tabelas!largura
      txtDescriçao.Text = tabelas!Descriçao
      txtValor = tabelas!preço_venda
      txtMat = tabelas!material
      txtNome = tabelas!nome
      tabelas3.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic

      
      FlexItens.Clear
FlexItens.Rows = 2
FlexItens.FormatString = "Cod fornecedor |Nome Fornecedor             |Preço                 "
tabelas2.Open "itens_vendas", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from preços where codpe=" & mskCod
Dim cont As Integer
cont = 1
While tabelas2.EOF = False
FlexItens.TextMatrix(cont, 0) = tabelas2!codFor

tabelas3.Close
tabelas3.Open "select * from fornecedores where codigo =" & tabelas2!codFor
FlexItens.TextMatrix(cont, 1) = tabelas3!razaosocial

FlexItens.TextMatrix(cont, 2) = Format(tabelas2!Preço, "R$ #,##0.00;(R$#,##0.00)")
cont = cont + 1
FlexItens.Rows = FlexItens.Rows + 1
tabelas2.MoveNext
Wend
FlexItens.Rows = FlexItens.Rows - 1
tabelas2.Close
tabelas3.Close
Call ativar
linha = FlexItens.Rows - 1
End Sub




Private Sub Frame7_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
                       mouse1.Visible = True
imgBuscar.Visible = False
mouse2.Visible = True
imgBuscar2.Visible = False
End Sub


Private Sub Frame9_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
   pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
                                  
mouse2.Visible = True
imgBuscar2.Visible = False

End Sub




Private Sub imgMouse_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse1.Visible = False
imgBuscar.Visible = True
End Sub

Private Sub Image1_Click()
Me.Enabled = False
frmB5.Show
End Sub

Private Sub imgMouse2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse2.Visible = False
imgBuscar2.Visible = True
End Sub




Private Sub mnuConsForn_Click()
frmForneced.Show
frmForneced.mskCod.PromptInclude = False
frmForneced.mskCod = FlexItens.TextMatrix(FlexItens.Row, 0)
frmForneced.mskCod.PromptInclude = True
frmForneced.cmdBuscCod = True

End Sub

Private Sub mnuExc_Click()
If FlexItens.TextMatrix(1, 0) = "" Then
MsgBox "Nao a itens a serem excluidos", vbInformation
Exit Sub
End If
If MsgBox("Deseja excluir da lista o item: " & FlexItens.TextMatrix(FlexItens.Row, 1), vbQuestion + vbYesNo + vbDefaultButton2) = vbYes Then
FlexItens.Rows = FlexItens.Rows + 1
FlexItens.RemoveItem (FlexItens.Row)
linha = linha - 1
If FlexItens.Rows > 2 Then FlexItens.Rows = FlexItens.Rows - 1
End If

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

Private Sub mskCodfor_LostFocus()
Command1 = True
End Sub

Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub



Private Sub txtbuscas_Change()
              If cmbBusca = "Nome" Then
            tabelas.Close
            tabelas.Open "select * from peças where nome like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "Material" Then
             tabelas.Close
             tabelas.Open "select * from peças where Material like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            End If
End Sub





Private Sub txtPreço_LostFocus()
txtpreço = Format(txtpreço, "R$ #,##0.00;(R$#,##0.00)")
End Sub


Private Sub txtValor_LostFocus()
txtValor = Format(txtValor, "R$ #,##0.00;(R$#,##0.00)")

End Sub
