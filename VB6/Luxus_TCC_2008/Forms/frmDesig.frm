VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmDesig 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Designer"
   ClientHeight    =   5640
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   8430
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5640
   ScaleWidth      =   8430
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   0
      ScaleHeight     =   675
      ScaleWidth      =   8415
      TabIndex        =   42
      Top             =   5640
      Width           =   8415
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmDesig.frx":0000
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   48
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmDesig.frx":0CCA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   47
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmDesig.frx":1594
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   46
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmDesig.frx":225E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   45
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmDesig.frx":2F28
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   44
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmDesig.frx":37F2
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   43
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
         TabIndex        =   49
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
      Height          =   4575
      Left            =   120
      TabIndex        =   25
      Top             =   1080
      Width           =   8175
      Begin VB.CommandButton Command2 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   4560
         TabIndex        =   53
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtNomeF 
         Height          =   375
         Left            =   5160
         TabIndex        =   51
         Top             =   1560
         Width           =   2175
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   7440
         TabIndex        =   50
         Top             =   1560
         Width           =   615
      End
      Begin VB.Frame Frame3 
         Height          =   735
         Left            =   240
         TabIndex        =   37
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
            Picture         =   "frmDesig.frx":3D7C
            TabIndex        =   41
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
            Picture         =   "frmDesig.frx":41BE
            TabIndex        =   40
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
            Picture         =   "frmDesig.frx":4600
            TabIndex        =   39
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
            Picture         =   "frmDesig.frx":4A42
            TabIndex        =   38
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   4920
         Top             =   840
      End
      Begin VB.TextBox txtRsocial 
         Height          =   375
         Left            =   480
         TabIndex        =   3
         Top             =   1560
         Width           =   3495
      End
      Begin VB.TextBox txtLog 
         Height          =   375
         Left            =   480
         TabIndex        =   4
         Top             =   2400
         Width           =   4695
      End
      Begin VB.TextBox txtCidade 
         Height          =   375
         Left            =   3360
         TabIndex        =   7
         Top             =   3240
         Width           =   1815
      End
      Begin VB.TextBox txtBairro 
         Height          =   375
         Left            =   480
         TabIndex        =   6
         Top             =   3240
         Width           =   2655
      End
      Begin VB.TextBox txtNumero 
         Height          =   375
         Left            =   5520
         TabIndex        =   5
         Top             =   2400
         Width           =   975
      End
      Begin VB.CommandButton cmdBuscCod 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   1560
         TabIndex        =   14
         Top             =   720
         Width           =   615
      End
      Begin VB.CommandButton cmdExclu 
         Caption         =   "Excluir"
         Height          =   495
         Left            =   2760
         TabIndex        =   11
         Top             =   3840
         Width           =   1095
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar"
         Height          =   495
         Left            =   3840
         TabIndex        =   12
         Top             =   3840
         Width           =   1095
      End
      Begin VB.ComboBox txtUF 
         Height          =   315
         ItemData        =   "frmDesig.frx":4E84
         Left            =   6720
         List            =   "frmDesig.frx":4ED9
         TabIndex        =   9
         Text            =   "UF"
         Top             =   3240
         Width           =   855
      End
      Begin VB.CommandButton cmdnovo 
         Caption         =   "Novo"
         Height          =   495
         Left            =   4920
         TabIndex        =   13
         Top             =   3840
         Width           =   1095
      End
      Begin VB.CommandButton cmdBuscNome 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   4080
         TabIndex        =   15
         Top             =   1560
         Width           =   615
      End
      Begin MSMask.MaskEdBox mskCod 
         Height          =   375
         Left            =   600
         TabIndex        =   1
         Top             =   720
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   -2147483648
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCep 
         Height          =   375
         Left            =   5520
         TabIndex        =   10
         Top             =   3240
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   9
         Mask            =   "#####-###"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskTel 
         Height          =   375
         Left            =   6720
         TabIndex        =   8
         Top             =   2400
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   13
         Mask            =   "(##)####-####"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   5520
         OleObjectBlob   =   "frmDesig.frx":4F49
         TabIndex        =   26
         Top             =   3000
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   255
         Left            =   6720
         OleObjectBlob   =   "frmDesig.frx":4FAD
         TabIndex        =   27
         Top             =   3000
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   255
         Left            =   6600
         OleObjectBlob   =   "frmDesig.frx":5013
         TabIndex        =   28
         Top             =   2160
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   255
         Left            =   3240
         OleObjectBlob   =   "frmDesig.frx":5081
         TabIndex        =   29
         Top             =   3000
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmDesig.frx":50EB
         TabIndex        =   30
         Top             =   1320
         Width           =   2655
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
         Height          =   255
         Left            =   2520
         OleObjectBlob   =   "frmDesig.frx":5161
         TabIndex        =   31
         Top             =   480
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   255
         Left            =   360
         OleObjectBlob   =   "frmDesig.frx":51C7
         TabIndex        =   32
         Top             =   3000
         Width           =   1455
      End
      Begin MSMask.MaskEdBox mskCnpj 
         Height          =   375
         Left            =   2760
         TabIndex        =   2
         Top             =   720
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   18
         Mask            =   "##-###-###/####-##"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   255
         Left            =   5400
         OleObjectBlob   =   "frmDesig.frx":5231
         TabIndex        =   33
         Top             =   2160
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmDesig.frx":529B
         TabIndex        =   34
         Top             =   480
         Width           =   1095
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmDesig.frx":5305
         TabIndex        =   35
         Top             =   2160
         Width           =   2655
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
         Height          =   255
         Left            =   4920
         OleObjectBlob   =   "frmDesig.frx":5377
         TabIndex        =   52
         Top             =   1320
         Width           =   2655
      End
   End
   Begin VB.Frame Frame1 
      Height          =   4455
      Left            =   120
      TabIndex        =   20
      Top             =   1080
      Visible         =   0   'False
      Width           =   7935
      Begin VB.Frame Frame4 
         Caption         =   "Busca"
         Height          =   855
         Left            =   120
         TabIndex        =   21
         Top             =   240
         Width           =   4095
         Begin VB.ComboBox cmbBusca 
            Height          =   315
            ItemData        =   "frmDesig.frx":53EF
            Left            =   240
            List            =   "frmDesig.frx":53FC
            TabIndex        =   23
            Text            =   "R. Social"
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtbuscas 
            Height          =   315
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   22
            Top             =   360
            Width           =   2175
         End
      End
      Begin MSFlexGridLib.MSFlexGrid flexClientes 
         Height          =   3015
         Left            =   600
         TabIndex        =   36
         Top             =   1200
         Width           =   6495
         _ExtentX        =   11456
         _ExtentY        =   5318
         _Version        =   393216
         Cols            =   4
         BackColorFixed  =   14737632
         BackColorBkg    =   16777215
         FormatString    =   "Codigo     | Razao Social                                         |Cnpj                    | Telefone           "
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   5055
      Left            =   0
      TabIndex        =   19
      Top             =   600
      Width           =   8415
      _ExtentX        =   14843
      _ExtentY        =   8916
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
      TabIndex        =   0
      Top             =   0
      Width           =   8175
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmDesig.frx":541B
         TabIndex        =   16
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   5280
         OleObjectBlob   =   "frmDesig.frx":547D
         TabIndex        =   17
         Top             =   120
         Width           =   2055
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmDesig.frx":54EB
         TabIndex        =   18
         Top             =   120
         Width           =   1455
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
      Height          =   255
      Left            =   0
      OleObjectBlob   =   "frmDesig.frx":5559
      TabIndex        =   24
      Top             =   1320
      Width           =   735
   End
End
Attribute VB_Name = "frmDesig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As Integer
Dim b As Integer
Dim navegaçao As Integer
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
          mskCNPJ.PromptInclude = False
          mskTel.PromptInclude = False
          mskCep.PromptInclude = False
          mskCod.PromptInclude = False
End Sub
Private Sub ativar()
            mskCNPJ.PromptInclude = True
            mskTel.PromptInclude = True
            mskCep.PromptInclude = True
            mskCod.PromptInclude = True
 
            
End Sub


Private Sub cmdAnt_Click()
             Call desativar
             If mskCod = Empty Then
             If tabelas.EOF = False And tabelas.BOF = False Then
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
            MsgBox "NAO A CADASTROS", vbExclamation
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

Private Sub cmdBuscCod_Click()
Call Tirar
            Call desativar
            If mskCod = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from designe  where codigo=" & mskCod
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            
            End If
            End If
            Call ativar
            Call desi
            
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



Private Sub cmdExclu_Click()
Call Tirar
           Call desativar
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If mskCod = Empty Then
           MsgBox "Nao pode exluir", vbCritical
           Else
           On Error GoTo d
           conecta.Execute "delete * from designe where codigo=" & mskCod
           cmdNovo = True
           status = "excluidos"
           Call crash1
           navegaçao = Clear
           Call desi
           End If
           End If
           Call ativar
           Call por
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
            
            If mskCod = Empty Then
            If tabelas.EOF = False And tabelas.BOF = False Then
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
            
            If tabelas.EOF = False Or tabelas.BOF = False Then
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
Call Tirar
        Call desativar
        If txtRsocial = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        
        
     'codigo autometico
        If mskCod = Empty Then
        If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 1
        While b = Empty
        
        tabelas.Close
        tabelas.Open "select * from designe where codigo=" & a
        If tabelas.BOF = False Or tabelas.EOF = False Then
        a = a + 1
        Else
        b = 1
        Call desi
        End If
        Wend
        Else
        a = 1
        End If
        mskCod = a
        b = Clear
        End If
         
        tabelas.Close
        tabelas.Open "select * from designe where codigo=" & mskCod
        If tabelas.BOF = False Or tabelas.EOF = False Then
        If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
        status = "alteradas"
        Call salvar
        Call desi
        End If
        Else
        status = "salvas"
        Call salvar
        Call desi
        End If
        End If
        Call ativar
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
            MsgBox "NAO A CADASTROS", vbExclamation
            End If
            Call ativar
End Sub

            

Private Sub cmdBuscNome_Click()
Call Tirar
            Call desativar
            If txtRsocial = Empty Then
            MsgBox "Digite um nome para cadastrar", vbExclamation
            Else
            tabelas.Close
            tabelas.Open "select * from designe where razaosocial like '" & txtRsocial & "%'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            
            End If
            End If
            Call desi
            Call ativar
            Call mostrar
            Call por
End Sub

Private Sub cmdNovo_Click()
          Call desativar
             mskCNPJ = Clear
             mskTel = Clear
             mskCep = Clear
             txtRsocial = Clear
             txtLog = Clear
             txtNumero = Clear
             txtBairro = Clear
             txtUF.Text = ""
             mskCod = Clear
             txtNomeF = Clear
             Call ativar
            
        
End Sub

Private Sub cmdUlt_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exibe o ultimo Registro"
pctNav.Visible = True
pctluxus.Visible = False
End Sub


Private Sub Command2_Click()
            Call desativar
            If mskCNPJ = Empty Then
            Else
            tabelas.Close
            tabelas.Open "select * from designe where CNPJ= '" & mskCNPJ & "'"
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            Else
            MsgBox "CNPJ Inexistente", vbCritical
            End If
            End If
            Call ativar
             Call desi

End Sub

Private Sub flexClientes_Click()
             Call desativar
             mskCod = flexClientes.TextMatrix(flexClientes.Row, 0)
            cmdBuscCod = True
            Call ativar
            Frame2.Visible = True
            Frame1.Visible = False
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
Call desi
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

Private Sub salvar()
If status = "salvas" Then
tabelas.AddNew
End If
tabelas!codigo = mskCod
tabelas!razaosocial = txtRsocial
tabelas!cnpj = mskCNPJ
tabelas!telefone = mskTel
tabelas!cep = mskCep
tabelas!logradouro = txtLog
tabelas!numero = txtNumero
tabelas!bairro = txtBairro
tabelas!uf = txtUF.Text
tabelas!nomeF = txtNomeF
tabelas.Update
Call crash1
Call desi
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
             actskin2.ApplySkin (TabStrip1.hWnd)
             actskin2.ApplySkin (Frame5.hWnd)
       
             
            
           
            
            Call desi
           Call carregar_lista
            
            
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

Private Sub mskCod_LostFocus()
            cmdBuscCod = True
End Sub

Private Sub mostrar()
Call desativar
             mskCNPJ = tabelas!cnpj
             mskTel = tabelas!telefone
             mskCep = tabelas!cep
             txtRsocial = tabelas!razaosocial
             txtLog = tabelas!logradouro
             txtNumero = tabelas!numero
             txtBairro = tabelas!bairro
             txtUF.Text = tabelas!uf
             mskCod = tabelas!codigo
             txtNomeF = tabelas!nomeF
             navegaçao = tabelas!codigo
             
                                 
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
            tabelas.Open "select * from designe where razaosocial like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "Telefone" Then
             tabelas.Close
             tabelas.Open "select * from designe where telefone like '" & txtbuscas & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "CNPJ" Then
            tabelas.Close
             tabelas.Open "select * from designe where cnpj like '" & txtbuscas & "%' order by codigo"
            End If
End Sub
