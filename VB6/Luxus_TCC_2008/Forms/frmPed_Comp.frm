VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmPed_Comp 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Controle de Pedidos de compra"
   ClientHeight    =   6900
   ClientLeft      =   30
   ClientTop       =   390
   ClientWidth     =   12180
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6900
   ScaleWidth      =   12180
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdImprimir 
      Caption         =   "Imprimir Comprovante"
      Height          =   375
      Left            =   4920
      TabIndex        =   49
      Top             =   5520
      Width           =   2415
   End
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   4800
      ScaleHeight     =   675
      ScaleWidth      =   7215
      TabIndex        =   41
      Top             =   6120
      Width           =   7215
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmPed_Comp.frx":0000
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   47
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Comp.frx":0CCA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   46
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Comp.frx":1594
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   45
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Comp.frx":225E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   44
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmPed_Comp.frx":2F28
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   43
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmPed_Comp.frx":37F2
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   42
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
         TabIndex        =   48
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame3 
      Height          =   735
      Left            =   4920
      TabIndex        =   34
      Top             =   4680
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
         Picture         =   "frmPed_Comp.frx":3D7C
         TabIndex        =   38
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
         Picture         =   "frmPed_Comp.frx":41BE
         TabIndex        =   37
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
         Picture         =   "frmPed_Comp.frx":4600
         TabIndex        =   36
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
         Picture         =   "frmPed_Comp.frx":4A42
         TabIndex        =   35
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.CommandButton cmdBuscar_Pedido 
      Caption         =   "Buscar"
      Height          =   375
      Left            =   10440
      TabIndex        =   33
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton cmdNovo 
      Caption         =   "Novo"
      Height          =   375
      Left            =   10920
      TabIndex        =   26
      Top             =   4800
      Width           =   855
   End
   Begin VB.CommandButton cmdExcluir 
      Caption         =   "Excluir"
      Height          =   375
      Left            =   9960
      TabIndex        =   25
      Top             =   4800
      Width           =   855
   End
   Begin VB.CommandButton cmdSalvar 
      Caption         =   "Salvar"
      Height          =   375
      Left            =   9000
      TabIndex        =   24
      Top             =   4800
      Width           =   855
   End
   Begin VB.Timer Timer2 
      Left            =   5640
      Top             =   0
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   20
      Top             =   120
      Width           =   11415
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   3720
         Top             =   240
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1560
         OleObjectBlob   =   "frmPed_Comp.frx":4E84
         TabIndex        =   21
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   3840
         OleObjectBlob   =   "frmPed_Comp.frx":4EE8
         TabIndex        =   22
         Top             =   120
         Width           =   2895
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmPed_Comp.frx":4F52
         TabIndex        =   23
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.TextBox txtValor_Total 
      Height          =   405
      Left            =   6240
      TabIndex        =   19
      Top             =   4200
      Width           =   2292
   End
   Begin VB.Frame Frame1 
      Caption         =   "Pago"
      Height          =   612
      Left            =   8880
      TabIndex        =   15
      Top             =   4080
      Width           =   1452
      Begin VB.OptionButton optNao 
         Caption         =   "Não"
         Height          =   252
         Left            =   720
         TabIndex        =   17
         Top             =   240
         Width           =   612
      End
      Begin VB.OptionButton optSim 
         Caption         =   "Sim"
         Height          =   192
         Left            =   120
         TabIndex        =   16
         Top             =   240
         Width           =   612
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel Hora 
      Height          =   375
      Left            =   6360
      OleObjectBlob   =   "frmPed_Comp.frx":4FBE
      TabIndex        =   14
      Top             =   840
      Width           =   975
   End
   Begin MSComCtl2.DTPicker DT 
      Height          =   375
      Left            =   4800
      TabIndex        =   13
      Top             =   840
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      _Version        =   393216
      Format          =   52822017
      CurrentDate     =   39737
   End
   Begin VB.Frame Frame9 
      Caption         =   "Fornecedores"
      Height          =   5895
      Left            =   0
      TabIndex        =   0
      Top             =   960
      Width           =   4692
      Begin VB.PictureBox mouse1 
         BorderStyle     =   0  'None
         Height          =   615
         Left            =   3480
         ScaleHeight     =   615
         ScaleWidth      =   675
         TabIndex        =   40
         Top             =   480
         Width           =   675
         Begin VB.Image imgMouse 
            Height          =   615
            Left            =   0
            MouseIcon       =   "frmPed_Comp.frx":502C
            MousePointer    =   99  'Custom
            Picture         =   "frmPed_Comp.frx":5336
            Stretch         =   -1  'True
            Top             =   0
            Width           =   675
         End
      End
      Begin VB.PictureBox imgBuscar 
         BorderStyle     =   0  'None
         Height          =   855
         Left            =   3360
         ScaleHeight     =   855
         ScaleWidth      =   915
         TabIndex        =   39
         Top             =   360
         Visible         =   0   'False
         Width           =   915
         Begin VB.Image Image2 
            Height          =   855
            Left            =   0
            MouseIcon       =   "frmPed_Comp.frx":11678
            MousePointer    =   99  'Custom
            Picture         =   "frmPed_Comp.frx":11982
            Stretch         =   -1  'True
            Top             =   0
            Width           =   915
         End
      End
      Begin VB.Frame Frame11 
         Caption         =   "Peças do fornecedor"
         Height          =   3495
         Left            =   120
         TabIndex        =   6
         Top             =   2040
         Width           =   4452
         Begin VB.TextBox txtNomepe 
            Enabled         =   0   'False
            Height          =   375
            Left            =   1200
            TabIndex        =   29
            Top             =   2520
            Width           =   2772
         End
         Begin VB.CommandButton cmdaddLista 
            Caption         =   "Add"
            Height          =   375
            Left            =   1080
            TabIndex        =   8
            Top             =   3000
            Width           =   855
         End
         Begin VB.CommandButton cmdRlista 
            Caption         =   "Remover"
            Height          =   375
            Left            =   1920
            TabIndex        =   7
            Top             =   3000
            Width           =   855
         End
         Begin MSFlexGridLib.MSFlexGrid FlexPefor 
            Height          =   1695
            Left            =   360
            TabIndex        =   9
            Top             =   240
            Width           =   3495
            _ExtentX        =   6165
            _ExtentY        =   2990
            _Version        =   393216
            Cols            =   3
            ForeColor       =   0
            BackColorFixed  =   14737632
            BackColorBkg    =   16777215
            FormatString    =   "Cod Peça   |Nome             |Preço                 "
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel20 
            Height          =   375
            Left            =   2160
            OleObjectBlob   =   "frmPed_Comp.frx":1DCC4
            TabIndex        =   10
            Top             =   2040
            Width           =   735
         End
         Begin MSMask.MaskEdBox mskqtd 
            Height          =   375
            Left            =   2880
            TabIndex        =   11
            Top             =   2040
            Width           =   855
            _ExtentX        =   1508
            _ExtentY        =   661
            _Version        =   393216
            BackColor       =   16777215
            MaxLength       =   6
            Mask            =   "######"
            PromptChar      =   "_"
         End
         Begin MSMask.MaskEdBox mskCodpe 
            Height          =   375
            Left            =   1200
            TabIndex        =   27
            Top             =   2040
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
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   375
            Left            =   360
            OleObjectBlob   =   "frmPed_Comp.frx":1DD2C
            TabIndex        =   28
            Top             =   2040
            Width           =   855
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
            Height          =   375
            Left            =   360
            OleObjectBlob   =   "frmPed_Comp.frx":1DD96
            TabIndex        =   30
            Top             =   2520
            Width           =   735
         End
      End
      Begin VB.TextBox txtNomeFor 
         Height          =   375
         Left            =   1680
         TabIndex        =   2
         Top             =   1440
         Width           =   2772
      End
      Begin VB.CommandButton cmdBuscar 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   2280
         TabIndex        =   1
         Top             =   600
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel16 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmPed_Comp.frx":1DDFC
         TabIndex        =   3
         Top             =   1440
         Width           =   1695
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel17 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmPed_Comp.frx":1DE72
         TabIndex        =   4
         Top             =   600
         Width           =   855
      End
      Begin MSMask.MaskEdBox mskCodfor 
         Height          =   375
         Left            =   1200
         TabIndex        =   5
         Top             =   600
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
   Begin MSFlexGridLib.MSFlexGrid FlexItem 
      Height          =   2655
      Left            =   5280
      TabIndex        =   12
      Top             =   1320
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   4683
      _Version        =   393216
      Cols            =   5
      ForeColor       =   0
      BackColorFixed  =   14737632
      BackColorBkg    =   12632256
      FormatString    =   "Código da Peça |                    Nome| Quantidade   |Preco Unitario   |Sub Total         "
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   375
      Left            =   4800
      OleObjectBlob   =   "frmPed_Comp.frx":1DEDC
      TabIndex        =   18
      Top             =   4200
      Width           =   1335
   End
   Begin MSMask.MaskEdBox mskNumPed 
      Height          =   375
      Left            =   9480
      TabIndex        =   31
      Top             =   840
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
      Height          =   255
      Left            =   7440
      OleObjectBlob   =   "frmPed_Comp.frx":1DF50
      TabIndex        =   32
      Top             =   840
      Width           =   2055
   End
End
Attribute VB_Name = "frmPed_Comp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cont As Integer
Dim linha As Integer
Dim total(5) As Double
Dim Pago As Boolean
Dim cc As Integer
Dim navegaçao As Integer
Dim linha2 As Integer


Private Sub cmdaddLista_Click()
Call desativar
If mskcodpe = Empty Or mskQtd = Empty Or txtNomepe = Empty Then
MsgBox "É necessários Informações para adicionar", vbExclamation
Exit Sub
Else

Dim c As Integer
c = 1
With FlexItem
While c < .Rows

If .TextMatrix(c, 0) = mskcodpe Then

    .TextMatrix(c, 0) = mskcodpe

    .TextMatrix(c, 2) = .TextMatrix(c, 2) + CCur(mskQtd)
        If tabelas2.State = adStateOpen Then tabelas2.Close
    tabelas2.Open "Preços", conecta, adOpenKeyset, adLockOptimistic
    
    If tabelas2.State = adStateOpen Then tabelas2.Close
    
    tabelas2.Open "select * from preços where Codpe=" & mskcodpe
    .TextMatrix(c, 3) = Format(tabelas2!Preço, "R$#,##0.00;($#,##0.00)")
    .TextMatrix(c, 4) = Format(.TextMatrix(c, 2) * Replace(.TextMatrix(c, 3), "R$", ""), "R$#,##0.00;($#,##0.00)")
    tabelas3.Open "Peças", conecta, adOpenKeyset, adLockOptimistic
    
    If tabelas3.State = adStateOpen Then tabelas3.Close
    
    tabelas3.Open "select * from peças where codigo=" & mskcodpe
    
    .TextMatrix(c, 1) = tabelas3!nome
    tabelas2.Close
    tabelas3.Close
    GoTo t
End If
   c = c + 1
Wend

.Rows = FlexItem.Rows + 1
.TextMatrix(linha, 0) = mskcodpe
.TextMatrix(linha, 2) = mskQtd
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Preços", conecta, adOpenKeyset, adLockOptimistic
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "select * from preços where Codpe=" & mskcodpe
.TextMatrix(linha, 3) = Format(tabelas2!Preço, "R$#,##0.00;($#,##0.00)")
.TextMatrix(linha, 4) = Format(.TextMatrix(linha, 2) * Replace(.TextMatrix(linha, 3), "R$", ""), "R$#,##0.00;($#,##0.00)")
If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "Peças", conecta, adOpenKeyset, adLockOptimistic
If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "select * from peças where codigo=" & mskcodpe
.TextMatrix(linha, 1) = tabelas3!nome
tabelas3.Close
tabelas2.Close
If .TextMatrix(.Rows - 1, 0) = Empty Then .Rows = .Rows - 1
linha = linha + 1
t:
linha2 = 1
cc = 1
While cc <= .Rows
If linha2 >= .Rows Then
GoTo p
End If
total(1) = Replace(.TextMatrix(linha2, 4), "R$", "")
total(2) = total(2) + total(1)
txtValor_Total = Format(total(2), "R$#,##0.00;($#,##0.00)")
cc = cc + 1
linha2 = linha2 + 1
Wend
p:

End With
End If
total(1) = 0
total(2) = 0

Call ativar


End Sub

Private Sub cmdAnt_Click()
 Call desativar
             If mskNumPed = Empty Then
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

Private Sub cmdBuscar_Click()

 Call desativar
If mskCodfor = Empty And txtNomeFor = Empty Then

Else
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Select * from Fornecedores", conecta, adOpenKeyset, adLockOptimistic

If tabelas2.State = adStateOpen Then tabelas2.Close

If txtNomeFor <> Empty Then
tabelas2.Open "Select * from Fornecedores where razaosocial like '%" & txtNomeFor & "%'"
GoTo q
Else
tabelas2.Open "select * from Fornecedores where codigo=" & mskCodfor
q:
If tabelas2.EOF = False Or tabelas2.BOF = False Then

mskCodfor = tabelas2!codigo
txtNomeFor = tabelas2!razaosocial
End If
End If

tabelas2.Close

End If
'=======================================================
If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "Select * from Preços", conecta, adOpenKeyset, adLockOptimistic
tabelas3.Close
tabelas3.Open "Select * from Preços where codfor=" & mskCodfor

If tabelas3.EOF = True Or tabelas3.BOF = True Then
MsgBox "Código Inexistente", vbExclamation
tabelas3.Close

Exit Sub

ElseIf tabelas3.EOF = False And tabelas3.BOF = False Then

FlexPefor.Clear
FlexPefor.FormatString = "Cod Peça   |Nome             |Preço                 "
FlexPefor.Rows = 2
cont = 1
End If
With FlexPefor

While tabelas3.EOF = False

.TextMatrix(cont, 0) = tabelas3!codpe
.TextMatrix(cont, 2) = Format(tabelas3!Preço, "R$#,##0.00;($#,##0.00)")

If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "peças", conecta, adOpenKeyset, adLockOptimistic
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "select * from peças where codigo=" & tabelas3!codpe

.TextMatrix(cont, 1) = tabelas2!nome

FlexPefor.Rows = FlexPefor.Rows + 1
cont = cont + 1
tabelas3.MoveNext

Wend
.Rows = .Rows - 1
End With

Call ativar

End Sub

Private Sub cmdBuscar_Pedido_Click()
Call desativar
If mskNumPed = Empty Then
        MsgBox "É necessários código", vbExclamation
Exit Sub

Else
   
    If tabelas.State = adStateOpen Then tabelas.Close

        tabelas.Open "select * from Ped_Comp where Codigo=" & mskNumPed
        If tabelas2.State = adStateOpen Then tabelas2.Close
        tabelas2.Open "Ped_Comp_itens", conecta, adOpenKeyset, adLockOptimistic
        tabelas2.Close
        tabelas2.Open "select * from Ped_comp_Itens where Cod_Ped=" & mskNumPed
         If tabelas.BOF = True And tabelas.EOF = True Then
        MsgBox "Código Inexistente", vbExclamation
        
        Else
            Call mostrar
        End If
End If



Call ativar
End Sub

Private Sub cmdExcluir_Click()
Call desativar
If mskNumPed = Empty Then
Else
Call ped_comp_Itens
conecta.Execute "delete * from Ped_comp_Itens where Cod_Ped=" & mskNumPed

conecta.Execute "delete * from Ped_Comp where Codigo=" & mskNumPed

status = "excluidos"
Call crash1
Call ped_comp_Itens
Call Ped_Comp
End If
cmdnovo.Enabled = True
End Sub

Private Sub cmdImprimir_Click()
With frmRela


 .Pictu.FontSize = 12

.Pictu.CurrentY = 1000

.Pictu.Print Tab(1 + 1); "Comprovante de ";
.Pictu.FontUnderline = True
.Pictu.Print "Pedido de Compra"
.Pictu.FontUnderline = False

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
.Pictu.Print Spc(32); "   São Paulo  "; Spc(1); DT.Value
.Pictu.Print String(150, "-")
Call desativar


If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Fornecedores", conecta, adOpenKeyset, adLockOptimistic


.Pictu.Print "   Nota Fiscal nº "; mskNumPed
.Pictu.Print "   Código do Fornecedor - "; mskCodfor,
.Pictu.Print "   Nome do Fornecedor - "; txtNomeFor


.Pictu.Print String(150, "-")
Call ativar
Dim er As Integer
er = 1
While er < FlexItem.Rows

.Pictu.Print " "; er; "- "; "Codigo-"; FlexItem.TextMatrix(er, 0); "   Nome-"; FlexItem.TextMatrix(er, 1); "   Quant-" & FlexItem.TextMatrix(er, 2) & "  " & "   Preço-" & FlexItem.TextMatrix(er, 3); "   Sub Total-"; FlexItem.TextMatrix(er, 4)
er = er + 1
       
 If er < FlexItem.Rows Then
.Pictu.ForeColor = &H8000000F
.Pictu.Print String(150, "-")
.Pictu.ForeColor = vbBlack
End If
       
Wend
.Pictu.Print String(150, "-")
.Pictu.Print "    Total - " & txtValor_Total;
.Pictu.Print Spc(20); Format(Now, "long date")


End With



End Sub

Private Sub cmdNovo_Click()
Dim limpar As Object
Call desativar
For Each limpar In Me.Controls
If TypeOf limpar Is TextBox Then limpar = Clear
If TypeOf limpar Is MaskEdBox Then limpar = Clear
If TypeOf limpar Is OptionButton Then limpar = Clear
Next
FlexItem.Clear
FlexPefor.Clear
FlexItem.FormatString = "  Código da Peça |                    Nome| Quantidade   |Preco Unitario   |Sub Total"
FlexItem.Rows = 2
FlexPefor.FormatString = "Cod Peça   |Nome             |Preço                 "
FlexPefor.Rows = 2
Call ativar

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

Private Sub cmdProx_Click()
 Call desativar
            If mskNumPed = Empty Then
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

Private Sub cmdRlista_Click()
With FlexItem
If .Rows = 2 Then
  If .TextMatrix(1, 4) = "" Then
  GoTo Y
  Else
  txtValor_Total = Format(Replace(txtValor_Total, "R$", "") - Replace(.TextMatrix(.Rows - 1, 4), "R$", ""), "R$#,##0.00;($#,##0.00)")
Y:
  .Clear
  .FormatString = "Código da Peça |                    Nome| Quantidade   |Preco Unitario   |Sub Total         "
  .Rows = 2
  cont = 1
  linha = 1
  total(1) = Clear
  total(2) = Clear
  total(3) = Clear
  total(4) = Clear

    End If
Else

   txtValor_Total = Format(Replace(txtValor_Total, "R$", "") - Replace(.TextMatrix(.Rows - 1, 4), "R$", ""), "R$#,##0.00;($#,##0.00)")
  .RemoveItem (.Rows - 1)
  
   linha = linha - 1

End If

End With
End Sub

Private Sub cmdSalvar_Click()
Call desativar
If mskCodfor = Empty Or txtNomeFor = Empty Or FlexItem.TextMatrix(1, 0) = Empty Or optSim = False And optNao = False Then
MsgBox "Preencha todos os campos", vbExclamation
Exit Sub
Else
status = "salvas"
Dim a As Integer
Dim b As Integer
 If mskNumPed = Empty Then
            If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 100
        While b = Empty
        
        tabelas.Close
        tabelas.Open "select * from Ped_Comp where Codigo=" & a
                If tabelas.BOF = False Or tabelas.EOF = False Then
            a = a + 1
                Else
            b = 1
            Call Ped_Comp
                End If
        Wend
            Else
        a = 100
            End If
        mskNumPed = a
        b = Clear
End If
        
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Ped_Comp", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from Ped_Comp where Codigo=" & mskNumPed
If tabelas2.BOF = False And tabelas2.EOF = False Then
If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbYes Then
'If MsgBox("Deseja salvar as auteraçoes?", vbQuestion + vbYesNo) = vbNo Then Exit Sub
status = "alteradas"
conecta.Execute "delete * from Ped_comp_Itens where Cod_Ped=" & mskNumPed
End If
Else
Call Ped_Comp
If status = "salvas" Then
tabelas.AddNew
End If

tabelas!codigo = mskNumPed
navegaçao = mskNumPed
tabelas!Cod_For = mskCodfor
tabelas!data = DT
tabelas!Hora = Hora
tabelas!Valor_Total = Replace(txtValor_Total, "R$", "")
tabelas!Pago = Pago
tabelas.Update

Dim c As Integer
c = 1

Call ped_comp_Itens
While c <= FlexItem.Rows - 1
tabelas.AddNew
tabelas!cod_ped = mskNumPed
tabelas!Cod_Peca = FlexItem.TextMatrix(c, 0)
tabelas!valor = Replace(FlexItem.TextMatrix(c, 3), "R$", "")
tabelas!Quantidade = FlexItem.TextMatrix(c, 2)
tabelas.Update
c = c + 1
Wend
End If
End If
status = Clear
Call Ped_Comp
Call crash1
Call ativar


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

Private Sub FlexPefor_Click()
Call desativar
mskcodpe = FlexPefor.TextMatrix(FlexPefor.Row, 0)
txtNomepe = FlexPefor.TextMatrix(FlexPefor.Row, 1)
Call ativar

End Sub

Private Sub Form_Activate()
Call Ped_Comp
Hora.Caption = Time

End Sub

Private Sub Form_Load()
Call Ped_Comp
 actskin.ApplySkin Me.hWnd
 actskin2.ApplySkin cmdSalvar.hWnd
 actskin2.ApplySkin cmdExcluir.hWnd
 actskin2.ApplySkin cmdnovo.hWnd
 actskin2.ApplySkin cmdImprimir.hWnd
 linha = 1
Dim cc As Integer
Dim l As Integer


End Sub

Private Sub Frame9_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
                       mouse1.Visible = True
imgBuscar.Visible = False

End Sub

Private Sub optNao_Click()
Pago = False
End Sub

Private Sub optsim_Click()
Pago = True
End Sub

Private Sub Timer1_Timer()
  If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub

Private Sub Timer2_Timer()
Hora.Caption = Time
End Sub

Private Sub desativar()
mskCodfor.PromptInclude = False
mskQtd.PromptInclude = False
mskcodpe.PromptInclude = False
mskQtd.PromptInclude = False
mskcodpe.PromptInclude = False
mskNumPed.PromptInclude = False


End Sub

Private Sub ativar()
mskCodfor.PromptInclude = True
mskQtd.PromptInclude = True
7 mskcodpe.PromptInclude = True
mskQtd.PromptInclude = True
mskcodpe.PromptInclude = True
mskNumPed.PromptInclude = True
End Sub

Private Sub mostrar()
mskNumPed = tabelas!codigo
navegaçao = tabelas!codigo
mskCodfor = tabelas!Cod_For
DT = tabelas!data
Hora = tabelas!Hora
txtValor_Total = Format(tabelas!Valor_Total, "R$#,##0.00;($#,##0.00)")
Pago = tabelas!Pago
If Pago = True Then optSim = True
If Pago = False Then optNao = True
c = 1

If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Ped_Comp_itens", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from Ped_comp_Itens where Cod_Ped=" & mskNumPed
If tabelas2.EOF = True And tabelas2.BOF = True Then
'MsgBox "Não há cadastros", vbExclamation
Else
tabelas2.MoveFirst
While tabelas2.EOF = False
FlexItem.TextMatrix(c, 0) = tabelas2!Cod_Peca
If tabelas3.State = adStateOpen Then tabelas3.Close
tabelas3.Open "Peças", conecta, adOpenKeyset, adLockOptimistic
tabelas3.Close
tabelas3.Open "select * from Peças where codigo=" & tabelas2!Cod_Peca
FlexItem.TextMatrix(c, 1) = tabelas3!nome
FlexItem.TextMatrix(c, 3) = Format(tabelas2!valor, "R$#,##0.00;($#,##0.00)")
FlexItem.TextMatrix(c, 2) = tabelas2!Quantidade
FlexItem.TextMatrix(c, 4) = Format(Replace(FlexItem.TextMatrix(c, 3), "R$", "") * Replace(FlexItem.TextMatrix(c, 2), "R$", ""), "R$#,##0.00;($#,##0.00)")
c = c + 1
tabelas2.MoveNext
FlexItem.Rows = FlexItem.Rows + 1
Wend
cmdBuscar = True
FlexItem.Rows = FlexItem.Rows - 1
End If

End Sub
Private Sub imgMouse_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
mouse1.Visible = False
imgBuscar.Visible = True
End Sub

Private Sub Image2_Click()
Me.Enabled = False
frmB7.Show

End Sub
