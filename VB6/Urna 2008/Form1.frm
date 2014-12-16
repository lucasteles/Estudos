VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H80000009&
   BorderStyle     =   0  'None
   Caption         =   "Urna by Lucas info-B "
   ClientHeight    =   11145
   ClientLeft      =   0
   ClientTop       =   225
   ClientWidth     =   15270
   Icon            =   "Form1.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form1.frx":0442
   ScaleHeight     =   11145
   ScaleWidth      =   15270
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   600
      Top             =   2280
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H8000000E&
      Height          =   5055
      Left            =   2160
      TabIndex        =   20
      Top             =   3240
      Visible         =   0   'False
      Width           =   6735
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackColor       =   &H8000000E&
         Caption         =   "FIM"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   80.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1935
         Left            =   1800
         TabIndex        =   21
         Top             =   1320
         Width           =   3150
      End
   End
   Begin VB.CommandButton cmdconf 
      Appearance      =   0  'Flat
      BackColor       =   &H00000040&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   13080
      Picture         =   "Form1.frx":240484
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   7560
      Width           =   1095
   End
   Begin VB.TextBox t2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   29.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   795
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   7200
      Width           =   735
   End
   Begin VB.TextBox t1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   29.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   795
      Left            =   2400
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   7200
      Width           =   735
   End
   Begin VB.CommandButton Command14 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   12840
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":2433E6
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   4320
      Width           =   735
   End
   Begin VB.CommandButton Command13 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   11880
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":24498C
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   4320
      Width           =   735
   End
   Begin VB.CommandButton Command12 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   10800
      MaskColor       =   &H00000000&
      Picture         =   "Form1.frx":245E9E
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   4320
      UseMaskColor    =   -1  'True
      Width           =   735
   End
   Begin VB.CommandButton Command11 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   12840
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":247320
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   5160
      Width           =   735
   End
   Begin VB.CommandButton Command10 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   11880
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":2489F2
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   5160
      Width           =   735
   End
   Begin VB.CommandButton Command9 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   10800
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":24A0C4
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   5160
      Width           =   735
   End
   Begin VB.CommandButton Command8 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   12840
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":24B796
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   6000
      Width           =   735
   End
   Begin VB.CommandButton Command7 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   11880
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":24D038
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   6000
      Width           =   735
   End
   Begin VB.CommandButton Command6 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   10800
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":24E8DA
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   6000
      Width           =   735
   End
   Begin VB.CommandButton Command5 
      BackColor       =   &H00000000&
      Height          =   615
      Left            =   11880
      MaskColor       =   &H00FFFFFF&
      Picture         =   "Form1.frx":2500DC
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   6840
      Width           =   735
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   10320
      Picture         =   "Form1.frx":251D56
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   7680
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   11640
      MaskColor       =   &H00000080&
      Picture         =   "Form1.frx":254450
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   7680
      Width           =   1095
   End
   Begin VB.Label lblCurso 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "asdf"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   435
      Left            =   600
      TabIndex        =   23
      Top             =   960
      Width           =   750
   End
   Begin VB.Label lblNome 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "asdf"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   27.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   660
      Left            =   600
      TabIndex        =   22
      Top             =   360
      Width           =   1155
   End
   Begin VB.Shape Shape3 
      Height          =   2415
      Left            =   2280
      Top             =   4560
      Width           =   2055
   End
   Begin VB.Image Image3 
      Height          =   1155
      Left            =   10080
      Picture         =   "Form1.frx":256C72
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1185
   End
   Begin VB.Shape Shape2 
      Height          =   735
      Left            =   4440
      Top             =   6120
      Width           =   3975
   End
   Begin VB.Shape Shape1 
      Height          =   735
      Left            =   4440
      Top             =   4920
      Width           =   3975
   End
   Begin VB.Image Image2 
      Height          =   1215
      Left            =   4440
      Picture         =   "Form1.frx":26262A
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   1455
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackColor       =   &H0000FF00&
      BackStyle       =   0  'Transparent
      Caption         =   "Confirma voto?"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   35.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   825
      Left            =   3120
      TabIndex        =   19
      Top             =   7080
      Visible         =   0   'False
      Width           =   5220
   End
   Begin VB.Label l1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   4560
      TabIndex        =   17
      Top             =   5040
      Width           =   90
   End
   Begin VB.Label l2 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   4680
      TabIndex        =   16
      Top             =   6240
      Width           =   90
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Partido"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   360
      Left            =   4440
      TabIndex        =   15
      Top             =   5760
      Width           =   870
   End
   Begin VB.Image Image1 
      Height          =   2415
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   4560
      Width           =   2055
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Nome do candidato"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   360
      Left            =   4440
      TabIndex        =   14
      Top             =   4560
      Width           =   2490
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim t3 As String
Dim vot As Integer
Dim caminho As String
Dim v_conf As Integer
Dim cont As Integer


Private Sub cmdconf_Click()

        If v_conf = 2 Then
        
            vot = tabela!votos
            vot = vot + 1
            conecta.Execute "update cand set votos='" & vot & "'  where cod_do_cand=111"
            vot = Clear
            Command2 = True
            v_conf = Clear
            Frame1.Visible = True
           Timer1.Enabled = True
           
          
          Call travar
           Command3.Enabled = False
           cmdconf.Enabled = False
           Command2.Enabled = False
           Form3.Show

        ElseIf v_conf = Empty Then
        
            If t1 = Empty Or t2 = Empty Then
            MsgBox "escolha um candidato", vbCritical, "uRNA"
            
            Else
            If tabela.BOF = True Or tabela.EOF = True Then
            tabela.Close
            tabela.Open "select * from cand where cod_do_cand=999"
            Call mostrar
            
            t1.Visible = False
            t2.Visible = False
            Label3.Visible = True
            t3 = 999
             Command3.Enabled = False
             v_conf = 1
            
            Else
            t1.Visible = False
            t2.Visible = False
            Label3.Visible = True
             Command3.Enabled = False
             v_conf = 1
              
            End If
            End If
           
            
           
         ElseIf v_conf = 1 Then
        
           
           tabela.Close
           tabela.Open "select * from cand where cod_do_cand=" & t3
           vot = tabela!votos
           vot = vot + 1
           conecta.Execute "update cand set votos='" & vot & "'  where cod_do_cand=" & t3
           Command2 = True
           vot = Clear
       
           t1.Visible = True
           t2.Visible = True
           Label3.Visible = False
           v_conf = Clear
           Command3.Enabled = True
           Frame1.Visible = True
           Timer1.Enabled = True
                    Call travar
                    Command3.Enabled = False
           cmdconf.Enabled = False
           Command2.Enabled = False
           Form3.Show
           End If
           tabela.Close
           tabela.Open "select * from cand"
           
           
End Sub



Private Sub Command10_Click()
If Not t2 = Empty Then

Else
               If t1 = Empty Then
            t1 = 5
            Else
            t2 = 5
            End If
            End If
End Sub

Private Sub Command11_Click()
If Not t2 = Empty Then

Else
   If t1 = Empty Then
            t1 = 6
            Else
            t2 = 6
            End If
            End If
End Sub

Private Sub Command12_Click()
            
If Not t2 = Empty Then

Else
            If t1 = Empty Then
            t1 = 1
            Else
            t2 = 1
            End If
            End If
End Sub

Private Sub Command13_Click()
If Not t2 = Empty Then

Else
               If t1 = Empty Then
            t1 = 2
            Else
            t2 = 2
            End If
            End If
End Sub

Private Sub Command14_Click()
If Not t2 = Empty Then

Else
               If t1 = Empty Then
            t1 = 3
            Else
            t2 = 3
            End If
            End If
End Sub

Private Sub Command15_Click()
            
End Sub

Private Sub Command2_Click()
   
            t1.Visible = True
            t2.Visible = True
            Label3.Visible = False
            Command3.Enabled = True
            vot = Clear
            v_conf = Clear

            t1 = Clear
            t2 = Clear
            l1.Caption = ""
            l2.Caption = ""
            Image1.Picture = LoadPicture("")
            Call destravar
            
End Sub




Private Sub Command2_KeyPress(KeyAscii As Integer)
If Not Command2.Enabled = False Then
 If KeyAscii = 44 Then Command2 = True
End If
  If KeyAscii = 13 Then cmdconf = True
End Sub

Private Sub Command3_Click()
            t1.Visible = False
            t2.Visible = False
            Label3.Visible = True
            v_conf = 2
            tabela.Close
            tabela.Open "select * from cand where cod_do_cand=111"
           Call travar
            Call mostrar
            Command3.Enabled = False
         Form1.KeyPreview = True
        cmdconf.SetFocus
            
End Sub


Private Sub Command5_Click()
If Not t2 = Empty Then

Else
   If t1 = Empty Then
            t1 = 0
            Else
            t2 = 0
            End If
            End If
End Sub

Private Sub Command6_Click()
If Not t2 = Empty Then

Else
   If t1 = Empty Then
            t1 = 7
            Else
            t2 = 7
            End If
            End If
End Sub

Private Sub Command7_Click()
If Not t2 = Empty Then

Else
   If t1 = Empty Then
            t1 = 8
            Else
            t2 = 8
            End If
            End If
End Sub

Private Sub Command8_Click()
If Not t2 = Empty Then

Else
   If t1 = Empty Then
            t1 = 9
            Else
            t2 = 9
            End If
            End If
End Sub

Private Sub Command9_Click()
If Not t2 = Empty Then

Else
               If t1 = Empty Then
            t1 = 4
            Else
            t2 = 4
            End If
            End If
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
If Command3.Enabled = True Then


If KeyAscii = 16 Then Unload Me
If KeyAscii = 15 Then Timer1.Enabled = True


            
            If KeyAscii = 48 Then Command5 = True
             If KeyAscii = 49 Then Command12 = True
              If KeyAscii = 50 Then Command13 = True
               If KeyAscii = 51 Then Command14 = True
                If KeyAscii = 52 Then Command9 = True
                 If KeyAscii = 53 Then Command10 = True
                  If KeyAscii = 54 Then Command11 = True
                   If KeyAscii = 55 Then Command6 = True
                    If KeyAscii = 56 Then Command7 = True
                     If KeyAscii = 57 Then Command8 = True
                     

                        If KeyAscii = 32 Then Command2 = True
                       If KeyAscii = 43 Then Command2 = True
                       If KeyAscii = 8 Then Command3 = True
                       If KeyAscii = 45 Then Command3 = True
                       If KeyAscii = 13 Then cmdconf = True
End If
If Not Command2.Enabled = False Then
 If KeyAscii = 43 Then Command2 = True
 If KeyAscii = 8 Then Command3 = True
 If KeyAscii = 32 Then Command2 = True
 
End If
End Sub

Private Sub Form_Load()
On Error Resume Next

frmSplash1.Show
        banco = "provider=microsoft.jet.oledb.4.0;data source =" & InputBox("Coloque o caminho da base Acces, sem estençao (.xxx)", "URNA-2008", "z:\BD1") & ".mdb"
        MsgBox banco, vbInformation, "urna-2008"
            Call conectar_banco
            
            
             If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic
    
            Call travar
            Form2.Show
            
End Sub

Private Sub mostrar()
On Error GoTo mostrar

            l1.Caption = tabela!Nome
            l2.Caption = tabela!partido
            caminho = tabela!Url
            Image1.Picture = LoadPicture(caminho)
            
mostrar:
 If Image1 = Empty Then
MsgBox "O windows nao pode encontrar o URL(endereço) da imagem, por favor no menu de cadastro de candidatos atualiza o caminho das fotos dos candidatos", vbCritical, "Urna"

Else
End If
            
End Sub




Private Sub Form_Unload(Cancel As Integer)
Unload Form2
End Sub

Private Sub t2_Change()

            t3 = t1 & t2
            If t3 = Empty Then t3 = 0
            tabela.Close
            tabela.Open "select * from cand where cod_do_cand=" & t3
            If tabela.EOF = False Or tabela.BOF = False Then
            Call mostrar
            End If
            If t2.Enabled = False Then
            GoTo FODASSE
            Else
            If t2 = Empty Then Else t2.SetFocus
            End If
FODASSE:
End Sub

Private Sub Timer1_Timer()
                Frame1.Visible = False
            Timer1.Enabled = False
            Call travar
            Form1.Enabled = False
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "select * from matriculas where nome like '" & lblNome.Caption & "%'"
            tabela!voto = -1
            tabela.Update
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "travar", conecta, adOpenKeyset, adLockOptimistic
            tabela.MoveFirst
            tabela!travar = 0
            tabela.Update
        
             Form2.Show
             Form2.Timer1.Enabled = True
             
             
End Sub


