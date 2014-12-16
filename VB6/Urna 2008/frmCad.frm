VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmCad 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cadastro de candidatos"
   ClientHeight    =   5565
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   6660
   Icon            =   "frmCad.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5565
   ScaleWidth      =   6660
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox texta 
      DataField       =   "cod_do_cand"
      DataSource      =   "Adodc1"
      Height          =   285
      Left            =   5250
      TabIndex        =   30
      Top             =   5370
      Visible         =   0   'False
      Width           =   1935
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   1080
      OleObjectBlob   =   "frmCad.frx":0442
      Top             =   4680
   End
   Begin VB.CommandButton Command10 
      Caption         =   "OK"
      Height          =   375
      Left            =   5160
      TabIndex        =   18
      Top             =   4680
      Width           =   1095
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   5445
      Left            =   150
      TabIndex        =   0
      Top             =   0
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   9604
      _Version        =   393216
      Style           =   1
      Tabs            =   2
      TabHeight       =   520
      TabCaption(0)   =   "Cadastro"
      TabPicture(0)   =   "frmCad.frx":0676
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Shape1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Image1"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "SkinLabel7"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "SkinLabel6"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "SkinLabel5"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "SkinLabel4"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "SkinLabel3"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "SkinLabel2"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "cmb1"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "Command9"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "Frame1"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "Command4"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "text2"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "cmdb"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "Text1"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "Command3"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "Command2"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "Command1"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "Text4"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "Text3"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "txt"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "SkinLabel1"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).Control(22)=   "Command11"
      Tab(0).Control(22).Enabled=   0   'False
      Tab(0).Control(23)=   "mskdata"
      Tab(0).Control(23).Enabled=   0   'False
      Tab(0).ControlCount=   24
      TabCaption(1)   =   "Lista"
      TabPicture(1)   =   "frmCad.frx":0692
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "cmdTodos"
      Tab(1).Control(1)=   "Timer1"
      Tab(1).Control(2)=   "Frame2"
      Tab(1).Control(3)=   "Adodc1"
      Tab(1).Control(4)=   "DataGrid1"
      Tab(1).ControlCount=   5
      Begin MSMask.MaskEdBox mskdata 
         Height          =   345
         Left            =   360
         TabIndex        =   33
         Top             =   3270
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   609
         _Version        =   393216
         MaxLength       =   10
         Mask            =   "##/##/####"
         PromptChar      =   "_"
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Buscar Foto"
         Height          =   315
         Left            =   4560
         TabIndex        =   31
         Top             =   1680
         Width           =   1575
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   2760
         OleObjectBlob   =   "frmCad.frx":06AE
         TabIndex        =   24
         Top             =   3750
         Width           =   855
      End
      Begin VB.CommandButton cmdTodos 
         Caption         =   "Todos"
         Height          =   375
         Left            =   -74760
         TabIndex        =   23
         Top             =   2640
         Width           =   1335
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   -74640
         Top             =   3240
      End
      Begin VB.Frame Frame2 
         Caption         =   "Busca"
         Height          =   1575
         Left            =   -74880
         TabIndex        =   19
         Top             =   480
         Width           =   1815
         Begin VB.ComboBox cmbBusca 
            Height          =   315
            ItemData        =   "frmCad.frx":0720
            Left            =   240
            List            =   "frmCad.frx":072D
            TabIndex        =   21
            Text            =   "Nome"
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtbusca 
            Height          =   405
            Left            =   240
            TabIndex        =   20
            Top             =   960
            Width           =   1455
         End
      End
      Begin VB.TextBox txt 
         Height          =   375
         Left            =   360
         TabIndex        =   17
         Top             =   840
         Width           =   975
      End
      Begin VB.TextBox Text3 
         Height          =   375
         Left            =   360
         MaxLength       =   30
         TabIndex        =   16
         Top             =   2520
         Width           =   2055
      End
      Begin VB.TextBox Text4 
         Height          =   375
         Left            =   2520
         MaxLength       =   250
         TabIndex        =   15
         Top             =   840
         Width           =   3375
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Salvar"
         Height          =   375
         Left            =   4920
         TabIndex        =   14
         Top             =   2160
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Excluir"
         Height          =   375
         Left            =   4920
         TabIndex        =   13
         Top             =   2640
         Width           =   1095
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Alterar"
         Height          =   375
         Left            =   4920
         TabIndex        =   12
         Top             =   3120
         Width           =   1095
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H00E0E0E0&
         Height          =   405
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   11
         Text            =   "0"
         Top             =   1680
         Width           =   855
      End
      Begin VB.CommandButton cmdb 
         Caption         =   "B"
         Height          =   495
         Left            =   1440
         TabIndex        =   10
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox text2 
         Height          =   375
         Left            =   360
         MaxLength       =   10
         TabIndex        =   9
         Top             =   1680
         Width           =   855
      End
      Begin VB.CommandButton Command4 
         Caption         =   "testar caminho"
         Height          =   315
         Left            =   4560
         TabIndex        =   8
         Top             =   1320
         Width           =   1575
      End
      Begin VB.Frame Frame1 
         Height          =   1455
         Left            =   570
         TabIndex        =   3
         Top             =   3690
         Width           =   1335
         Begin VB.CommandButton Command5 
            Height          =   495
            Left            =   120
            Picture         =   "frmCad.frx":0748
            Style           =   1  'Graphical
            TabIndex        =   7
            Top             =   240
            Width           =   495
         End
         Begin VB.CommandButton Command6 
            Height          =   495
            Left            =   720
            Picture         =   "frmCad.frx":0B8A
            Style           =   1  'Graphical
            TabIndex        =   6
            Top             =   840
            Width           =   495
         End
         Begin VB.CommandButton Command7 
            Height          =   495
            Left            =   120
            Picture         =   "frmCad.frx":0FCC
            Style           =   1  'Graphical
            TabIndex        =   5
            Top             =   840
            Width           =   495
         End
         Begin VB.CommandButton Command8 
            Height          =   495
            Left            =   720
            Picture         =   "frmCad.frx":140E
            Style           =   1  'Graphical
            TabIndex        =   4
            Top             =   240
            Width           =   495
         End
      End
      Begin VB.CommandButton Command9 
         Caption         =   "Novo"
         Height          =   375
         Left            =   4920
         TabIndex        =   2
         Top             =   3600
         Width           =   1095
      End
      Begin MSDataListLib.DataCombo cmb1 
         Bindings        =   "frmCad.frx":1850
         DataSource      =   "Adodc1"
         Height          =   315
         Left            =   2760
         TabIndex        =   1
         Top             =   4080
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   556
         _Version        =   393216
         ListField       =   "nome"
         Text            =   ""
      End
      Begin MSAdodcLib.Adodc Adodc1 
         Height          =   375
         Left            =   -74640
         Top             =   2160
         Visible         =   0   'False
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
      Begin MSDataGridLib.DataGrid DataGrid1 
         Bindings        =   "frmCad.frx":1865
         Height          =   3975
         Left            =   -72960
         TabIndex        =   22
         Top             =   360
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   7011
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
         ColumnCount     =   4
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
         EndProperty
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmCad.frx":187A
         TabIndex        =   25
         Top             =   480
         Width           =   855
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   255
         Left            =   2280
         OleObjectBlob   =   "frmCad.frx":18E4
         TabIndex        =   26
         Top             =   480
         Width           =   1815
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
         Height          =   255
         Left            =   1320
         OleObjectBlob   =   "frmCad.frx":1958
         TabIndex        =   27
         Top             =   1320
         Width           =   855
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmCad.frx":19C0
         TabIndex        =   28
         Top             =   1320
         Width           =   855
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "frmCad.frx":1A2C
         TabIndex        =   29
         Top             =   2160
         Width           =   855
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
         Height          =   255
         Left            =   360
         OleObjectBlob   =   "frmCad.frx":1A92
         TabIndex        =   32
         Top             =   3030
         Width           =   2145
      End
      Begin VB.Image Image1 
         Height          =   2055
         Left            =   2640
         Stretch         =   -1  'True
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Shape Shape1 
         Height          =   2055
         Left            =   2640
         Top             =   1440
         Width           =   1695
      End
   End
End
Attribute VB_Name = "frmCad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim V_alt As Integer
Dim f As Integer
Dim combo As String
Dim cont As Integer

Private Sub cmb1_Click(Area As Integer)
 Image1.Picture = LoadPicture("")
  tabela.Close
            tabela.Open "select * from cand where nome='" & cmb1 & "'"
            If tabela.BOF = False Or tabela.EOF = False Then
            Call mostrar
            Command4 = True
            tabela.Close
            tabela.Open "select * from cand"
            End If
            
End Sub

Private Sub cmbBusca_Change()
cmbBusca = Clear
End Sub

Private Sub cmdTodos_Click()
txtbusca = ""
End Sub

Private Sub Command1_Click()
 Image1.Picture = LoadPicture("")
 Command4 = True

              If txt = Empty Or text2 = Empty Or Text3 = Empty Or Text4 = Empty Then
         MsgBox "PREENCHA OS CAMPOS", vbCritical, "seu burro"
         Else
         tabela.Close
         tabela.Open "select * from cand where cod_do_cand=" & txt
         If tabela.BOF = False Or tabela.EOF = False Then
         If MsgBox("O candidato ja existe, Deseja salvar as alterações?", vbInformation + vbYesNo, "Urna") = vbYes Then
         Command3 = True
          tabela.Close
                 tabela.Open "select * from cand"
                 End If
         Else
         Text1 = 0
         conecta.Execute "insert into cand (cod_do_cand,partido,nome,votos,url, dtnasc)" & _
         "values('" & txt.Text & "', '" & text2.Text & "', '" & Text3.Text & "', '" & Text1.Text & "', '" & Text4.Text & "', '" & mskdata.Text & "')"
          tabela.Close
          tabela.Open "select * from cand"
          MsgBox "candidato salvo", vbInformation, "Urna"
          Adodc1.Refresh
        Call limp
        End If
        End If
        
End Sub

Private Sub limp()
          
             txt = Clear
          Text1 = 0
              Text4 = Clear
              text2 = Clear
              Text3 = Clear
              Image1.Picture = LoadPicture("")
             cmb1.Text = ""
             Adodc1.Refresh
             
End Sub

Private Sub cmdB_Click()
            If txt = Empty Then

            Else
           
            tabela.Close
            tabela.Open "select * from cand where cod_do_cand=" & txt
            If tabela.BOF = False Or tabela.EOF = False Then
            Call mostrar
           
            tabela.Close
            tabela.Open "select * from cand"
            End If
            End If
End Sub



Private Sub Command10_Click()
Unload Me
End Sub

Private Sub Command11_Click()
            frmBF.Show
            frmCad.Enabled = False
End Sub

Private Sub Command2_Click()

If MsgBox("deseja realmente exlcluir?", vbInformation + vbYesNo + vbDefaultButton2, "Urna") = vbYes Then
          If txt = Empty Then
          MsgBox "Nao pode exluir", vbCritical, "Urna"
          Else
           conecta.Execute "delete * from cand where cod_do_cand=" & txt
           Call limp
            MsgBox "candidato excluido com sucesso", vbInformation, "Urna"
             tabela.Close
            tabela.Open "select * from cand"
            End If
            End If
      
            
End Sub

Private Sub Command3_Click()
Image1.Picture = LoadPicture("")
 Command4 = True
        If txt = Empty Or text2 = Empty Or Text3 = Empty Or Text4 = Empty Then
                 MsgBox "PREENCHA OS CAMPOS", vbCritical, "seu burro"
        ElseIf txt <> V_alt Then
                 MsgBox "não pode alterar o Numero", vbCritical, "Urna"
                 tabela.Close
                 tabela.Open "select * from cand"
                 txt = V_alt
        ElseIf tabela.EOF = False Or tabela.BOF = False Then
               conecta.Execute "update cand set partido='" & text2 & "', nome='" & Text3 & "', url='" & Text4 & "',dtnasc= '" & mskdata & "' where cod_do_cand=" & txt
               MsgBox "Alterações realizadas com sucesso ", vbInformation, "Urna"
               Adodc1.Refresh
         End If
       
End Sub

Private Sub Command4_Click()
 On Error GoTo Command4_Click
Image1.Picture = LoadPicture(Text4)
Command4_Click:
If Not Image1 = Empty Then
Else
MsgBox "URL nao é valido", vbCritical, "Urna"
Text4 = Clear
End If


End Sub

Private Sub Command5_Click()

               If tabela.EOF = True Or tabela.BOF = True Then
              tabela.Close
             tabela.Open "select * from cand"
            Else
            tabela.MoveFirst
           If tabela.EOF = False Or tabela.BOF = False Then

            Call mostrar
           
            
           
            End If
            End If
End Sub

Private Sub Command5_GotFocus()
 Image1.Picture = LoadPicture("")
End Sub

Private Sub Command6_Click()
            If tabela.EOF = True Or tabela.BOF = True Then
             tabela.Close
             tabela.Open "select * from cand"
            Else
            tabela.MoveNext
            If tabela.EOF = True Then
            tabela.MoveLast
            Else
            Call mostrar
           
            
           
End If
            End If
End Sub

Private Sub Command6_GotFocus()
 Image1.Picture = LoadPicture("")
End Sub

Private Sub Command7_Click()
            If tabela.EOF = True Or tabela.BOF = True Then
             tabela.Close
            tabela.Open "select * from cand"
            Else
            tabela.MovePrevious
            If tabela.BOF = True Then
            tabela.MoveFirst
            Else
            Call mostrar
         
            End If
            End If
End Sub

Private Sub Command7_GotFocus()
 Image1.Picture = LoadPicture("")
End Sub

Private Sub Command8_Click()
               If tabela.EOF = True Or tabela.BOF = True Then
             tabela.Close
              tabela.Open "select * from cand"
            Else
            Call mostrar
            tabela.MoveLast
            If tabela.EOF = False Or tabela.BOF = False Then
            Call mostrar
      
            
            End If
            End If
End Sub

Private Sub Command8_GotFocus()
             Image1.Picture = LoadPicture("")
End Sub

Private Sub Command9_Click()
           Call limp
             tabela.Close
                 tabela.Open "select * from cand"
            
End Sub

Private Sub DataCombo1_Click(Area As Integer)

            
End Sub

Private Sub DataGrid1_Click()
            Timer1.Enabled = True
End Sub

Private Sub Form_Activate()
              If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
           If tabela!foda = 1 Then Unload Me
       
        


            If tabela.State = adStateOpen Then tabela.Close
             tabela.Open " select * from cand where votos <> 0 "
            
                   
             If tabela.BOF = False Or tabela.EOF = False Then
                MsgBox "A eleição foi iniciada. Nenhuma informação pode ser alterada", vbInformation
                Unload Me
             Else
             
             End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            cmdb = True
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
             
             tabela.Close
             tabela.Open " select * from cand where votos <> 0 "
             
                   
             If tabela.BOF = False Or tabela.EOF = False Then
                MsgBox "A eleição foi iniciada. Nenhuma informação pode ser alterada", vbInformation
                Unload Me
             Else
sexo:
               frmCad.Show
             End If

                
End Sub

Private Sub Timer1_Timer()
Image1.Picture = LoadPicture("")
    
           txt = texta
        cmdb = True
            SSTab1.Tab = 0
            cmdTodos = True
            Timer1.Enabled = False
End Sub


Private Sub txt_LostFocus()
            cmdb = True
           
End Sub

Private Sub txt_Change()
           
            If Len(txt) > 2 Or Not IsNumeric(txt) Then
            txt = Clear
            End If
            
          
End Sub
Private Sub mostrar()

On Error GoTo mostrar
              V_alt = tabela!cod_do_cand
            txt = tabela!cod_do_cand
            text2 = tabela!partido
            Text3 = tabela!nome
            Text4 = tabela!url
            Text1 = tabela!votos
            mskdata.PromptInclude = False
            mskdata = Format(tabela!dtnasc, "dd/mm/yyyy")
             Image1.Picture = LoadPicture(Text4)
             cmb1.Text = tabela!nome
             
mostrar:
             If Image1 = Empty Then
            MsgBox "O windows nao pode encontrar o URL(endereço) da imagem, por favor no menu de cadastro de candidatos atualiza o caminho das fotos dos candidatos", vbCritical, "Urna"
             End If
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
