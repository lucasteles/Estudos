VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Begin VB.Form frmEstoque 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   5820
   ClientLeft      =   5985
   ClientTop       =   3345
   ClientWidth     =   5940
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5820
   ScaleWidth      =   5940
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Lançar "
      Height          =   255
      Left            =   2760
      TabIndex        =   47
      Top             =   5520
      Width           =   1455
   End
   Begin VB.Frame Frame3 
      Height          =   4815
      Left            =   120
      TabIndex        =   31
      Top             =   600
      Visible         =   0   'False
      Width           =   5775
      Begin VB.CommandButton cmdaddLista 
         Caption         =   "Lançar no estoque"
         Height          =   375
         Left            =   3720
         TabIndex        =   52
         Top             =   4320
         Width           =   1695
      End
      Begin VB.TextBox txtNomeFor 
         Height          =   375
         Left            =   960
         TabIndex        =   43
         Top             =   720
         Width           =   1935
      End
      Begin VB.PictureBox mouse2 
         BorderStyle     =   0  'None
         Height          =   615
         Left            =   3720
         ScaleHeight     =   615
         ScaleWidth      =   675
         TabIndex        =   42
         Top             =   360
         Width           =   675
         Begin VB.Image imgMouse2 
            Height          =   615
            Left            =   0
            MouseIcon       =   "frmEstoque.frx":0000
            MousePointer    =   99  'Custom
            Picture         =   "frmEstoque.frx":030A
            Stretch         =   -1  'True
            Top             =   0
            Width           =   675
         End
      End
      Begin VB.PictureBox imgBuscar2 
         BorderStyle     =   0  'None
         Height          =   855
         Left            =   3600
         ScaleHeight     =   855
         ScaleWidth      =   855
         TabIndex        =   41
         Top             =   240
         Visible         =   0   'False
         Width           =   855
         Begin VB.Image Image3 
            Height          =   855
            Left            =   0
            MouseIcon       =   "frmEstoque.frx":C64C
            MousePointer    =   99  'Custom
            Picture         =   "frmEstoque.frx":C956
            Stretch         =   -1  'True
            Top             =   0
            Width           =   945
         End
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   1920
         TabIndex        =   40
         Top             =   240
         Width           =   615
      End
      Begin VB.Frame Frame11 
         Caption         =   "Peças do fornecedor"
         Height          =   2535
         Left            =   120
         TabIndex        =   32
         Top             =   1680
         Width           =   5535
         Begin VB.TextBox txtValor 
            Height          =   375
            Left            =   4440
            Locked          =   -1  'True
            TabIndex        =   50
            Top             =   1200
            Width           =   975
         End
         Begin VB.TextBox txtNomepeça 
            Height          =   375
            Left            =   3960
            TabIndex        =   33
            Top             =   1920
            Width           =   1455
         End
         Begin MSFlexGridLib.MSFlexGrid flex 
            Height          =   1935
            Left            =   120
            TabIndex        =   34
            Top             =   240
            Width           =   3495
            _ExtentX        =   6165
            _ExtentY        =   3413
            _Version        =   393216
            Cols            =   3
            ForeColor       =   0
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            FormatString    =   "Cod Peça   |Nome             |Preço                 "
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
            Height          =   375
            Left            =   3720
            OleObjectBlob   =   "frmEstoque.frx":18C98
            TabIndex        =   35
            Top             =   1560
            Width           =   975
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel19 
            Height          =   375
            Left            =   3720
            OleObjectBlob   =   "frmEstoque.frx":18CFE
            TabIndex        =   36
            Top             =   240
            Width           =   855
         End
         Begin MSMask.MaskEdBox mskcodpeça 
            Height          =   375
            Left            =   4560
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
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel20 
            Height          =   375
            Left            =   3720
            OleObjectBlob   =   "frmEstoque.frx":18D68
            TabIndex        =   38
            Top             =   720
            Width           =   735
         End
         Begin MSMask.MaskEdBox mskquant 
            Height          =   375
            Left            =   4560
            TabIndex        =   39
            Top             =   720
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
            Height          =   375
            Left            =   3720
            OleObjectBlob   =   "frmEstoque.frx":18DD0
            TabIndex        =   51
            Top             =   1200
            Width           =   975
         End
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel16 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmEstoque.frx":18E38
         TabIndex        =   44
         Top             =   720
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel17 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmEstoque.frx":18E9E
         TabIndex        =   45
         Top             =   240
         Width           =   855
      End
      Begin MSMask.MaskEdBox mskCodfor 
         Height          =   375
         Left            =   960
         TabIndex        =   46
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
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmEstoque.frx":18F08
         TabIndex        =   48
         Top             =   1200
         Width           =   1215
      End
      Begin MSMask.MaskEdBox mskNota 
         Height          =   375
         Left            =   1440
         TabIndex        =   49
         Top             =   1200
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   6
         Mask            =   "######"
         PromptChar      =   "_"
      End
   End
   Begin VB.CommandButton cmdhis 
      Caption         =   "Historico"
      Height          =   255
      Left            =   4320
      TabIndex        =   24
      Top             =   5520
      Width           =   1575
   End
   Begin VB.Frame Frame9 
      Caption         =   "Peças"
      Height          =   4815
      Left            =   120
      TabIndex        =   12
      Top             =   600
      Width           =   5775
      Begin VB.CheckBox Check2 
         Caption         =   "Falta"
         Height          =   255
         Left            =   1440
         TabIndex        =   26
         Top             =   1680
         Width           =   1215
      End
      Begin VB.CheckBox Minima 
         Caption         =   "Minima"
         Height          =   255
         Left            =   360
         TabIndex        =   25
         Top             =   1680
         Width           =   1215
      End
      Begin VB.TextBox txtLocal 
         Height          =   375
         Left            =   960
         TabIndex        =   22
         Top             =   1200
         Width           =   2175
      End
      Begin VB.Frame Frame1 
         Caption         =   "Quantidade"
         Height          =   1455
         Left            =   3240
         TabIndex        =   16
         Top             =   120
         Width           =   2415
         Begin VB.CommandButton cmdSalvar 
            Caption         =   "Salvar"
            Height          =   255
            Left            =   1320
            TabIndex        =   30
            Top             =   1080
            Width           =   735
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   375
            Left            =   240
            OleObjectBlob   =   "frmEstoque.frx":18F7C
            TabIndex        =   17
            Top             =   240
            Width           =   735
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
            Height          =   375
            Left            =   240
            OleObjectBlob   =   "frmEstoque.frx":18FE6
            TabIndex        =   18
            Top             =   600
            Width           =   855
         End
         Begin MSMask.MaskEdBox mskqtdMin 
            Height          =   375
            Left            =   1080
            TabIndex        =   19
            Top             =   240
            Width           =   1215
            _ExtentX        =   2143
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   9
            Mask            =   "#########"
            PromptChar      =   "_"
         End
         Begin MSMask.MaskEdBox mskQtdmax 
            Height          =   375
            Left            =   1080
            TabIndex        =   20
            Top             =   600
            Width           =   1215
            _ExtentX        =   2143
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   9
            Mask            =   "#########"
            PromptChar      =   "_"
         End
      End
      Begin VB.TextBox txtNomepe 
         Height          =   375
         Left            =   960
         TabIndex        =   15
         Top             =   720
         Width           =   2175
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmEstoque.frx":19050
         TabIndex        =   13
         Top             =   720
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmEstoque.frx":190B6
         TabIndex        =   14
         Top             =   240
         Width           =   855
      End
      Begin MSMask.MaskEdBox mskCodpe 
         Height          =   375
         Left            =   960
         TabIndex        =   21
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
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmEstoque.frx":19120
         TabIndex        =   23
         Top             =   1200
         Width           =   975
      End
      Begin MSFlexGridLib.MSFlexGrid FlexItens 
         Height          =   2535
         Left            =   120
         TabIndex        =   27
         Top             =   2160
         Width           =   5295
         _ExtentX        =   9340
         _ExtentY        =   4471
         _Version        =   393216
         Cols            =   3
         ForeColor       =   0
         BackColorFixed  =   14737632
         BackColorBkg    =   16777215
         FormatString    =   "Cod Peça       |Nome                      |Quantidade em estoque                 "
      End
      Begin MSMask.MaskEdBox mskqtd 
         Height          =   375
         Left            =   4320
         TabIndex        =   28
         Top             =   1680
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         _Version        =   393216
         BackColor       =   16777215
         MaxLength       =   9
         Mask            =   "#########"
         PromptChar      =   "_"
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   375
         Left            =   3480
         OleObjectBlob   =   "frmEstoque.frx":19188
         TabIndex        =   29
         Top             =   1680
         Width           =   855
      End
   End
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   120
      ScaleHeight     =   675
      ScaleWidth      =   5775
      TabIndex        =   4
      Top             =   5760
      Width           =   5775
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmEstoque.frx":191F0
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   11
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmEstoque.frx":1977A
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   10
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmEstoque.frx":1A044
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   9
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmEstoque.frx":1AD0E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   8
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmEstoque.frx":1B9D8
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   7
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmEstoque.frx":1C2A2
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   5
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
         TabIndex        =   6
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   5775
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   0
         Top             =   0
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmEstoque.frx":1CF6C
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   4200
         OleObjectBlob   =   "frmEstoque.frx":1CFCE
         TabIndex        =   2
         Top             =   120
         Width           =   1215
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmEstoque.frx":1D03A
         TabIndex        =   3
         Top             =   120
         Width           =   1455
      End
   End
End
Attribute VB_Name = "frmEstoque"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As Long
Dim b As Integer
Dim navegaçao As Integer
Dim variavel As Long
Private Sub desativar()
         mskqtdMin.PromptInclude = False
         mskQtdmax.PromptInclude = False
         mskqtd.PromptInclude = False
        mskCodpe.PromptInclude = False
        mskCodfor.PromptInclude = False
        mskcodpeça.PromptInclude = False
        mskquant.PromptInclude = False
        mskNota.PromptInclude = False
End Sub
Private Sub ativar()
        mskqtdMin.PromptInclude = True
         mskQtdmax.PromptInclude = True
         mskqtd.PromptInclude = True
        mskCodpe.PromptInclude = True
                mskCodfor.PromptInclude = True
                  mskcodpeça.PromptInclude = True
        mskquant.PromptInclude = True
        mskNota.PromptInclude = True
End Sub


Private Sub cmdaddLista_Click()
Call desativar
            Call estoque
            tabelas.Close
            tabelas.Open "select * from estoque where codigo=" & mskcodpeça '& " and codfor=" & mskCodfor
            If tabelas.EOF = False And tabelas.BOF = False Then
            tabelas!Qtd_atual = tabelas!Qtd_atual + mskquant
            tabelas.Update
            Call carregar_lista
            End If
            tabelas.Close
            
             Call Hist_estoque
           If tabelas5.State = adStateOpen Then tabelas5.Close
          tabelas5.Open "historico_estoque", conecta, adOpenKeyset, adLockOptimistic
          If tabelas4.State = adStateOpen Then tabelas4.Close
          tabelas4.Open "historico_estoque", conecta, adOpenKeyset, adLockOptimistic
          If tabelas5.State = adStateOpen Then tabelas5.Close
          tabelas5.Open "select * from historico_estoque where cod_estoque=" & mskcodpeça
          If tabelas5.EOF = False And tabelas5.BOF = False Then
          tabelas5.MoveLast
          Dim valorAtual As Double
          Dim qtdAtual As Long
          valorAtual = tabelas5!valor_atual
          qtdAtual = tabelas5!Qtd_atual
          End If
          tabelas4.AddNew
          tabelas4!data = Date
          If Not mskNota = Empty Then
          tabelas4!ND = "Venda cf NF " & mskNota
          Else
          tabelas4!ND = "SEM DOCUMENTO"
          End If
          tabelas4!qtd_entrada = mskquant
            
         tabelas4!entrada_medio = Replace(txtValor, "R$ ", "")
                tabelas4!valor_entrada = Replace(txtValor, "R$ ", "") * mskquant
          tabelas4!cod_estoque = mskcodpeça
          
          
          tabelas4!Qtd_atual = qtdAtual + (mskquant)
          tabelas4!valor_atual = valorAtual + (Replace(txtValor, "R$ ", "") * mskquant)
          
          tabelas4!atual_medio = ((valorAtual + (Replace(txtValor, "R$ ", ""))) * mskquant) / (qtdAtual + (mskquant))

          tabelas4.Update
          
          status = "salvas"
          Call crash1
          
          
End Sub

Private Sub Command1_Click()
If Frame3.Visible = True Then
Frame3.Visible = False
Command1.Caption = "Lançar"
actskin2.ApplySkin Command1.hWnd
Call estoque
Call carregar_lista
Else
Frame3.Visible = True
Command1.Caption = "Voltar"
actskin2.ApplySkin Command1.hWnd
End If
End Sub

Private Sub Command2_Click()
             Call desativar
            If mskCodfor = Empty Then
            Else
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "fornecedores", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from fornecedores  where codigo=" & mskCodfor
            If tabelas2.BOF = False And tabelas2.EOF = False Then
            txtNomeFor = tabelas2!razaosocial
            
           
            
            flex.Clear
            flex.Rows = 2
            flex.FormatString = "Cod forne |Nome             |Preço           "
             tabelas3.Open "preços", conecta, adOpenKeyset, adLockOptimistic
            tabelas3.Close
            tabelas3.Open "select * from Preços where codfor=" & tabelas2!codigo
             If tabelas3.BOF = False Or tabelas3.EOF = False Then
            Dim cont As Integer
            cont = 1
            While tabelas3.EOF = False
            flex.TextMatrix(cont, 0) = tabelas3!codpe
            
            
            tabelas2.Close
            tabelas2.Open "Peças", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from peças where codigo=" & tabelas3!codpe
            flex.TextMatrix(cont, 1) = tabelas2!nome
            flex.TextMatrix(cont, 2) = Format(tabelas3!Preço, "R$ #,##0.00;(R$#,##0.00)")
            cont = cont + 1
            flex.Rows = flex.Rows + 1
            tabelas3.MoveNext
            Wend
            
            flex.Rows = flex.Rows - 1
            
           
            End If
            End If
            End If
            If tabelas2.State = adStateOpen Then tabelas2.Close
            If tabelas3.State = adStateOpen Then tabelas3.Close
            Call ativar

End Sub

Private Sub flex_Click()
Call desativar
mskcodpeça = flex.TextMatrix(flex.Row, 0)
txtNomepeça = flex.TextMatrix(flex.Row, 1)
txtValor = Format(flex.TextMatrix(flex.Row, 2), "R$ #,##0.00;(R$#,##0.00)")
mskquant = 1
Call ativar

End Sub

Private Sub Frame3_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse2.Visible = True
imgBuscar2.Visible = False

End Sub

Private Sub Image3_Click()
Me.Enabled = False
frmB6.Show
Busc_peças = True

End Sub

Private Sub imgMouse2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse2.Visible = False
imgBuscar2.Visible = True
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



Private Sub cmdAtu_Click()
Call estoque
Call carregar_lista
Call Pedidos
End Sub

Private Sub Check2_Click()

If Check2 = 1 Then
Minima = 0
tabelas.Close
tabelas.Open "select * from estoque where qtd_atual = 0"
Call carregar_lista
Call estoque
Else
Call estoque
Call carregar_lista
End If

End Sub

Private Sub cmdhis_Click()
Call desativar
If mskCodpe = Empty And mskcodpeça = Empty Then
MsgBox "Escolha uma peçanoestoque", vbInformation
Else
If mskCodpe = Empty Then
algo = mskcodpeça
Else
algo = mskCodpe
End If
Call ativar
frmHistoricoEstoque.Show
End If
End Sub

Private Sub cmdSalvar_Click()
        Call desativar
        
        
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "peças", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from peças where codigo=" & mskCodpe
If tabelas2.EOF = True Or tabelas2.BOF = True Then
MsgBox "Esta Peça não e Valida", vbExclamation
tabelas2.Close
Exit Sub
End If
tabelas2.Close
        
        If mskCodpe = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        If MsgBox("Deseja salvar?", vbQuestion + vbYesNo) = vbYes Then
        tabelas.Close
        tabelas.Open "select * from estoque where codigo=" & mskCodpe
        tabelas!qtd_min = mskqtdMin
        tabelas!qtd_max = mskQtdmax
        tabelas!Qtd_atual = mskqtd
        tabelas!local = txtLocal
        tabelas.Update
        status = "alteradas"
        Call crash1
        Call estoque
        End If
        Call ativar
       End If
       Call carregar_lista
End Sub


Private Sub cmdSalvar_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Salva um cadastro"
pctSalvar.Visible = True
pctluxus.Visible = False
pctExcluir.Visible = False
pctNovo.Visible = False
End Sub


Private Sub cmdNovo_Click()
            Call desativar
          mskqtd = Clear
          mskQtdmax = Clear
          mskqtdMin = Clear
          
          mskCodpe = Clear
          txtNomepe = Clear
          
          Call ativar
            
        
End Sub




Private Sub FlexItens_Click()
With FlexItens
variavel = 1
Call desativar
mskCodpe = .TextMatrix(.Row, 0)
txtNomepe = .TextMatrix(.Row, 1)


Call estoque
tabelas.Close
tabelas.Open "select * from estoque where codigo=" & CCur(.TextMatrix(.Row, 0))
mskqtdMin = tabelas!qtd_min
mskQtdmax = tabelas!qtd_max
mskqtd = tabelas!Qtd_atual
txtLocal = tabelas!local

End With
Call ativar


End Sub

Private Sub Form_Activate()
Call estoque
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            SendKeys "{Tab}"
            End If

End Sub


Private Sub Form_Load()

            actskin.ApplySkin Me.hWnd
             actskin2.ApplySkin (cmdSalvar.hWnd)
            actskin2.ApplySkin (Frame5.hWnd)
            actskin2.ApplySkin (cmdhis.hWnd)
             actskin2.ApplySkin (Command1.hWnd)
              actskin2.ApplySkin (cmdaddLista.hWnd)
            Call estoque
           
           Call carregar_lista
           
            
           
            
End Sub
Private Sub carregar_lista()
 With FlexItens
            
            Dim cont1 As Integer
            cont1 = 1
            .Rows = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "Peças", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from Peças where codigo=" & tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas2!nome
           tabelas2.Close
            .TextMatrix(cont1, 2) = tabelas!Qtd_atual
            
            If tabelas!Qtd_atual < tabelas!qtd_min And tabelas!Qtd_atual > 0 Then
           .Row = cont1
            .Col = 1
            .CellBackColor = vbYellow
            .Col = 2
            .CellBackColor = vbYellow
           End If
            
            If tabelas!Qtd_atual <= 0 Then
            .Row = cont1
            .Col = 1
            .CellBackColor = vbRed
            .Col = 2
            .CellBackColor = vbRed
            End If
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
           .TextMatrix(cont1, 0) = tabelas!codigo
           .TextMatrix(cont1, 2) = tabelas!Qtd_atual
            
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "Peças", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from Peças where codigo=" & tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas2!nome
           
              If tabelas!Qtd_atual < tabelas!qtd_min And tabelas!Qtd_atual > 0 Then
              .Row = cont1
            .Col = 1
            .CellBackColor = vbYellow
            .Col = 2
            .CellBackColor = vbYellow
           End If
            
            If tabelas!Qtd_atual = 0 Then
           .Row = cont1
            .Col = 1
            .CellBackColor = vbRed
            .Col = 2
            .CellBackColor = vbRed
            End If
          
           tabelas2.Close
           
            
            
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


Private Sub Frame9_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
   pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
End Sub

Private Sub Minima_Click()
If Minima = 1 Then
Check2 = 0
tabelas.Close
tabelas.Open "select * from estoque where qtd_atual < qtd_min and qtd_atual > 0"
Call carregar_lista
Call estoque
Else
Call estoque
Call carregar_lista
End If
End Sub

Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub txtNomepe_Change()
If txtNomepe = Empty Then GoTo a
If txtNomepe <> Empty Then
If variavel = Empty Then
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "peças", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from peças where nome like '" & Replace(txtNomepe, "'", "''") & "%' order by codigo"
If tabelas2.BOF = False And tabelas2.EOF = False Then
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from estoque where codigo=" & tabelas2!codigo
End If
Else
a:
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "select * from estoque order by codigo"
End If
If variavel = Empty Then Call carregar_lista
Call estoque
variavel = Empty
End If
End Sub
