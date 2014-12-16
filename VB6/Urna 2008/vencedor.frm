VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form vencedor 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Vencedor"
   ClientHeight    =   7770
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10470
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7770
   ScaleWidth      =   10470
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdOk 
      Caption         =   "OK"
      Height          =   375
      Left            =   7320
      TabIndex        =   21
      Top             =   7320
      Width           =   1575
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   7215
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   10185
      _ExtentX        =   17965
      _ExtentY        =   12726
      _Version        =   393216
      Style           =   1
      TabHeight       =   520
      TabCaption(0)   =   "Numero"
      TabPicture(0)   =   "vencedor.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Shape1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label5"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Image1"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Label3"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Label2"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Label4"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Label6"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "Label7"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "Label1"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "Label9"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "Shape2"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "Label14"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "Label13"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "Image2"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "text2"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "Text3"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "txt"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "Text1"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "Text4"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "txtB"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "txtN"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "Command5"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).ControlCount=   22
      TabCaption(1)   =   "Lista"
      TabPicture(1)   =   "vencedor.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "DataGrid1"
      Tab(1).Control(1)=   "Adodc1"
      Tab(1).Control(2)=   "cmdTodos"
      Tab(1).Control(3)=   "Frame1"
      Tab(1).Control(4)=   "Timer1"
      Tab(1).Control(5)=   "Text5"
      Tab(1).ControlCount=   6
      TabCaption(2)   =   "Grafico"
      TabPicture(2)   =   "vencedor.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "MSChart3"
      Tab(2).Control(1)=   "MSChart2"
      Tab(2).Control(2)=   "MSChart1"
      Tab(2).Control(3)=   "Command3"
      Tab(2).Control(4)=   "Command2"
      Tab(2).Control(5)=   "Command1"
      Tab(2).Control(6)=   "Command4"
      Tab(2).ControlCount=   7
      Begin VB.CommandButton Command5 
         Caption         =   "Vencedor"
         Height          =   495
         Left            =   360
         TabIndex        =   32
         Top             =   1320
         Width           =   1575
      End
      Begin VB.TextBox Text5 
         DataField       =   "cod_do_cand"
         DataSource      =   "Adodc1"
         Height          =   495
         Left            =   -75000
         TabIndex        =   30
         Text            =   "Text5"
         Top             =   6720
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   -74520
         Top             =   3600
      End
      Begin VB.CommandButton Command4 
         Caption         =   "2D"
         Height          =   375
         Left            =   -68760
         TabIndex        =   26
         Top             =   720
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.TextBox txtN 
         Height          =   375
         Left            =   6360
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   14
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox txtB 
         Height          =   375
         Left            =   6360
         Locked          =   -1  'True
         TabIndex        =   13
         Top             =   2760
         Width           =   975
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   8160
         TabIndex        =   12
         Top             =   360
         Visible         =   0   'False
         Width           =   150
      End
      Begin VB.TextBox Text1 
         Height          =   375
         Left            =   3360
         Locked          =   -1  'True
         TabIndex        =   11
         Top             =   6240
         Width           =   975
      End
      Begin VB.TextBox txt 
         Height          =   375
         Left            =   600
         Locked          =   -1  'True
         TabIndex        =   10
         Top             =   2640
         Width           =   975
      End
      Begin VB.TextBox Text3 
         Height          =   375
         Left            =   600
         Locked          =   -1  'True
         MaxLength       =   30
         TabIndex        =   9
         Top             =   4920
         Width           =   2055
      End
      Begin VB.TextBox text2 
         Height          =   375
         Left            =   600
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   8
         Top             =   3840
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Busca"
         Height          =   1575
         Left            =   -74880
         TabIndex        =   5
         Top             =   600
         Width           =   2295
         Begin VB.ComboBox cmbBusca 
            Height          =   315
            ItemData        =   "vencedor.frx":0054
            Left            =   240
            List            =   "vencedor.frx":0061
            TabIndex        =   7
            Text            =   "Nome"
            Top             =   360
            Width           =   1695
         End
         Begin VB.TextBox txtbusca 
            Height          =   405
            Left            =   240
            TabIndex        =   6
            Top             =   960
            Width           =   1815
         End
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Setor"
         Height          =   255
         Left            =   -67680
         TabIndex        =   4
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Coluna"
         Height          =   255
         Left            =   -67680
         TabIndex        =   3
         Top             =   360
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.CommandButton Command3 
         Caption         =   "3D"
         Height          =   375
         Left            =   -68760
         TabIndex        =   2
         Top             =   720
         Width           =   1095
      End
      Begin VB.CommandButton cmdTodos 
         Caption         =   "Todos"
         Height          =   375
         Left            =   -74520
         TabIndex        =   1
         Top             =   2760
         Width           =   1335
      End
      Begin MSAdodcLib.Adodc Adodc1 
         Height          =   375
         Left            =   -74400
         Top             =   2280
         Width           =   1215
         _ExtentX        =   2143
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
         RecordSource    =   "cand"
         Caption         =   ""
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
      Begin MSChart20Lib.MSChart MSChart1 
         Height          =   6855
         Left            =   -75000
         OleObjectBlob   =   "vencedor.frx":007C
         TabIndex        =   22
         Top             =   360
         Width           =   8895
      End
      Begin MSChart20Lib.MSChart MSChart2 
         Height          =   6855
         Left            =   -75000
         OleObjectBlob   =   "vencedor.frx":1BB6
         TabIndex        =   23
         Top             =   360
         Visible         =   0   'False
         Width           =   8895
      End
      Begin MSChart20Lib.MSChart MSChart3 
         Height          =   6855
         Left            =   -75000
         OleObjectBlob   =   "vencedor.frx":3A2A
         TabIndex        =   24
         Top             =   360
         Visible         =   0   'False
         Width           =   8895
      End
      Begin MSDataGridLib.DataGrid DataGrid1 
         Bindings        =   "vencedor.frx":554F
         Height          =   6255
         Left            =   -72480
         TabIndex        =   31
         Top             =   480
         Width           =   7515
         _ExtentX        =   13256
         _ExtentY        =   11033
         _Version        =   393216
         AllowUpdate     =   0   'False
         HeadLines       =   1
         RowHeight       =   15
         FormatLocked    =   -1  'True
         AllowDelete     =   -1  'True
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
         Caption         =   "candidatos"
         ColumnCount     =   5
         BeginProperty Column00 
            DataField       =   "cod_do_cand"
            Caption         =   "Numero"
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
            DataField       =   "nome"
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
            DataField       =   "partido"
            Caption         =   "Partido"
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
         BeginProperty Column03 
            DataField       =   "Dtnasc"
            Caption         =   "Data de nascimento"
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
         BeginProperty Column04 
            DataField       =   "votos"
            Caption         =   "Votos"
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
         SplitCount      =   1
         BeginProperty Split0 
            BeginProperty Column00 
            EndProperty
            BeginProperty Column01 
            EndProperty
            BeginProperty Column02 
            EndProperty
            BeginProperty Column03 
            EndProperty
            BeginProperty Column04 
            EndProperty
         EndProperty
      End
      Begin VB.Image Image2 
         Height          =   1035
         Left            =   2400
         Picture         =   "vencedor.frx":5564
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
         Left            =   4080
         TabIndex        =   29
         Top             =   600
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
         Left            =   3960
         TabIndex        =   28
         Top             =   960
         Width           =   1710
      End
      Begin VB.Shape Shape2 
         Height          =   735
         Left            =   4560
         Top             =   6000
         Width           =   1815
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "100"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   4680
         TabIndex        =   27
         Top             =   6120
         Width           =   780
      End
      Begin VB.Label Label1 
         Caption         =   "Numero"
         Height          =   255
         Left            =   360
         TabIndex        =   25
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label Label7 
         Caption         =   "Votos Nulos"
         Height          =   255
         Left            =   6120
         TabIndex        =   20
         Top             =   3600
         Width           =   1095
      End
      Begin VB.Label Label6 
         Caption         =   "Votos em Branco"
         Height          =   255
         Left            =   6120
         TabIndex        =   19
         Top             =   2400
         Width           =   1215
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Vencedor"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   3240
         TabIndex        =   18
         Top             =   1560
         Width           =   2055
      End
      Begin VB.Label Label2 
         Caption         =   "Partido"
         Height          =   255
         Left            =   480
         TabIndex        =   17
         Top             =   3480
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "Nome"
         Height          =   255
         Left            =   480
         TabIndex        =   16
         Top             =   4560
         Width           =   1215
      End
      Begin VB.Image Image1 
         Height          =   2775
         Left            =   3240
         Stretch         =   -1  'True
         Top             =   2880
         Width           =   2415
      End
      Begin VB.Label Label5 
         Caption         =   "Votos"
         Height          =   255
         Left            =   3000
         TabIndex        =   15
         Top             =   6000
         Width           =   1095
      End
      Begin VB.Shape Shape1 
         Height          =   2775
         Left            =   3240
         Top             =   2880
         Width           =   2415
      End
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   840
      OleObjectBlob   =   "vencedor.frx":10F1C
      Top             =   7560
   End
End
Attribute VB_Name = "vencedor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim a As String
Dim cont As Integer
Dim V_imp As Integer
Dim grafic As Integer
Dim X As Integer
Dim z As Integer
Dim Venc As Integer
Dim venc_n As Integer
Dim porc As Double
Dim asdf As Variant




Private Sub cmb1_Click()
             On Error Resume Next
               tabela.Close
            tabela.Open "select * from cand where cod_do_cand=" & cmb1
            If tabela.BOF = False Or tabela.EOF = False Then
            Call mostrar
            
             asdf = (Text1 / porc) * 100
            
            Label9.Caption = Mid(asdf, 1, 4) & "%"
            tabela.Close
            tabela.Open "select * from cand"
            End If
End Sub

Private Sub cmb2_Click()
               tabela.Close
            tabela.Open "select * from cand where nome='" & cmb2 & "'"
            If tabela.BOF = False Or tabela.EOF = False Then
            Call mostrar
            
            If Not Text1 = 0 Then
            asdf = (Text1 / porc) * 100
            Else
            asdf = 0
            End If
            
            Label9.Caption = Mid(asdf, 1, 4) & "%"
            
            
            tabela.Close
            tabela.Open "select * from cand"
            End If
End Sub

Private Sub cmdB_Click()
End Sub

Private Sub cmbBusca_Change()
cmbBusca = Clear
End Sub

Private Sub cmdTodos_Click()
txtbusca = ""
End Sub

Private Sub Command1_Click()
MSChart1.Visible = False
MSChart2.Visible = True
Command1.Visible = False
Command2.Visible = True
Command3.Visible = False
MSChart3.Visible = False
Command4.Visible = False
End Sub

Private Sub cmdOK_Click()
Unload Me
End Sub

Private Sub Command10_Click()
 
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
End Sub

Private Sub Command4_Click()
            MSChart1.Visible = True
            MSChart2.Visible = False
            MSChart3.Visible = False
            Command3.Visible = True
            Command4.Visible = False
            
End Sub


Private Sub Command5_Click()
Unload Me
vencedor.Show
End Sub

Private Sub DataGrid1_Click()
Timer1.Enabled = True
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
                
             End If
End Sub

Private Sub Form_Load()


If tabela.State = adStateOpen Then tabela.Close
tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
vencedor.Caption = "Eleiçoes finalizadas em: " & tabela!Data & " as " & tabela!hora


              Skin1.LoadSkin (App.Path & "\AniMode.skn") ' app.patch indica que o skin esta na mesma página que o projeto
             Skin1.ApplySkin Me.hWnd ' aplica o skin
          On Error Resume Next
          
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
                vencedor.Show
             End If
           
           
           
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic
            Unload frmCad
            
            tabela.MoveFirst
            Venc = tabela!votos
            venc_n = tabela!cod_do_cand
            a = tabela!dtnasc
            While cont = Empty
            tabela.MoveNext
            If tabela.EOF = False Then
            If tabela!cod_do_cand = 111 Or tabela!cod_do_cand = 999 Then
            cont = 1
            Else
            If Venc < tabela!votos Then
            Venc = tabela!votos
            venc_n = tabela!cod_do_cand
            a = tabela!dtnasc
            End If
            End If
            Else
            cont = 1
            End If
            Wend

            cont = Clear
        
             '--------------------------------------------------------------
             V_imp = 0
             
             tabelas.Close
             tabelas.Open "select * from cand order by dtnasc"
             
             tabela.MoveFirst
            While asdf <> 1
            If tabela!votos = Venc And tabela!cod_do_cand <> venc_n Then
            
            If Year(a) > Year(tabela!dtnasc) Then
            Venc = tabela!votos
            venc_n = tabela!cod_do_cand
            GoTo chupeta
           
            ElseIf Year(a) = Year(tabela!dtnasc) Then

             If Month(a) > Month(tabela!dtnasc) Then
            Venc = tabela!votos
            venc_n = tabela!cod_do_cand
            GoTo chupeta
            
           

            ElseIf Month(a) = Month(tabela!dtnasc) Then

            If Day(a) > Day(tabela!dtnasc) Then
            Venc = tabela!votos
            venc_n = tabela!cod_do_cand
            GoTo chupeta
           
chupeta:
            End If
            End If
            End If
            tabela.MoveNext
            If tabela.BOF = True Or tabela.EOF = True Then asdf = 1
          
           
            Else
            tabela.MoveNext
            If tabela.BOF = True Or tabela.EOF = True Then
            asdf = 1
            End If
            End If
            Wend


         
         
           '--------------------------------------------------
           
           
            tabela.Close
            tabela.Open "select * from cand where cod_do_cand =" & venc_n
            If tabela.BOF = False Or tabela.EOF = False Then
            
            Call mostrar
           
            tabela.Close
            tabela.Open "select * from cand"
            End If
            
            tabela.Close
            tabela.Open "select votos from cand where cod_do_cand=999"
            If tabela.BOF = False Or tabela.EOF = False Then
            txtN = tabela!votos
            tabela.Close
            tabela.Open "select * from cand"
            End If
            
             tabela.Close
            tabela.Open "select votos from cand where cod_do_cand=111"
            If tabela.BOF = False Or tabela.EOF = False Then
            txtB = tabela!votos
            tabela.Close
            tabela.Open "select * from cand"
            End If
            
            
            
            cont = Clear
            tabela.MoveFirst
            porc = tabela!votos
            While cont = Empty
            tabela.MoveNext
            If tabela.EOF = False Then
            'If tabela!cod_do_cand = 111 Or tabela!cod_do_cand = 999 Then tabela.MoveNext
            porc = porc + tabela!votos
            Else
            cont = 1
            End If
            Wend
            
            asdf = (Text1 / porc) * 100
            
            Label9.Caption = Mid(asdf, 1, 4) & "%"
            
            
            
            X = Clear
            grafic = 1
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
            
            
           a = Clear
cont = Clear
V_imp = Clear
X = Clear
z = Clear
Venc = Clear
venc_n = Clear

            
            
            
            
End Sub

Private Sub mostrar()
On Error GoTo mostrar
            Image1.Picture = LoadPicture("")
             txt = tabela!cod_do_cand
            text2 = tabela!partido
            Text3 = tabela!nome

            Text1 = tabela!votos
             
            Text4 = tabela!url
            Image1.Picture = LoadPicture(tabela!url)
           
            
mostrar:
 If Image1 = Empty Then
MsgBox "O windows nao pode encontrar o URL(endereço) da imagem, por favor no menu de cadastro de candidatos atualiza o caminho das fotos dos candidatos", vbCritical
 
      End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
            focu = Empty
 
End Sub


Private Sub MSFlexGrid1_Click()

End Sub

Private Sub Timer1_Timer()
   tabela.Close
            tabela.Open "select * from cand where cod_do_cand=" & Text5
            If tabela.BOF = False Or tabela.EOF = False Then
            Call mostrar
            
             asdf = (Text1 / porc) * 100
            
            Label9.Caption = Mid(asdf, 1, 4) & "%"
            tabela.Close
            tabela.Open "select * from cand"
            End If

SSTab1.Tab = 0
Timer1.Enabled = False
Label4.Visible = False
End Sub

Private Sub txtbusca_Change()
            If cmbBusca = "Numero" Then
            Adodc1.CommandType = adCmdText
            Adodc1.RecordSource = "select * from cand where Cod_do_cand like '" & txtbusca & "%'"
            Adodc1.Refresh
            DataGrid1.Refresh
            ElseIf cmbBusca = "Nome" Then
            Adodc1.CommandType = adCmdText
            Adodc1.RecordSource = "select * from cand where nome like '" & txtbusca & "%'"
            Adodc1.Refresh
            DataGrid1.Refresh
            ElseIf cmbBusca = "Partido" Then
             Adodc1.CommandType = adCmdText
            Adodc1.RecordSource = "select * from cand where partido like '" & txtbusca & "%'"
            Adodc1.Refresh
            DataGrid1.Refresh
            End If
End Sub

