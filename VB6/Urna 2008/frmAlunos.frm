VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmAlunos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Alunos"
   ClientHeight    =   8985
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7230
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8985
   ScaleWidth      =   7230
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.TextBox txtInv 
      DataField       =   "Nome"
      DataSource      =   "adcAlunos"
      Height          =   285
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   10
      Top             =   8400
      Width           =   3735
   End
   Begin MSAdodcLib.Adodc adcAlunos 
      Height          =   375
      Left            =   3480
      Top             =   8520
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "provider=microsoft.jet.oledb.4.0; data source = bd1.mdb"
      OLEDBString     =   "provider=microsoft.jet.oledb.4.0; data source = bd1.mdb"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Matriculas"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin MSAdodcLib.Adodc adcCursos 
      Height          =   330
      Left            =   2160
      Top             =   8640
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "provider=microsoft.jet.oledb.4.0; data source = bd1.mdb"
      OLEDBString     =   "provider=microsoft.jet.oledb.4.0; data source = bd1.mdb"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Cursos"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   8175
      Left            =   120
      TabIndex        =   4
      Top             =   0
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   14420
      _Version        =   393216
      Tabs            =   1
      TabHeight       =   520
      TabCaption(0)   =   "Urna 2008"
      TabPicture(0)   =   "frmAlunos.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label14"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label13"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Image1"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Line1"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "stat"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Label2"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Label3"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "Shape1"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "SkinLabel2"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "dtcCursos"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "SkinLabel1"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "dtgAlunos"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "txtBusnome"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "cboTurma"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "Timer1"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "Timer2"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "cmdAlt"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "Timer3"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "Check1"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).ControlCount=   19
      Begin VB.CheckBox Check1 
         Caption         =   "Votou!"
         Height          =   255
         Left            =   5880
         TabIndex        =   15
         Top             =   2520
         Width           =   855
      End
      Begin VB.Timer Timer3 
         Interval        =   100
         Left            =   3480
         Top             =   480
      End
      Begin VB.CommandButton cmdAlt 
         Caption         =   "Atualizar lista"
         Height          =   495
         Left            =   3480
         TabIndex        =   11
         Top             =   480
         Width           =   1815
      End
      Begin VB.Timer Timer2 
         Interval        =   5000
         Left            =   3480
         Top             =   480
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   3480
         Top             =   480
      End
      Begin VB.ComboBox cboTurma 
         Height          =   315
         ItemData        =   "frmAlunos.frx":001C
         Left            =   3840
         List            =   "frmAlunos.frx":0026
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   2040
         Width           =   1935
      End
      Begin VB.TextBox txtBusnome 
         Height          =   285
         Left            =   240
         TabIndex        =   2
         Top             =   2520
         Width           =   5535
      End
      Begin MSDataGridLib.DataGrid dtgAlunos 
         Bindings        =   "frmAlunos.frx":0030
         Height          =   4575
         Left            =   120
         TabIndex        =   7
         Top             =   2880
         Width           =   6615
         _ExtentX        =   11668
         _ExtentY        =   8070
         _Version        =   393216
         AllowUpdate     =   0   'False
         BorderStyle     =   0
         HeadLines       =   1
         RowHeight       =   15
         FormatLocked    =   -1  'True
         BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ColumnCount     =   3
         BeginProperty Column00 
            DataField       =   "Num_Chamada"
            Caption         =   "Número"
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1046
               SubFormatType   =   0
            EndProperty
         EndProperty
         BeginProperty Column01 
            DataField       =   "Nome"
            Caption         =   "Nome"
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1046
               SubFormatType   =   0
            EndProperty
         EndProperty
         BeginProperty Column02 
            DataField       =   "Voto"
            Caption         =   "Voto"
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   5
               Format          =   ""
               HaveTrueFalseNull=   1
               TrueValue       =   "Votou"
               FalseValue      =   "Não Votou"
               NullValue       =   ""
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1046
               SubFormatType   =   7
            EndProperty
         EndProperty
         SplitCount      =   1
         BeginProperty Split0 
            BeginProperty Column00 
               ColumnWidth     =   1005,165
            EndProperty
            BeginProperty Column01 
               ColumnWidth     =   4004,788
            EndProperty
            BeginProperty Column02 
               ColumnWidth     =   1005,165
            EndProperty
         EndProperty
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmAlunos.frx":0048
         TabIndex        =   8
         Top             =   1680
         Width           =   1095
      End
      Begin MSDataListLib.DataCombo dtcCursos 
         Bindings        =   "frmAlunos.frx":00B0
         Height          =   315
         Left            =   240
         TabIndex        =   0
         Top             =   2040
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   556
         _Version        =   393216
         Style           =   2
         ListField       =   "Nome"
         BoundColumn     =   ""
         Text            =   "Cursos"
         Object.DataMember      =   ""
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   255
         Left            =   3840
         OleObjectBlob   =   "frmAlunos.frx":00C8
         TabIndex        =   9
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Shape Shape1 
         Height          =   255
         Left            =   5400
         Top             =   7800
         Width           =   1455
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "."
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   6120
         TabIndex        =   14
         Top             =   7800
         Width           =   735
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "."
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   5520
         TabIndex        =   13
         Top             =   7800
         Width           =   735
      End
      Begin VB.Label stat 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3480
         TabIndex        =   12
         Top             =   1080
         Width           =   825
      End
      Begin VB.Line Line1 
         X1              =   120
         X2              =   6840
         Y1              =   1560
         Y2              =   1560
      End
      Begin VB.Image Image1 
         Height          =   1035
         Left            =   0
         Picture         =   "frmAlunos.frx":0130
         Stretch         =   -1  'True
         Top             =   360
         Width           =   1185
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "JUSTIÇA"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   15.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   1440
         TabIndex        =   6
         Top             =   480
         Width           =   1275
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "ELEITORAL"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   15.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   1320
         TabIndex        =   5
         Top             =   960
         Width           =   1710
      End
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   4680
      OleObjectBlob   =   "frmAlunos.frx":BAE8
      Top             =   8400
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Destravar Urna"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   8400
      Width           =   1815
   End
End
Attribute VB_Name = "frmAlunos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Cod_C As Integer
Dim n_aluno As String
Dim t_aluno As String
Dim c_aluno As String
Dim V_Curso As String
Dim v_turma As String
Dim N_curso As String
Dim votou As String

Private Sub cboTurma_Click()
            On Error Resume Next
           
           If tabela.State = adStateOpen Then tabela.Close
           tabela.Open "Cursos", conecta, adOpenKeyset, adLockOptimistic
           If tabela.State = adStateOpen Then tabela.Close
           If dtcCursos = Empty Then Exit Sub
           If cboCurso = Empty Then cboTurma = "TÉCNICO EM INFORMÁTICA"
           tabela.Open "select * from Cursos where Nome = '" & dtcCursos & "'"
            Cod_C = tabela!Codigo
           With adcAlunos
           .CommandType = adCmdText
           .RecordSource = "select * from Matriculas  where Cod_Turma ='" & cboTurma & "'  and Cod_Curso like '" & Cod_C & "%' order by Num_Chamada"
           adcCursos.Refresh
           .Refresh
           dtgAlunos.Refresh
           End With
           txtBusnome = Clear
End Sub

Private Sub Check1_Click()
            If Check1 = 1 Then
            If dtcCursos.Text <> Empty Then
            adcAlunos.CommandType = adCmdText
            adcAlunos.RecordSource = " select * from Matriculas  where voto=-1 and Cod_Turma ='" & cboTurma & "'  and Cod_Curso like '" & Cod_C & "%' and Nome like '" & txtBusnome & "%' order by Num_Chamada"
            adcAlunos.Refresh
            dtgAlunos.Refresh
            Else
            adcAlunos.CommandType = adCmdText
            adcAlunos.RecordSource = " select * from Matriculas  where voto=-1  and Nome like '" & txtBusnome & "%' order by Num_Chamada"
            adcAlunos.Refresh
            dtgAlunos.Refresh
            End If
            Else
            If dtcCursos.Text = Empty Then
            adcAlunos.CommandType = adCmdText
            adcAlunos.RecordSource = " select * from Matriculas order by Num_Chamada"
            adcAlunos.Refresh
            dtgAlunos.Refresh
            Else
            adcAlunos.CommandType = adCmdText
            adcAlunos.RecordSource = " select * from Matriculas  where Cod_Turma ='" & cboTurma & "'  and Cod_Curso like '" & Cod_C & "%' and Nome like '" & txtBusnome & "%' order by Num_Chamada"
            adcAlunos.Refresh
            dtgAlunos.Refresh
            End If
            End If
End Sub

Private Sub cmdAlt_Click()
            adcAlunos.Refresh
            dtgAlunos.Refresh
End Sub

Private Sub Command1_Click()
'If stat.Caption = "Urna em Votação" Then Exit Sub
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "matriculas", conecta, adOpenKeyset, adLockOptimistic
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "select * from matriculas where nome = '" & txtInv & "'"
            If tabela!voto = -1 Then
            MsgBox "Este aluno já votou!", vbCritical, "Atençao"
            Beep
            Exit Sub
            End If
            
            
            
            
            If cboTurma.Text = Empty Or dtcCursos = Empty Then
            
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "matriculas", conecta, adOpenKeyset, adLockOptimistic
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "select * from matriculas where nome = '" & txtInv & "'"
            V_Curso = tabela!cod_curso
            v_turma = tabela!cod_turma
            
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "cursos", conecta, adOpenKeyset, adLockOptimistic
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "select * from cursos where codigo =" & V_Curso
            N_curso = tabela!nome
                
             If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "travar", conecta, adOpenKeyset, adLockOptimistic
            tabela.MoveFirst
            tabela!travar = 1
            tabela!turma = v_turma
            tabela!Curso = N_curso
            tabela!nome = txtInv.Text
            tabela.Update
            Command1.Enabled = False
            
          
            Else

           If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "travar", conecta, adOpenKeyset, adLockOptimistic
            tabela.MoveFirst
            tabela!travar = 1
            tabela!turma = cboTurma.Text
            tabela!Curso = dtcCursos.Text
            tabela!nome = txtInv.Text
            tabela.Update
            Command1.Enabled = False
            
            End If
            Exit Sub

2:
            MsgBox " Voce tentou destravar a urna ao mesmo tempo que esta estava em votação,Favor aguardar", vbInformation, "Atençaõi"
End Sub


Private Sub dtcCursos_Click(Area As Integer)
           On Error Resume Next
           
           If tabela.State = adStateOpen Then tabela.Close
           tabela.Open "Cursos", conecta, adOpenKeyset, adLockOptimistic
           If tabela.State = adStateOpen Then tabela.Close
         
           If dtcCursos = Empty Then Exit Sub
           
           If dtcCursos.Text = "INGLÊS" Then
            Call limparlista
              cboTurma.AddItem ("A")
              cboTurma.AddItem ("B")
              cboTurma.AddItem ("C")
              cboTurma.AddItem ("D")
           
              
           ElseIf dtcCursos.Text = "ELETROTÉCNICA" Then
             
             Call limparlista
              cboTurma.AddItem ("A")
              
              
              ElseIf dtcCursos.Text = "MECÂNICA GERAL" Then
               Call limparlista
              cboTurma.AddItem ("A")
              cboTurma.AddItem ("B")
              cboTurma.AddItem ("C")
             
             Else
             Call limparlista
              cboTurma.AddItem ("A")
              cboTurma.AddItem ("B")
           End If
           tabela.Open "select * from Cursos where Nome = '" & dtcCursos & "'"
            Cod_C = tabela!Codigo
           With adcAlunos
           .CommandType = adCmdText
           .RecordSource = "select * from Matriculas  where Cod_Turma ='" & cboTurma & "'  and Cod_Curso like '" & Cod_C & "%' order by Num_Chamada"
           adcCursos.Refresh
           .Refresh
           dtgAlunos.Refresh
           End With
           txtBusnome = Clear
             If cboTurma = Empty Then cboTurma = "A"
End Sub
Private Sub limparlista()
            cboTurma.Clear
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If Command1.Enabled = True Then If KeyAscii = 13 Then Command1 = True
End Sub

Private Sub Form_Load()
             Skin1.LoadSkin (App.Path & "\AniMode.skn") ' app.patch indica que o skin esta na mesma página que o projeto
             Skin1.ApplySkin Me.hWnd ' aplica o skin
             
             

End Sub


Private Sub Timer2_Timer()
            If vqvotos.State = adStateOpen Then vqvotos.Close
            vqvotos.Open "Matriculas", conecta, adOpenKeyset, adLockOptimistic
             If vqvotos.State = adStateOpen Then vqvotos.Close
            vqvotos.Open "select * from matriculas where voto=-1"
            Dim vq As Integer
            vq = vqvotos.RecordCount
            Label2.Caption = vq
            
             If vqvotos.State = adStateOpen Then vqvotos.Close
            vqvotos.Open "select * from matriculas where voto=0"
             vq = Clear
            vq = vqvotos.RecordCount
            Label3.Caption = vq
            
End Sub

Private Sub Timer3_Timer()
            If V_Status.State = adStateOpen Then V_Status.Close
            V_Status.Open "travar", conecta, adOpenKeyset, adLockOptimistic
            If V_Status!travar <> 0 Then
            stat.Caption = "Urna em Votaçao"
            stat.ForeColor = vbRed
            Else
            stat.Caption = "Urna Disponível"
            stat.ForeColor = vbBlue
            Command1.Enabled = True
            End If
End Sub

Private Sub txtBusnome_Change()

            If dtcCursos = Empty Then
            adcAlunos.CommandType = adCmdText
            adcAlunos.RecordSource = " select * from Matriculas  where  Nome like '" & txtBusnome & "%' order by Num_Chamada"
            adcAlunos.Refresh
            dtgAlunos.Refresh
            Else
            adcAlunos.CommandType = adCmdText
            adcAlunos.RecordSource = " select * from Matriculas  where Cod_Turma ='" & cboTurma & "'  and Cod_Curso like '" & Cod_C & "%' and Nome like '" & txtBusnome & "%' order by Num_Chamada"
            adcAlunos.Refresh
            dtgAlunos.Refresh
            End If
End Sub
