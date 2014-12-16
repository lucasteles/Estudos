VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmGrafico 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Graficos"
   ClientHeight    =   8085
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9195
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8085
   ScaleWidth      =   9195
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command5 
      Caption         =   "Imprimir"
      Height          =   375
      Left            =   5880
      TabIndex        =   7
      Top             =   7440
      Width           =   2415
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   3960
      OleObjectBlob   =   "frmGrafico.frx":0000
      Top             =   120
   End
   Begin VB.CommandButton Command3 
      Caption         =   "3D "
      Height          =   375
      Left            =   5640
      TabIndex        =   6
      Top             =   840
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Coluna"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   0
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Setor"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   0
      Width           =   1455
   End
   Begin VB.CommandButton Command4 
      Caption         =   "2D "
      Height          =   375
      Left            =   5640
      TabIndex        =   3
      Top             =   840
      Visible         =   0   'False
      Width           =   1095
   End
   Begin MSChart20Lib.MSChart MSChart1 
      Height          =   6855
      Left            =   120
      OleObjectBlob   =   "frmGrafico.frx":0234
      TabIndex        =   0
      Top             =   360
      Width           =   8895
   End
   Begin MSChart20Lib.MSChart MSChart2 
      Height          =   6855
      Left            =   120
      OleObjectBlob   =   "frmGrafico.frx":1D6E
      TabIndex        =   1
      Top             =   360
      Visible         =   0   'False
      Width           =   8895
   End
   Begin MSChart20Lib.MSChart MSChart3 
      Height          =   6855
      Left            =   120
      OleObjectBlob   =   "frmGrafico.frx":3BE2
      TabIndex        =   2
      Top             =   360
      Visible         =   0   'False
      Width           =   8895
   End
End
Attribute VB_Name = "frmGrafico"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
MSChart1.Visible = False
MSChart2.Visible = True
Command1.Visible = False
Command2.Visible = True
Command3.Visible = False
MSChart3.Visible = False
Command4.Visible = False
End Sub

Private Sub Command2_Click()
MSChart1.Visible = True
MSChart2.Visible = False
Command2.Visible = False
Command1.Visible = True
Command3.Visible = True
MSChart3.Visible = False
Command4.Value = True

End Sub

Private Sub Command3_Click()
            MSChart1.Visible = False
            MSChart2.Visible = False
            MSChart3.Visible = True
            Command4.Visible = True
            Command3.Visible = False
End Sub

Private Sub Command4_Click()
MSChart1.Visible = True
            MSChart2.Visible = False
            MSChart3.Visible = False
            Command3.Visible = True
            Command4.Visible = False
            End Sub



Private Sub Command5_Click()
frmimp.Show
End Sub

Private Sub Form_Activate()
  If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
           If tabela!foda = 1 Then GoTo sexo
 
 If tabela.State = adStateOpen Then tabela.Close
             tabela.Open " select * from cand where votos <> 0 "
             
                   
             If tabela.BOF = False Or tabela.EOF = False Then
                Unload Me
                Exit Sub
                Else
sexo:
                frmGrafico.Show
             End If
End Sub

Private Sub Form_Load()
              If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic
             Skin1.LoadSkin (App.Path & "\AniMode.skn") ' app.patch indica que o skin esta na mesma página que o projeto
             Skin1.ApplySkin Me.hWnd ' aplica o skin


  If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
           If tabela!foda = 1 Then GoTo sexo

 If tabela.State = adStateOpen Then tabela.Close
             tabela.Open " select * from cand where votos <> 0 "
             
                   
             If tabela.BOF = False Or tabela.EOF = False Then
                MsgBox "A eleição foi iniciada. Nenhuma informação pode ser alterada", vbInformation
                Unload Me
                Exit Sub
                Else
sexo:
                frmGrafico.Show
             End If


If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic



            X = Clear
            grafic = 1
            If tabela.EOF = False Or tabela.BOF = False Then
            tabela.MoveFirst
            MSChart1.Row = grafic
             MSChart1.RowLabel = tabela!nome
             MSChart1.Data = tabela!votos
             MSChart1.ColumnLabel = "votos"
            While X = Empty
            tabela.MoveNext
            If tabela.EOF = False Then
            grafic = grafic + 1
            MSChart1.RowCount = grafic
             MSChart1.Row = grafic
             MSChart1.RowLabel = tabela!nome
             MSChart1.Data = tabela!votos
           Else
            X = 1
            End If
            Wend
            
            X = Clear
            grafic = 1
            tabela.MoveFirst
            MSChart2.ColumnCount = grafic
            MSChart2.Column = grafic
             MSChart2.ColumnLabel = tabela!nome
             MSChart2.Data = tabela!votos
            While X = Empty
            tabela.MoveNext
            If tabela.EOF = False Then
            grafic = grafic + 1
            MSChart2.ColumnCount = grafic
            MSChart2.Column = grafic
             MSChart2.ColumnLabel = tabela!nome
             MSChart2.Data = tabela!votos
           Else
            X = 1
            End If
            Wend
           
           
             X = Clear
            grafic = 1
            tabela.MoveFirst
            MSChart3.Row = grafic
             MSChart3.RowLabel = tabela!nome
             MSChart3.Data = tabela!votos
             MSChart3.ColumnLabel = "votos"
            While X = Empty
            tabela.MoveNext
            If tabela.EOF = False Then
            grafic = grafic + 1
            MSChart3.RowCount = grafic
             MSChart3.Row = grafic
             MSChart3.RowLabel = tabela!nome
             MSChart3.Data = tabela!votos
           Else
            X = 1
            End If
            Wend
            
        End If
End Sub

