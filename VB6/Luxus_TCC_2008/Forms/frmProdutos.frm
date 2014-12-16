VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmProdutos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Produtos"
   ClientHeight    =   6810
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   8175
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6810
   ScaleWidth      =   8175
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   120
      ScaleHeight     =   675
      ScaleWidth      =   8175
      TabIndex        =   50
      Top             =   7440
      Width           =   8175
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmProdutos.frx":0000
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   56
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmProdutos.frx":0CCA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   55
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmProdutos.frx":1594
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   54
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmProdutos.frx":225E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   53
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmProdutos.frx":2F28
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   52
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmProdutos.frx":37F2
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   51
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
         TabIndex        =   57
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
      Height          =   5655
      Left            =   120
      TabIndex        =   13
      Top             =   1080
      Width           =   7935
      Begin VB.Frame Frame3 
         Height          =   735
         Left            =   4200
         TabIndex        =   39
         Top             =   3720
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
            Picture         =   "frmProdutos.frx":3D7C
            TabIndex        =   43
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
            Picture         =   "frmProdutos.frx":41BE
            TabIndex        =   42
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
            Picture         =   "frmProdutos.frx":4600
            TabIndex        =   41
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
            Picture         =   "frmProdutos.frx":4A42
            TabIndex        =   40
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Frame Frame8 
         Height          =   855
         Left            =   120
         TabIndex        =   29
         Top             =   2880
         Width           =   7575
         Begin VB.TextBox Text1 
            Height          =   375
            Left            =   5040
            TabIndex        =   60
            Top             =   360
            Width           =   735
         End
         Begin VB.ComboBox cmbCor 
            Height          =   315
            ItemData        =   "frmProdutos.frx":4E84
            Left            =   6240
            List            =   "frmProdutos.frx":4E86
            Style           =   2  'Dropdown List
            TabIndex        =   44
            Top             =   360
            Width           =   1215
         End
         Begin VB.TextBox txtNome 
            Height          =   375
            Left            =   240
            TabIndex        =   35
            Top             =   360
            Width           =   2175
         End
         Begin VB.TextBox txtpreço 
            Height          =   375
            Left            =   2640
            Locked          =   -1  'True
            TabIndex        =   30
            Top             =   360
            Width           =   2175
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
            Height          =   375
            Left            =   2400
            OleObjectBlob   =   "frmProdutos.frx":4E88
            TabIndex        =   31
            Top             =   120
            Width           =   1095
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
            Height          =   375
            Left            =   120
            OleObjectBlob   =   "frmProdutos.frx":4EF0
            TabIndex        =   36
            Top             =   120
            Width           =   1095
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
            Height          =   375
            Left            =   6120
            OleObjectBlob   =   "frmProdutos.frx":4F56
            TabIndex        =   45
            Top             =   120
            Width           =   1095
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel16 
            Height          =   255
            Left            =   6000
            OleObjectBlob   =   "frmProdutos.frx":4FBA
            TabIndex        =   46
            Top             =   120
            Width           =   255
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
            Height          =   375
            Left            =   4920
            OleObjectBlob   =   "frmProdutos.frx":501A
            TabIndex        =   61
            Top             =   120
            Width           =   1095
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Busca"
         Height          =   735
         Left            =   1800
         TabIndex        =   24
         Top             =   360
         Width           =   3495
         Begin VB.CommandButton cmdBuscar_Codigo 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   2760
            TabIndex        =   27
            Top             =   240
            Width           =   615
         End
         Begin VB.TextBox mskCod_Busca 
            BackColor       =   &H00FFFFFF&
            Height          =   375
            Left            =   1200
            TabIndex        =   26
            Top             =   240
            Width           =   1455
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
            Height          =   375
            Left            =   240
            OleObjectBlob   =   "frmProdutos.frx":5086
            TabIndex        =   25
            Top             =   240
            Width           =   855
         End
      End
      Begin VB.TextBox mskCodigo 
         BackColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   23
         Top             =   600
         Width           =   1455
      End
      Begin VB.Frame Frame6 
         Caption         =   "Modelos"
         Height          =   1575
         Left            =   120
         TabIndex        =   18
         Top             =   1200
         Width           =   7575
         Begin VB.TextBox txtPC 
            Height          =   375
            Left            =   2640
            Locked          =   -1  'True
            TabIndex        =   58
            Top             =   1080
            Width           =   2175
         End
         Begin VB.TextBox txtTipo 
            Height          =   375
            Left            =   240
            Locked          =   -1  'True
            TabIndex        =   47
            Top             =   1080
            Width           =   2175
         End
         Begin VB.PictureBox imgBuscar 
            BorderStyle     =   0  'None
            Height          =   855
            Left            =   6120
            ScaleHeight     =   855
            ScaleWidth      =   915
            TabIndex        =   38
            Top             =   360
            Visible         =   0   'False
            Width           =   915
            Begin VB.Image Image2 
               Height          =   855
               Left            =   0
               MouseIcon       =   "frmProdutos.frx":50F0
               MousePointer    =   99  'Custom
               Picture         =   "frmProdutos.frx":53FA
               Stretch         =   -1  'True
               Top             =   0
               Width           =   915
            End
         End
         Begin VB.PictureBox mouse1 
            BorderStyle     =   0  'None
            Height          =   615
            Left            =   6240
            ScaleHeight     =   615
            ScaleWidth      =   675
            TabIndex        =   37
            Top             =   480
            Width           =   675
            Begin VB.Image imgMouse 
               Height          =   615
               Left            =   0
               MouseIcon       =   "frmProdutos.frx":1173C
               MousePointer    =   99  'Custom
               Picture         =   "frmProdutos.frx":11A46
               Stretch         =   -1  'True
               Top             =   0
               Width           =   675
            End
         End
         Begin VB.CommandButton cmdBuscar_Modelo 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   5160
            TabIndex        =   32
            Top             =   480
            Width           =   615
         End
         Begin VB.CommandButton cmdBuscar_Codigo_Modelo 
            Caption         =   "Buscar"
            Height          =   375
            Left            =   1200
            TabIndex        =   28
            Top             =   480
            Width           =   615
         End
         Begin VB.TextBox txtNome_modelo 
            Height          =   375
            Left            =   2040
            TabIndex        =   19
            Top             =   480
            Width           =   3015
         End
         Begin MSMask.MaskEdBox mskCodMod 
            Height          =   375
            Left            =   240
            TabIndex        =   20
            Top             =   480
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
            Height          =   255
            Left            =   1920
            OleObjectBlob   =   "frmProdutos.frx":1DD88
            TabIndex        =   21
            Top             =   240
            Width           =   2655
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "frmProdutos.frx":1DDF2
            TabIndex        =   22
            Top             =   240
            Width           =   735
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel17 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "frmProdutos.frx":1DE5C
            TabIndex        =   34
            Top             =   480
            Width           =   255
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "frmProdutos.frx":1DEBC
            TabIndex        =   48
            Top             =   840
            Width           =   1695
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
            Height          =   255
            Left            =   2520
            OleObjectBlob   =   "frmProdutos.frx":1DF22
            TabIndex        =   59
            Top             =   840
            Width           =   1695
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   7920
         Top             =   600
      End
      Begin VB.CommandButton cmdExclu 
         Caption         =   "Excluir"
         Height          =   495
         Left            =   3840
         TabIndex        =   1
         Top             =   4680
         Width           =   1095
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   495
         Left            =   4920
         TabIndex        =   2
         Top             =   4680
         Width           =   1095
      End
      Begin VB.CommandButton cmdnovo 
         Caption         =   "Novo"
         Height          =   495
         Left            =   6000
         TabIndex        =   3
         Top             =   4680
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   255
         Left            =   3240
         OleObjectBlob   =   "frmProdutos.frx":1DF9C
         TabIndex        =   14
         Top             =   3720
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmProdutos.frx":1DFFA
         TabIndex        =   15
         Top             =   360
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmProdutos.frx":1E064
         TabIndex        =   17
         Top             =   3720
         Width           =   1695
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel13 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmProdutos.frx":1E0D4
         TabIndex        =   33
         Top             =   1800
         Width           =   255
      End
      Begin RichTextLib.RichTextBox txtDescriçao 
         Height          =   1455
         Left            =   120
         TabIndex        =   49
         Top             =   3960
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   2566
         _Version        =   393217
         Enabled         =   -1  'True
         TextRTF         =   $"frmProdutos.frx":1E134
      End
   End
   Begin VB.Frame Frame1 
      Height          =   5655
      Left            =   120
      TabIndex        =   8
      Top             =   1080
      Visible         =   0   'False
      Width           =   7935
      Begin VB.Frame Frame4 
         Caption         =   "Busca"
         Height          =   855
         Left            =   240
         TabIndex        =   9
         Top             =   240
         Width           =   4095
         Begin VB.ComboBox cmbBusca 
            Height          =   315
            ItemData        =   "frmProdutos.frx":1E1B6
            Left            =   240
            List            =   "frmProdutos.frx":1E1C0
            TabIndex        =   11
            Text            =   "Nome"
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtbuscas 
            Height          =   315
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   10
            Top             =   360
            Width           =   2175
         End
      End
      Begin MSFlexGridLib.MSFlexGrid flexClientes 
         Height          =   4455
         Left            =   1080
         TabIndex        =   16
         Top             =   1200
         Width           =   5895
         _ExtentX        =   10398
         _ExtentY        =   7858
         _Version        =   393216
         Cols            =   4
         BackColorFixed  =   14737632
         BackColorBkg    =   16777215
         FormatString    =   "Codigo           | Nome                                         |Tipo                   | Cor              "
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   6135
      Left            =   0
      TabIndex        =   7
      Top             =   720
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   10821
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
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8175
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmProdutos.frx":1E1D2
         TabIndex        =   4
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   5280
         OleObjectBlob   =   "frmProdutos.frx":1E234
         TabIndex        =   5
         Top             =   120
         Width           =   2055
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmProdutos.frx":1E2A2
         TabIndex        =   6
         Top             =   120
         Width           =   1455
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "frmProdutos.frx":1E310
      TabIndex        =   12
      Top             =   1920
      Width           =   735
   End
End
Attribute VB_Name = "frmProdutos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As Integer
Dim b As Integer
Dim navegaçao As String
Dim tipo As String
Dim cor As String
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



Private Sub cmbCor_Click()
tabelas2.Open "cores", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from cores where nome = '" & cmbCor & "'"
If tabelas2.EOF = False And tabelas2.BOF = False Then
cor = tabelas2!Sigla
End If
tabelas2.Close
End Sub

Private Sub cmdAnt_Click()
             Call desativar
             If mskCodigo = Empty Then
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


Private Sub cmdAnt_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblh.Caption = "Exibe o Registro anterior"
pctNav.Visible = True
pctluxus.Visible = False

End Sub

Private Sub cmdBuscar_Codigo_Click()
            Call desativar
            
            If mskCod_Busca = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from produtos  where codigo= '" & mskCod_Busca.Text & "'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            
            End If
            End If
            Call ativar
            Call Produtos
            
          
            
End Sub






Private Sub cmdBuscar_Codigo_Modelo_Click()
            Call desativar
            If mskCodMod = Empty Then
            Else
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "M_designe", conecta, adOpenKeyset, adLockOptimistic
        
            tabelas2.Close
            tabelas2.Open "select * from M_designe where Codigo=" & mskCodMod
            If tabelas2.BOF = False Or tabelas2.EOF = False Then
            mskCodMod = tabelas2!codigo
            txtNome_modelo = tabelas2!modelo
            txtTipo = tabelas2!tipo
            txtPC = Format(tabelas2!preço_cust, "R$ #,##0.00")
            tabelas2.Close
   
            tabelas2.Open "tipos", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from tipos where nome = '" & txtTipo & "'"
            If tabelas2.EOF = False And tabelas2.BOF = False Then
            tipo = tabelas2!Sigla
            End If
            tabelas2.Close
            
            End If
            End If
            Call ativar
            
          
End Sub

Private Sub cmdExclu_Click()
           Call desativar
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If mskCodigo = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
           On Error GoTo d
           conecta.Execute "delete * from Produtos where codigo='" & mskCodigo & "'"
           cmdnovo = True
           status = "excluidos"
           Call crash1
           navegaçao = Clear
           Call Produtos
           End If
           End If
           Call ativar
           Exit Sub
d:
MsgBox "Este Produto não pode ser excluido pois ja possui um historico", vbExclamation
End Sub

Private Sub cmdExclu_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblh.Caption = "Exclui um Registro"
pctExcluir.Visible = True
pctluxus.Visible = False
pctNovo.Visible = False
pctSalvar.Visible = False
End Sub

Private Sub cmdnovo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
            MsgBox "NAO A CADASTROS", vbExclamation
            End If
            Call ativar
End Sub

Private Sub cmdPrim_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblh.Caption = "Exibe o primeiro Registro"
pctNav.Visible = True
pctluxus.Visible = False

End Sub

Private Sub cmdProx_Click()
            Call desativar
            
            If mskCodigo = Empty Then
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

Private Sub cmdProx_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblh.Caption = "Exibe o proximo Registro"
pctNav.Visible = True
pctluxus.Visible = False

End Sub

Private Sub cmdSalvar_Click()
        Call desativar
        If mskCodMod = Empty Or cmbCor.Text = Empty Or txtTipo = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        
        If tabelas2.State = adStateOpen Then tabelas2.Close
        tabelas2.Open "M_designe", conecta, adOpenKeyset, adLockOptimistic
        tabelas2.Close
        tabelas2.Open "select * from M_designe where codigo=" & mskCodMod
        If tabelas2.EOF = True Or tabelas2.BOF = True Then
        MsgBox "Este Modelo não e Valido", vbExclamation
        tabelas2.Close
        Exit Sub
        End If
        tabelas2.Close
        cmdBuscar_Codigo_Modelo = True
     Call desativar
        mskCodigo = tipo & mskCodMod & cor
         
        tabelas.Close
        tabelas.Open "select * from Produtos where codigo='" & mskCodigo & "'"
        If tabelas.BOF = False Or tabelas.EOF = False Then
        If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
        status = "alteradas"
        tabelas!codigo = mskCodigo
        Call salvar
        End If
        Else
        status = "salvas"
        Call salvar
        End If
        End If
        Call ativar
        
End Sub


Private Sub cmdSalvar_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
            MsgBox "NAO A CADASTROS", vbExclamation
            End If
            Call ativar
End Sub

            

Private Sub cmdBuscar_Modelo_Click()
            Call desativar
            If txtNome_modelo = Empty Then
            Else
            tabelas2.Open "M_designe", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from M_designe where modelo like '" & txtNome_modelo & "%'"
            If tabelas2.BOF = False Or tabelas2.EOF = False Then
            mskCodMod = tabelas2!codigo
            txtNome_modelo = tabelas2!modelo
            txtTipo = tabelas2!tipo
            txtPC = Format(tabelas2!preço_cust, "R$ #,##0.00")
            End If
            tabelas2.Close
            End If
            Call ativar
            
End Sub

Private Sub cmdNovo_Click()
          Call desativar
         mskCodigo = Clear
         mskCodMod = Clear
         mskCod_Busca = Clear
         txtNome_modelo = Clear
         txtPreço_compra = Clear
         txtCor = Clear
         txtpreço = Clear
         txtDescriçao.Text = Clear
         txtNome = Clear
         txtPC = Clear
             Call ativar
            
        
End Sub

Private Sub cmdUlt_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblh.Caption = "Exibe o ultimo Registro"
pctNav.Visible = True
pctluxus.Visible = False
End Sub





Private Sub flexClientes_Click()
             Call desativar
             mskCod_Busca = flexClientes.TextMatrix(flexClientes.Row, 0)
            cmdBuscar_Codigo = True
            Call ativar
            Frame2.Visible = True
            Frame1.Visible = False
            TabStrip1.MultiSelect = True
            actskin2.ApplySkin (TabStrip1.hWnd)
            txtbuscas = Clear
            
End Sub

Private Sub flexClientes_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 lblh.Caption = "Clique em um registro para levalo a outra aba"
            pctluxus.Visible = False
            pctBuscar.Visible = True
End Sub
Private Sub Form_Activate()
Call Produtos
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
             .TextMatrix(cont1, 3) = tabelas!cor
            
            tabelas2.Open "M_designe", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
            tabelas2.Open "select * from m_designe where codigo=" & tabelas!cod_modelo
            .TextMatrix(cont1, 2) = tabelas2!tipo
            tabelas2.Close
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!nome
             .TextMatrix(cont1, 3) = tabelas!cor
            
            tabelas2.Open "M_designe", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
            tabelas2.Open "select * from m_designe where codigo=" & tabelas!cod_modelo
            .TextMatrix(cont1, 2) = tabelas2!tipo
            tabelas2.Close
            Else
            cont1 = Clear
            End If
            Wend
            
             End If
            End With
           


           
End Sub

Private Sub salvar()
If status = "salvas" Then
tabelas.AddNew
End If
tabelas!codigo = mskCodigo
tabelas!cod_modelo = mskCodMod
tabelas!cor = cmbCor
tabelas!Preço = txtpreço
tabelas!Descriçao = txtDescriçao.Text
tabelas!nome = txtNome
tabelas.Update
Call crash1
Call Produtos
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
             actskin2.ApplySkin (cmdnovo.hWnd)
             actskin2.ApplySkin (cmdExclu.hWnd)
        
        
             actskin2.ApplySkin (Frame5.hWnd)
             actskin2.ApplySkin (TabStrip1.hWnd)
             
          
             
            
            
            Dim cont As Integer
        
            cont = Clear
            
            Call cores
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            cmbCor.AddItem (tabelas!nome)
            
            While cont = Empty
            tabelas.MoveNext
            If tabelas.EOF = False Then
            cmbCor.AddItem (tabelas!nome)
            Else
            cont = 1
            End If
            Wend
            
           End If
            
           
           
           
            
            Call Produtos
           Call carregar_lista
            
            
End Sub

Private Sub Form_Unload(Cancel As Integer)
            If tabelas.State = adStateOpen Then tabelas.Close
End Sub

Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
            pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
End Sub

Private Sub Frame2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
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


Private Sub mostrar()
mskCodigo = tabelas!codigo
mskCodMod = tabelas!cod_modelo
cmbCor.Text = tabelas!cor
txtpreço = Format(tabelas!Preço, "R$ #,##0.00;(R$#,##0.00)")
txtDescriçao.Text = tabelas!Descriçao
txtNome = tabelas!nome
cmdBuscar_Codigo_Modelo = True
            
Text1 = ((tabelas!Preço - Replace(txtPC, "R$ ", "")) / Replace(txtPC, "R$ ", "")) * 100
End Sub



Private Sub Frame6_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
mouse1.Visible = True
imgBuscar.Visible = False
End Sub

Private Sub Image2_Click()
Me.Enabled = False
frmB4.Show
End Sub

Private Sub imgMouse_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
mouse1.Visible = False
imgBuscar.Visible = True
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

Private Sub Text1_Change()
If Text1 = Empty Then
txtpreço = txtPC
Else
txtpreço = Format(txtPC + CCur(txtPC * (Text1 / 100)), "R$ #,##0.00;(R$#,##0.00)")
End If
End Sub

Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub



Private Sub desativar()
         mskCodMod.PromptInclude = False
         Call Tirar
End Sub

Private Sub ativar()
  mskCodMod.PromptInclude = True
  Call por
End Sub

Private Sub txtbuscas_Change()
           If cmbBusca.Text = "Nome" Then
             tabelas.Close
             tabelas.Open "select * from produtos where nome like '" & Replace(txtbuscas, "'", "''") & "%' order by codigo"
              Call carregar_lista
            ElseIf cmbBusca.Text = "Codigo" Then
             tabelas.Close
             tabelas.Open "select * from produtos where codigo like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca.Text = "Tipo" Then
            tabelas.Close
             tabelas.Open "select * from produtos where tipo like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            End If
End Sub

Private Sub txtPreço_LostFocus()
txtpreço = Format(txtpreço, "R$ #,##0.00;(R$#,##0.00)")
End Sub

