VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmPed_Des 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Pedidos de Modelos"
   ClientHeight    =   4890
   ClientLeft      =   2235
   ClientTop       =   1590
   ClientWidth     =   7395
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4890
   ScaleWidth      =   7395
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command5 
      Caption         =   "Imprimir Comprovante"
      Height          =   495
      Left            =   3480
      TabIndex        =   44
      Top             =   4200
      Width           =   1695
   End
   Begin VB.CommandButton cmdImprimir 
      Caption         =   "Visualizar Comprovante"
      Height          =   495
      Left            =   5280
      TabIndex        =   43
      Top             =   4200
      Width           =   1695
   End
   Begin VB.PictureBox imgBuscar 
      BorderStyle     =   0  'None
      Height          =   855
      Left            =   4320
      ScaleHeight     =   855
      ScaleWidth      =   915
      TabIndex        =   41
      Top             =   1200
      Visible         =   0   'False
      Width           =   915
      Begin VB.Image Image2 
         Height          =   855
         Left            =   0
         MouseIcon       =   "frmPed_Des.frx":0000
         MousePointer    =   99  'Custom
         Picture         =   "frmPed_Des.frx":030A
         Stretch         =   -1  'True
         Top             =   0
         Width           =   915
      End
   End
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   -3360
      ScaleHeight     =   675
      ScaleWidth      =   7095
      TabIndex        =   33
      Top             =   5040
      Width           =   7095
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmPed_Des.frx":C64C
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   39
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Des.frx":D316
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   38
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Des.frx":DBE0
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   37
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmPed_Des.frx":E8AA
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   36
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmPed_Des.frx":F574
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   35
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmPed_Des.frx":FE3E
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   34
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
         TabIndex        =   40
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame9 
      Caption         =   "Informações"
      Height          =   2775
      Left            =   120
      TabIndex        =   17
      Top             =   720
      Width           =   6975
      Begin VB.PictureBox mouse1 
         BorderStyle     =   0  'None
         Height          =   615
         Left            =   4320
         ScaleHeight     =   615
         ScaleWidth      =   675
         TabIndex        =   42
         Top             =   600
         Width           =   675
         Begin VB.Image imgMouse 
            Height          =   615
            Left            =   0
            MouseIcon       =   "frmPed_Des.frx":103C8
            MousePointer    =   99  'Custom
            Picture         =   "frmPed_Des.frx":106D2
            Stretch         =   -1  'True
            Top             =   0
            Width           =   675
         End
      End
      Begin VB.TextBox txtValor_Total 
         Height          =   405
         Left            =   3000
         TabIndex        =   30
         Top             =   2160
         Width           =   2292
      End
      Begin VB.Frame Frame2 
         Caption         =   "Pago"
         Height          =   612
         Left            =   480
         TabIndex        =   27
         Top             =   2040
         Width           =   1452
         Begin VB.OptionButton OpNao 
            Caption         =   "Não"
            Height          =   252
            Left            =   720
            TabIndex        =   29
            Top             =   240
            Width           =   612
         End
         Begin VB.OptionButton opSim 
            Caption         =   "Sim"
            Height          =   192
            Left            =   120
            TabIndex        =   28
            Top             =   240
            Width           =   612
         End
      End
      Begin VB.TextBox txtRazaoSocial 
         Height          =   405
         Left            =   2400
         TabIndex        =   26
         Top             =   1440
         Width           =   3375
      End
      Begin VB.CommandButton cmdBuscar_Cod_des 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   3360
         TabIndex        =   21
         Top             =   840
         Width           =   615
      End
      Begin VB.CommandButton cmdBuscar 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   3360
         TabIndex        =   20
         Top             =   360
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel17 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmPed_Des.frx":1CA14
         TabIndex        =   18
         Top             =   360
         Width           =   855
      End
      Begin MSMask.MaskEdBox mskCodPed 
         Height          =   375
         Left            =   2400
         TabIndex        =   19
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
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmPed_Des.frx":1CA7E
         TabIndex        =   22
         Top             =   840
         Width           =   2175
      End
      Begin MSMask.MaskEdBox mskCod_Des 
         Height          =   375
         Left            =   2400
         TabIndex        =   23
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
      Begin MSComCtl2.DTPicker DT 
         Height          =   375
         Left            =   5400
         TabIndex        =   24
         Top             =   480
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         Format          =   20643841
         CurrentDate     =   39737
      End
      Begin ACTIVESKINLibCtl.SkinLabel Hora 
         Height          =   375
         Left            =   5640
         OleObjectBlob   =   "frmPed_Des.frx":1CB00
         TabIndex        =   25
         Top             =   960
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmPed_Des.frx":1CB6E
         TabIndex        =   31
         Top             =   1440
         Width           =   1935
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   375
         Left            =   2040
         OleObjectBlob   =   "frmPed_Des.frx":1CBE4
         TabIndex        =   32
         Top             =   2160
         Width           =   735
      End
   End
   Begin VB.Frame Frame1 
      Height          =   735
      Left            =   120
      TabIndex        =   12
      Top             =   3480
      Width           =   2415
      Begin VB.CommandButton Command4 
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
         Picture         =   "frmPed_Des.frx":1CC4C
         TabIndex        =   16
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton Command3 
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
         Picture         =   "frmPed_Des.frx":1D08E
         TabIndex        =   15
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton Command2 
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
         Picture         =   "frmPed_Des.frx":1D4D0
         TabIndex        =   14
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton Command1 
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
         Picture         =   "frmPed_Des.frx":1D912
         TabIndex        =   13
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.Frame Frame4 
      Height          =   735
      Left            =   10800
      TabIndex        =   7
      Top             =   3600
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
         Picture         =   "frmPed_Des.frx":1DD54
         TabIndex        =   11
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
         Picture         =   "frmPed_Des.frx":1E196
         TabIndex        =   10
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
         Picture         =   "frmPed_Des.frx":1E5D8
         TabIndex        =   9
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
         Picture         =   "frmPed_Des.frx":1EA1A
         TabIndex        =   8
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.CommandButton cmdNovo 
      Caption         =   "Novo"
      Height          =   375
      Left            =   5400
      TabIndex        =   6
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton cmdExcluir 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   4200
      TabIndex        =   5
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton cmdSalvar 
      Caption         =   "Salvar"
      Height          =   375
      Left            =   3000
      TabIndex        =   4
      Top             =   3600
      Width           =   1095
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6975
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   120
         Top             =   -120
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1680
         OleObjectBlob   =   "frmPed_Des.frx":1EE5C
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   3960
         OleObjectBlob   =   "frmPed_Des.frx":1EEC0
         TabIndex        =   2
         Top             =   120
         Width           =   1335
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmPed_Des.frx":1EF2E
         TabIndex        =   3
         Top             =   120
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmPed_Des"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Pago As Boolean
Dim navegaçao As Integer
Private Sub cmdBuscar_Click()
Call desativar
If mskCodPed = Empty Then
MsgBox "É necesário codigo para busca", vbCritical
Exit Sub
Else
If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Select * from Ped_Des", conecta, adOpenKeyset, adLockOptimistic
tabelas.Close
tabelas.Open "Select * from Ped_Des where Codigo=" & mskCodPed
If tabelas.EOF = False And tabelas.BOF = False Then
Call mostrar
End If
End If



Call ativar
End Sub


Private Sub cmdBuscar_Cod_des_Click()
Call desativar
If mskCod_Des = Empty And txtRazaoSocial = Empty Then

Else
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Select * from Designe", conecta, adOpenKeyset, adLockOptimistic

If tabelas2.State = adStateOpen Then tabelas2.Close

If txtRazaoSocial <> Empty Then
tabelas2.Open "Select * from Designe where razaosocial like '%" & txtRazaoSocial & "%'"
GoTo q
Else
tabelas2.Open "select * from Designe where codigo=" & mskCod_Des
q:
If tabelas2.EOF = False Or tabelas2.BOF = False Then

mskCod_Des = tabelas2!codigo
txtRazaoSocial = tabelas2!razaosocial
End If
End If

tabelas2.Close

End If

End Sub

Private Sub cmdExcluir_Click()
Call desativar
If mskCodPed = Empty Then
Else
Call Ped_Des
On Error GoTo d
conecta.Execute "delete * from Ped_Des where Codigo=" & mskCodPed
status = "excluidos"
Call crash1
Call Ped_Des
cmdNovo = True
End If
Call ativar
Exit Sub
d:
MsgBox "Este Pedido não pode ser excluido pois ja possui um historico", vbExclamation
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


.Pictu.Print "   Nota Fiscal nº "; mskCodPed
.Pictu.Print "   Código do designer - "; mskCod_Des,
.Pictu.Print "   Nome do designer - "; txtRazaoSocial


.Pictu.Print String(150, "-")
.Pictu.Print "    Total - " & txtValor_Total;
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
opSim = False
OpNao = False
Hora.Caption = Time

End Sub

Private Sub cmdSalvar_Click()
Call desativar

Dim a As Integer
Dim b As Integer
 If mskCodPed = Empty Then
            If tabelas.EOF = False Or tabelas.BOF = False Then
        tabelas.MoveFirst
        a = 100
        While b = Empty
        
        tabelas.Close
        tabelas.Open "select * from Ped_Des where Codigo=" & a
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
        mskCodPed = a
        b = Clear
End If


If tabelas.State = adStateOpen Then tabelas.Close
tabelas.Open "Ped_Des", conecta, adOpenKeyset, adLockOptimistic
tabelas.Close
tabelas.Open "Select * from Ped_Des where codigo=" & mskCodPed
If tabelas.BOF = False And tabelas.EOF = False Then
If MsgBox("Deseja salvar as auterações", vbQuestion + vbYesNo + vbDefaultButton2) = vbYes Then
status = "alteradas"
End If
Else
status = "salvas"
If status = "salvas" Then
tabelas.AddNew
End If
 navegaçao = mskCodPed
    tabelas!codigo = mskCodPed
    tabelas!Cod_Des = mskCod_Des
    tabelas!valor = Replace(txtValor_Total, "R$", "")
    tabelas!Hora = Hora
    tabelas!data = DT
    tabelas!Pago = Pago
    tabelas.Update
    
Call crash1
End If

Call ativar
End Sub



Private Sub Command1_Click()
    Call desativar
            
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            Call mostrar
            Else
            MsgBox "NAO A CADASTRADOS", vbExclamation
            End If
            Call ativar
End Sub

Private Sub Command2_Click()
  
            Call desativar
            
            If mskCodPed = Empty Then
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
            MsgBox "NAO A CADASTRADOS", vbExclamation
            End If
            Call ativar
            End If
            End If
End Sub

Private Sub Command3_Click()
  Call desativar
            
              If mskCodPed = Empty Then
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
            MsgBox "NAO A CADASTRADOS", vbExclamation
            End If
            End If
            End If
            Call ativar
End Sub

Private Sub Command4_Click()

            Call desativar
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveLast
            Call mostrar
            Else
            MsgBox "NAO A CADASTRADOS", vbExclamation
            End If
            Call ativar
End Sub

Private Sub Command5_Click()


 Printer.FontSize = 12

Printer.CurrentY = 1000

Printer.Print Tab(1 + 1); "Comprovante de ";
Printer.FontUnderline = True
Printer.Print "Pedido de Compra"
Printer.FontUnderline = False

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
Printer.Print Spc(32); "   São Paulo  "; Spc(1); DT.Value
Printer.Print String(150, "-")
Call desativar


If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "Fornecedores", conecta, adOpenKeyset, adLockOptimistic


Printer.Print "   Nota Fiscal nº "; mskCodPed
Printer.Print "   Código do designer - "; mskCod_Des,
Printer.Print "   Nome do designer - "; txtRazaoSocial


Printer.Print String(150, "-")
Printer.Print "    Total - " & txtValor_Total;
Printer.Print Spc(20); Format(Now, "long date")


Printer.EndDoc



End Sub

Private Sub Form_Activate()
Call Ped_Des
End Sub

Private Sub Form_Load()
actskin.ApplySkin Me.hWnd
 actskin2.ApplySkin cmdSalvar.hWnd
 actskin2.ApplySkin cmdExcluir.hWnd
 actskin2.ApplySkin cmdNovo.hWnd
 actskin2.ApplySkin cmdImprimir.hWnd
 actskin2.ApplySkin Command5.hWnd
Call Ped_Des

Hora.Caption = Time
End Sub



Private Sub Frame9_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
                       mouse1.Visible = True
imgBuscar.Visible = False
End Sub

Private Sub OpNao_Click()
Pago = False
End Sub

Private Sub opSim_Click()
Pago = True

End Sub

Private Sub Timer1_Timer()
 If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub


Private Sub desativar()
mskCodPed.PromptInclude = False
mskCod_Des.PromptInclude = False
End Sub

Private Sub ativar()
mskCodPed.PromptInclude = True
mskCod_Des.PromptInclude = True
End Sub

Private Sub mostrar()
Call desativar
mskCodPed = tabelas!codigo
navegaçao = tabelas!codigo
mskCod_Des = tabelas!Cod_Des
cmdBuscar_Cod_des = True
txtValor_Total = Format(tabelas!valor, "R$#,##0.00;(R$#,##0.00)")
Hora = tabelas!Hora
DT = tabelas!data
Pago = tabelas!Pago
If Pago = True Then opSim = True
If Pago = False Then OpNao = True
Call ativar
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
frmB3.Show
B_designe = False

End Sub

