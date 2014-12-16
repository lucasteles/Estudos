VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmTipo_cor 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de Fornecedores"
   ClientHeight    =   4440
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   7140
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4440
   ScaleWidth      =   7140
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox SSTab1 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   120
      ScaleHeight     =   675
      ScaleWidth      =   7095
      TabIndex        =   23
      Top             =   4440
      Width           =   7095
      Begin VB.PictureBox pctExcluir 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         Picture         =   "frmTipo.frx":0000
         ScaleHeight     =   495
         ScaleWidth      =   375
         TabIndex        =   29
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox pctSalvar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmTipo.frx":0CCA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   28
         Top             =   120
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.PictureBox pctNovo 
         BackColor       =   &H80000009&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmTipo.frx":1594
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   27
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctBuscar 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   120
         Picture         =   "frmTipo.frx":225E
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   26
         Top             =   120
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.PictureBox pctluxus 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   120
         Picture         =   "frmTipo.frx":2F28
         ScaleHeight     =   375
         ScaleWidth      =   495
         TabIndex        =   25
         Top             =   120
         Width           =   495
      End
      Begin VB.PictureBox pctNav 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   240
         Picture         =   "frmTipo.frx":37F2
         ScaleHeight     =   375
         ScaleWidth      =   375
         TabIndex        =   24
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
         TabIndex        =   30
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   0
      Top             =   0
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
      Height          =   3855
      Left            =   0
      TabIndex        =   4
      Top             =   600
      Width           =   7095
      Begin VB.Frame Frame3 
         Caption         =   "Cores"
         Height          =   1575
         Left            =   240
         TabIndex        =   13
         Top             =   2040
         Width           =   6735
         Begin VB.CommandButton cmdLimpar2 
            Caption         =   "Limpar"
            Height          =   375
            Left            =   5520
            TabIndex        =   22
            Top             =   960
            Width           =   1095
         End
         Begin VB.TextBox txtNomeC 
            Height          =   375
            Left            =   1080
            TabIndex        =   18
            Top             =   480
            Width           =   2655
         End
         Begin VB.TextBox txtSiglaC 
            Height          =   375
            Left            =   1080
            MaxLength       =   2
            TabIndex        =   17
            Top             =   960
            Width           =   855
         End
         Begin VB.CommandButton cmdExclu2 
            Caption         =   "Excluir"
            Height          =   375
            Left            =   5520
            TabIndex        =   16
            Top             =   600
            Width           =   1095
         End
         Begin VB.CommandButton cmdSalvar2 
            Caption         =   "Salvar"
            Height          =   375
            Left            =   5520
            TabIndex        =   15
            Top             =   240
            Width           =   1095
         End
         Begin VB.ListBox lstCores 
            Height          =   1230
            Left            =   3840
            TabIndex        =   14
            Top             =   240
            Width           =   1335
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
            Height          =   255
            Left            =   240
            OleObjectBlob   =   "frmTipo.frx":3D7C
            TabIndex        =   19
            Top             =   480
            Width           =   735
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
            Height          =   495
            Left            =   360
            OleObjectBlob   =   "frmTipo.frx":3DE2
            TabIndex        =   20
            Top             =   960
            Width           =   615
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Tipos"
         Height          =   1695
         Left            =   240
         TabIndex        =   5
         Top             =   240
         Width           =   6735
         Begin VB.CommandButton cmdLimpar 
            Caption         =   "Limpar"
            Height          =   375
            Left            =   5520
            TabIndex        =   21
            Top             =   960
            Width           =   1095
         End
         Begin VB.ListBox LstTipos 
            Height          =   1230
            Left            =   3840
            TabIndex        =   12
            Top             =   240
            Width           =   1335
         End
         Begin VB.CommandButton cmdSalvar 
            Caption         =   "Salvar"
            Height          =   375
            Left            =   5520
            TabIndex        =   11
            Top             =   240
            Width           =   1095
         End
         Begin VB.CommandButton cmdExclu 
            Caption         =   "Excluir"
            Height          =   375
            Left            =   5520
            TabIndex        =   10
            Top             =   600
            Width           =   1095
         End
         Begin VB.TextBox txtSiglaT 
            Height          =   375
            Left            =   1080
            MaxLength       =   3
            TabIndex        =   8
            Top             =   960
            Width           =   855
         End
         Begin VB.TextBox txtNomeT 
            Height          =   375
            Left            =   1080
            TabIndex        =   6
            Top             =   360
            Width           =   2655
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
            Height          =   255
            Left            =   240
            OleObjectBlob   =   "frmTipo.frx":3E4A
            TabIndex        =   7
            Top             =   360
            Width           =   735
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   495
            Left            =   360
            OleObjectBlob   =   "frmTipo.frx":3EB0
            TabIndex        =   9
            Top             =   960
            Width           =   615
         End
      End
   End
   Begin VB.Frame Frame5 
      Height          =   615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7095
      Begin ACTIVESKINLibCtl.SkinLabel lbl1 
         Height          =   375
         Left            =   1800
         OleObjectBlob   =   "frmTipo.frx":3F18
         TabIndex        =   1
         Top             =   120
         Visible         =   0   'False
         Width           =   375
      End
      Begin ACTIVESKINLibCtl.SkinLabel lbl 
         Height          =   375
         Left            =   4920
         OleObjectBlob   =   "frmTipo.frx":3F7A
         TabIndex        =   2
         Top             =   120
         Width           =   1815
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
         Height          =   375
         Left            =   480
         OleObjectBlob   =   "frmTipo.frx":3FEE
         TabIndex        =   3
         Top             =   120
         Width           =   1455
      End
   End
End
Attribute VB_Name = "frmTipo_cor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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

Private Sub cmdExclu_Click()
Call Tirar
           If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If txtNomeT = Empty Then
x:
           MsgBox "Nao pode exluir", vbCritical
           Exit Sub
           Else
           On Error GoTo d
           conecta.Execute "delete * from tipos where nome = '" & txtNomeT & "'"
           On Error GoTo x
           LstTipos.Text = txtNomeT
           LstTipos.RemoveItem (LstTipos.ListIndex)
            txtNomeT = Clear
            txtSiglaT = Clear
           status = "excluidos"
           Call crash1
           End If
           End If
          
         Call por
         Exit Sub
d:
MsgBox "Este tipo não pode ser excluido pois ja possui um historico", vbExclamation
End Sub

Private Sub cmdExclu_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exclui um Registro"
pctExcluir.Visible = True
pctluxus.Visible = False
pctNovo.Visible = False
pctSalvar.Visible = False
End Sub



Private Sub cmdExclu2_Click()
Call Tirar
 If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2) = vbYes Then
           If txtNomeC = Empty Then
v:
           MsgBox "Nao pode exluir", vbCritical
           Exit Sub
           Else
           On Error GoTo d
           conecta.Execute "delete * from cores where nome = '" & txtNomeC & "'"
         On Error GoTo v
           lstCores.Text = txtNomeC
            lstCores.RemoveItem (lstCores.ListIndex)
            txtNomeC = Clear
            txtSiglaC = Clear
           status = "excluidos"
           Call crash1
           End If
           End If
          Call por
          Exit Sub
d:
MsgBox "Esta cor não pode ser excluido pois ja possui um historico", vbExclamation
End Sub

Private Sub cmdExclu2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Exclui um Registro"
pctExcluir.Visible = True
pctluxus.Visible = False
pctNovo.Visible = False
pctSalvar.Visible = False
End Sub

Private Sub cmdLimpar_Click()
txtNomeT = Clear
txtSiglaT = Clear
End Sub

Private Sub cmdLimpar2_Click()
txtNomeC = Clear
txtSiglaC = Clear
End Sub

Private Sub cmdSalvar_Click()
Call Tirar
If txtNomeT = Empty Or txtSiglaT = Empty Then
MsgBox "Nao pode haver campos em branco!"
Exit Sub
End If

If Len(txtSiglaT) < 3 Then
MsgBox "A sigla deve conter no minimo 3 caracteres", vbInformation
Exit Sub
End If

Call tipos
status = "salvas"

tabelas.Close
tabelas.Open "select * from tipos where nome= '" & txtNomeT & "'"
If tabelas.EOF = False Or tabelas.BOF = False Then
If MsgBox("Deseja salvar as alteraçoes?", vbQuestion + vbYesNo) = vbYes Then
status = "Alteradas"
Else
Exit Sub
End If
End If

If status = "salvas" Then
tabelas.AddNew
LstTipos.AddItem (txtNomeT)
End If
tabelas!nome = txtNomeT
tabelas!Sigla = txtSiglaT
tabelas.Update
Call crash1
Call tipos
status = Clear
Call por
End Sub


Private Sub cmdSalvar_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Salva um cadastro"
pctSalvar.Visible = True
pctluxus.Visible = False
pctExcluir.Visible = False
pctNovo.Visible = False
End Sub


Private Sub cmdSalvar2_Click()
Call Tirar
If txtNomeC = Empty Or txtSiglaC = Empty Then
MsgBox "Nao pode haver campos em branco!"
Exit Sub
End If

If Len(txtSiglaC) < 2 Then
MsgBox "A sigla deve conter no minimo 2 caracteres", vbInformation
Exit Sub
End If

Call cores
status = "salvas"

tabelas.Close
tabelas.Open "select * from cores where nome= '" & txtNomeC & "'"
If tabelas.EOF = False Or tabelas.BOF = False Then
If MsgBox("Deseja salvar as alteraçoes?", vbQuestion + vbYesNo) = vbYes Then status = "Alteradas"
End If

If status = "salvas" Then
tabelas.AddNew
lstCores.AddItem (txtNomeC)
End If
tabelas!nome = txtNomeC
tabelas!Sigla = txtSiglaC
tabelas.Update
Call crash1
Call tipos
status = Clear
Call por
End Sub

Private Sub cmdSalvar2_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
lblh.Caption = "Salva um cadastro"
pctSalvar.Visible = True
pctluxus.Visible = False
pctExcluir.Visible = False
pctNovo.Visible = False
End Sub





Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            SendKeys "{Tab}"
            End If

End Sub


Private Sub Form_Load()

             actskin.ApplySkin Me.hWnd

             actskin2.ApplySkin (cmdSalvar.hWnd)
             actskin2.ApplySkin (cmdLimpar.hWnd)
             actskin2.ApplySkin (cmdExclu.hWnd)
              actskin2.ApplySkin (cmdSalvar2.hWnd)
             actskin2.ApplySkin (cmdLimpar2.hWnd)
             actskin2.ApplySkin (cmdExclu2.hWnd)
             
             actskin2.ApplySkin (Frame5.hWnd)
           
         
            Call tipos
            Dim cont As Integer
            
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            LstTipos.AddItem (tabelas!nome)
            
            While cont = Empty
            tabelas.MoveNext
            If tabelas.EOF = False Then
            LstTipos.AddItem (tabelas!nome)
            Else
            cont = 1
            End If
            Wend
            cont = Clear
            
            Call cores
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            lstCores.AddItem (tabelas!nome)
            
            While cont = Empty
            tabelas.MoveNext
            If tabelas.EOF = False Then
            lstCores.AddItem (tabelas!nome)
            Else
            cont = 1
            End If
            Wend
            
           End If
            End If
            
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
            Call tipos
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




Private Sub Timer1_Timer()
             If lbl.Left < 2305 Then lbl1.Visible = True
             If lbl.Left > 2280 Then lbl.Left = lbl.Left - 25
End Sub





Private Sub Frame3_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
 pctSalvar.Visible = False
            pctExcluir.Visible = False
            pctNovo.Visible = False
            pctBuscar.Visible = False
            pctNav.Visible = False
            lblh.Caption = "Luxus System"
            pctluxus.Visible = True
Call cores
End Sub

Private Sub lstCores_Click()
txtNomeC = lstCores.Text
If tabelas2.State = adStateOpen Then tabelas2.Close

tabelas2.Open "cores", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from cores where nome= '" & txtNomeC & "'"
If tabelas2.EOF = False Or tabelas2.BOF = False Then
txtSiglaC = tabelas2!Sigla
End If
tabelas2.Close

End Sub

Private Sub LstTipos_Click()
txtNomeT = LstTipos.Text
If tabelas2.State = adStateOpen Then tabelas2.Close
tabelas2.Open "tipos", conecta, adOpenKeyset, adLockOptimistic
tabelas2.Close
tabelas2.Open "select * from Tipos where nome= '" & txtNomeT & "'"
If tabelas2.EOF = False Or tabelas2.BOF = False Then
txtSiglaT = tabelas2!Sigla
End If
tabelas2.Close

End Sub
