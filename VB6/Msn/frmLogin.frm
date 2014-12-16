VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmLogin 
   Caption         =   "GDP'Messenger"
   ClientHeight    =   7470
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3750
   BeginProperty Font 
      Name            =   "Comic Sans MS"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   7470
   ScaleWidth      =   3750
   StartUpPosition =   3  'Windows Default
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   375
      Left            =   480
      OleObjectBlob   =   "frmLogin.frx":0000
      TabIndex        =   5
      Top             =   6960
      Width           =   2775
   End
   Begin VB.Frame frmLogin 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   240
      TabIndex        =   0
      Top             =   0
      Width           =   3255
      Begin VB.TextBox txtlogin 
         Height          =   285
         Left            =   240
         TabIndex        =   4
         Text            =   "Ewerton"
         Top             =   840
         Width           =   1815
      End
      Begin VB.TextBox txtSenha 
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   240
         PasswordChar    =   "*"
         TabIndex        =   3
         Text            =   "123456"
         Top             =   1200
         Width           =   1815
      End
      Begin VB.CommandButton cmdEntrar 
         Caption         =   "Entrar"
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2160
         TabIndex        =   2
         Top             =   840
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   615
         Left            =   120
         OleObjectBlob   =   "frmLogin.frx":0088
         TabIndex        =   1
         Top             =   0
         Width           =   3015
      End
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   2760
      OleObjectBlob   =   "frmLogin.frx":0100
      Top             =   240
   End
   Begin VB.Frame frmA 
      Height          =   6735
      Left            =   240
      TabIndex        =   6
      Top             =   120
      Visible         =   0   'False
      Width           =   3255
      Begin VB.CommandButton cmdOff 
         Caption         =   "Sair"
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   480
         TabIndex        =   10
         Top             =   6150
         Width           =   2175
      End
      Begin VB.ListBox cmbOn 
         BackColor       =   &H00FFC0C0&
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   4905
         ItemData        =   "frmLogin.frx":0334
         Left            =   240
         List            =   "frmLogin.frx":0336
         TabIndex        =   9
         Top             =   840
         Width           =   2775
      End
      Begin VB.CommandButton cmdAtu 
         Caption         =   "Atualizar"
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   1200
         TabIndex        =   8
         Top             =   360
         Width           =   1815
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmLogin.frx":0338
         TabIndex        =   7
         Top             =   360
         Width           =   855
      End
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAbrir_Click()

End Sub

Private Sub cmbOn_DblClick()
On Error Resume Next
If cmbOn.Text <> Empty Then
If usu.State = adStateOpen Then usu.Close
usu.Open "Select * from usuarios where codigo =" & Codigos(cmbOn.ListIndex + 1)
Rec = 1

While Rec <> 0
    If cod_rec(Rec) = 0 Then
        cod_rec(Rec) = usu!codigo
        nome_rec(Rec) = usu!usuario
        GoTo B
    End If
Rec = Rec + 1
Wend
B:

conectar.Execute "create table " & usu!codigo & "_" & cod_usuario & " (Codigo int primary key, texto char(255), codUsu int, codRec int)"
conectar.Execute "create table " & cod_usuario & "_" & usu!codigo & " (Codigo int primary key, texto char(255), codUsu int, codRec int)"
frmMsg.Show

If frmMsg.TabStrip1.Tabs.Item(1).Caption = "" Then
frmMsg.TabStrip1.Tabs.Item(1).Caption = UCase(nome_rec(Rec))
TABcod(1) = usu!codigo
Else
frmMsg.TabStrip1.Tabs.Add
frmMsg.TabStrip1.Tabs.Item(frmMsg.TabStrip1.Tabs.Count).Caption = UCase(usu!usuario)
TABcod(frmMsg.TabStrip1.Tabs.Count) = usu!codigo
End If
End If

End Sub

Private Sub cmdAtu_Click()
Call on_line
End Sub

Private Sub cmdEntrar_Click()

            Dim senha As String
            If txtlogin = Clear Or txtSenha = Clear Then
            MsgBox "Insira o Login e Senha", vbInformation, "Atenção"
            Exit Sub
            End If
            
            If Tabelas.State = adStateOpen Then Tabelas.Close
            Tabelas.Open "select * from Usuarios where usuario ='" & Replace(txtlogin, "'", "''") & "'"
            senha = Tabelas!senha
            If Tabelas.BOF = True Or Tabelas.EOF = True Then
            MsgBox "Usuario ou Senha Inválido!", vbExclamation, "Usuario ou Senha Inválido"
            ElseIf senha = txtSenha Then
            cod_usuario = Tabelas!codigo
            nome_usuario = txtlogin
            Tabelas!On = 1
            Tabelas.Update
            frmLogin.Visible = False
            frmA.Visible = True
            Call on_line
            Else
            MsgBox "Usuario ou Senha Inválido!", vbExclamation, "Usuario ou Senha Inválido"
            Exit Sub
            End If

End Sub


Private Sub cmdOff_Click()
            If Tabelas.State = adStateOpen Then Tabelas.Close
            Tabelas.Open "select * from Usuarios where usuario ='" & nome_usuario & "'"
            If Tabelas.BOF = False And Tabelas.EOF = False Then
             
            Tabelas!On = 0
            Tabelas.Update
            frmLogin.Visible = True
            frmA.Visible = False
            End If
End Sub

Private Sub Form_Load()
Call abrir_banco
If Tabelas.State = adStateOpen Then Tabelas.Close
Tabelas.Open "usuarios", conectar, adOpenKeyset, adLockOptimistic
Skin1.LoadSkin (App.Path & "\IceCold.skn")
Skin1.ApplySkin Me.hWnd
End Sub

Private Sub Timer1_Timer()

End Sub

Private Sub on_line()
If usu.State = adStateOpen Then usu.Close
usu.Open "Usuarios", conectar, adOpenKeyset, adLockOptimistic
cmbOn.Clear
While usu.EOF = False
If usu!usuario <> nome_usuario Then
If usu!On = 1 Then
cont = cont + 1
cmbOn.AddItem (usu!usuario)
Codigos(cont) = usu!codigo
End If
End If
usu.MoveNext
Wend
cont = Empty
End Sub

Private Sub Form_Unload(Cancel As Integer)
            cmdOff = True
End Sub
