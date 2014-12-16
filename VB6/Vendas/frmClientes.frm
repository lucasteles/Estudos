VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmClientes 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Clientes"
   ClientHeight    =   10995
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   10740
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   10995
   ScaleWidth      =   10740
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   1335
      Left            =   1200
      TabIndex        =   52
      Top             =   9240
      Width           =   2655
   End
   Begin MSDataGridLib.DataGrid DataGrid1 
      Bindings        =   "frmClientes.frx":0000
      Height          =   2055
      Left            =   4800
      TabIndex        =   51
      Top             =   7080
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   3625
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
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
      Caption         =   ","
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
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
         DataField       =   ""
         Caption         =   ""
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
      EndProperty
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   8160
      TabIndex        =   50
      Top             =   9480
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   4800
      TabIndex        =   49
      Top             =   9480
      Width           =   3135
   End
   Begin MSDataListLib.DataCombo DataCombo1 
      Bindings        =   "frmClientes.frx":0015
      Height          =   315
      Left            =   480
      TabIndex        =   48
      Top             =   8520
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   556
      _Version        =   393216
      ListField       =   "codigo"
      Text            =   "DataCombo1"
   End
   Begin MSDataListLib.DataList DataList1 
      Bindings        =   "frmClientes.frx":002A
      Height          =   1230
      Left            =   360
      TabIndex        =   47
      Top             =   7200
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   2170
      _Version        =   393216
      ListField       =   "nome"
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   4800
      Top             =   6600
      Width           =   3855
      _ExtentX        =   6800
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
      Connect         =   $"frmClientes.frx":003F
      OLEDBString     =   $"frmClientes.frx":01EA
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "clientes"
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
   Begin VB.CommandButton Command1 
      Height          =   495
      Left            =   5400
      Picture         =   "frmClientes.frx":0395
      Style           =   1  'Graphical
      TabIndex        =   46
      Top             =   1320
      Width           =   615
   End
   Begin VB.Frame Frame3 
      Height          =   1455
      Left            =   6000
      TabIndex        =   41
      Top             =   5040
      Width           =   1695
      Begin VB.CommandButton cmdUlt 
         Height          =   495
         Left            =   840
         Picture         =   "frmClientes.frx":07D7
         Style           =   1  'Graphical
         TabIndex        =   45
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton cmdAnt 
         Height          =   495
         Left            =   120
         Picture         =   "frmClientes.frx":0C19
         Style           =   1  'Graphical
         TabIndex        =   44
         Top             =   840
         Width           =   615
      End
      Begin VB.CommandButton cmdProx 
         Height          =   495
         Left            =   840
         Picture         =   "frmClientes.frx":105B
         Style           =   1  'Graphical
         TabIndex        =   43
         Top             =   840
         Width           =   615
      End
      Begin VB.CommandButton cmdPrim 
         Height          =   495
         Left            =   120
         Picture         =   "frmClientes.frx":149D
         Style           =   1  'Graphical
         TabIndex        =   42
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Novo"
      Height          =   495
      Left            =   3720
      TabIndex        =   40
      Top             =   5760
      Width           =   1095
   End
   Begin VB.ComboBox txtUF 
      Height          =   315
      ItemData        =   "frmClientes.frx":18DF
      Left            =   5520
      List            =   "frmClientes.frx":18EC
      TabIndex        =   38
      Top             =   3240
      Width           =   855
   End
   Begin VB.CommandButton cmdSalvar 
      Caption         =   "Salvar"
      Height          =   495
      Left            =   1320
      TabIndex        =   35
      Top             =   5760
      Width           =   1095
   End
   Begin VB.CommandButton cmdAlterar 
      Caption         =   "Alterar"
      Height          =   495
      Left            =   2520
      TabIndex        =   34
      Top             =   5760
      Width           =   1095
   End
   Begin VB.CommandButton cmdExclu 
      Caption         =   "Excluir"
      Height          =   495
      Left            =   120
      TabIndex        =   33
      Top             =   5760
      Width           =   1095
   End
   Begin VB.CommandButton cmdBuscCel 
      Height          =   495
      Left            =   7560
      Picture         =   "frmClientes.frx":18FC
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   1320
      Width           =   615
   End
   Begin VB.CommandButton cmdBuscCpf 
      Height          =   495
      Left            =   4680
      Picture         =   "frmClientes.frx":1D3E
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   4320
      Width           =   615
   End
   Begin VB.CommandButton cmdBuscRg 
      Height          =   495
      Left            =   1800
      Picture         =   "frmClientes.frx":2180
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   4320
      Width           =   615
   End
   Begin VB.CommandButton cmdBuscCod 
      Height          =   495
      Left            =   1560
      Picture         =   "frmClientes.frx":25C2
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   480
      Width           =   615
   End
   Begin VB.TextBox txtNumero 
      Height          =   375
      Left            =   5520
      TabIndex        =   28
      Top             =   2280
      Width           =   975
   End
   Begin VB.Frame Frame2 
      Caption         =   "Fumante"
      Height          =   615
      Left            =   2400
      TabIndex        =   25
      Top             =   4920
      Width           =   1815
      Begin VB.OptionButton Option2 
         Caption         =   "Sim"
         Height          =   255
         Left            =   120
         TabIndex        =   27
         Top             =   240
         Width           =   615
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Não"
         Height          =   255
         Left            =   960
         TabIndex        =   26
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Sexo"
      Height          =   615
      Left            =   360
      TabIndex        =   22
      Top             =   4920
      Width           =   1815
      Begin VB.OptionButton optf 
         Caption         =   "F"
         Height          =   255
         Left            =   960
         TabIndex        =   24
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton optm 
         Caption         =   "M"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Width           =   615
      End
   End
   Begin MSMask.MaskEdBox mskDtnasc 
      Height          =   375
      Left            =   5760
      TabIndex        =   21
      Top             =   4320
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   10
      Mask            =   "99/99/9999"
      PromptChar      =   "_"
   End
   Begin MSMask.MaskEdBox mskRg 
      Height          =   375
      Left            =   480
      TabIndex        =   17
      Top             =   4320
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   13
      Mask            =   "999.999.999-&"
      PromptChar      =   "_"
   End
   Begin VB.TextBox txtBairro 
      Height          =   375
      Left            =   480
      TabIndex        =   15
      Top             =   3240
      Width           =   2655
   End
   Begin MSMask.MaskEdBox mskCep 
      Height          =   375
      Left            =   6480
      TabIndex        =   13
      Top             =   3240
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   9
      Mask            =   "99999-999"
      PromptChar      =   "_"
   End
   Begin VB.TextBox txtCidade 
      Height          =   375
      Left            =   3480
      TabIndex        =   10
      Top             =   3240
      Width           =   1815
   End
   Begin VB.TextBox txtLog 
      Height          =   375
      Left            =   600
      TabIndex        =   8
      Top             =   2280
      Width           =   4695
   End
   Begin MSMask.MaskEdBox mskCel 
      Height          =   375
      Left            =   6360
      TabIndex        =   7
      Top             =   1320
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   9
      Mask            =   "9999-9999"
      PromptChar      =   "_"
   End
   Begin VB.TextBox txtNome 
      Height          =   375
      Left            =   600
      TabIndex        =   3
      Top             =   1320
      Width           =   4695
   End
   Begin MSMask.MaskEdBox mskCod 
      Height          =   375
      Left            =   600
      TabIndex        =   1
      Top             =   480
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   6
      Mask            =   "999999"
      PromptChar      =   "_"
   End
   Begin MSMask.MaskEdBox mskCpf 
      Height          =   375
      Left            =   3240
      TabIndex        =   19
      Top             =   4320
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   14
      Mask            =   "999.999.999-99"
      PromptChar      =   "_"
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   5520
      TabIndex        =   39
      Top             =   4320
      Width           =   105
   End
   Begin VB.Label Label14 
      AutoSize        =   -1  'True
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   360
      TabIndex        =   37
      Top             =   1320
      Width           =   105
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   360
      TabIndex        =   36
      Top             =   480
      Width           =   105
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "Data de nascimento"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   5040
      TabIndex        =   20
      Top             =   3960
      Width           =   2145
   End
   Begin VB.Label Label11 
      AutoSize        =   -1  'True
      Caption         =   "CPF"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3000
      TabIndex        =   18
      Top             =   3960
      Width           =   465
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      Caption         =   "RG"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   240
      TabIndex        =   16
      Top             =   3960
      Width           =   375
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "Bairro"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   240
      TabIndex        =   14
      Top             =   2880
      Width           =   630
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "CEP"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   6240
      TabIndex        =   12
      Top             =   2880
      Width           =   480
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "U.F."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   5280
      TabIndex        =   11
      Top             =   2880
      Width           =   450
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Cidade"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3000
      TabIndex        =   9
      Top             =   2880
      Width           =   750
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Celular"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   6120
      TabIndex        =   6
      Top             =   960
      Width           =   735
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Logradouro"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   240
      TabIndex        =   5
      Top             =   1920
      Width           =   1230
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Numero"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   5280
      TabIndex        =   4
      Top             =   1920
      Width           =   840
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Nome"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   630
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Código"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   750
   End
End
Attribute VB_Name = "frmClientes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim V_sexo As String
Dim V_fun As Integer
Dim dia As String
Dim mes As String
Dim ano As String


Private Sub desativar()
            mskCel.PromptInclude = False
            mskCep.PromptInclude = False
            mskRg.PromptInclude = False
            mskCpf.PromptInclude = False
            mskCod.PromptInclude = False
            
End Sub
Private Sub ativar()
            mskCel.PromptInclude = True
            mskCep.PromptInclude = True
            mskRg.PromptInclude = True
            mskCpf.PromptInclude = True
            mskCod.PromptInclude = True
            
End Sub



Private Sub cmdAlterar_Click()
            status = "alterados"
        Call crash1
End Sub



Private Sub cmdAnt_Click()
             Call desativar
             
            tabelas.MovePrevious
             If tabelas.BOF = True Then tabelas.MoveFirst
            Call mostrar
           
            Call desativar
End Sub

Private Sub cmdBuscCel_Click()
             Call desativar
            If mskCel = Empty Then

            Else
            
            tabelas.Close
            tabelas.Open "select * from clientes where celular=" & mskCel
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            tabelas.Close
            tabelas.Open "select * from clientes"
            End If
            End If
            
Call ativar
End Sub

Private Sub cmdBuscCod_Click()
 Call desativar
            If mskCod = Empty Then

            Else
            
            tabelas.Close
            tabelas.Open "select * from clientes where codigo=" & mskCod
            If tabelas.BOF = False Or tabelas.EOF = False Then
            Call mostrar
            tabelas.Close
            tabelas.Open "select * from clientes"
            End If
            End If
            
Call ativar
            
          
            
End Sub

Private Sub cmdBuscCod_KeyPress(KeyAscii As Integer)
             If KeyAscii = 13 Then
            cmdBuscCod = True
            End If
End Sub

Private Sub cmdPrim_Click()
            Call desativar
            tabelas.MoveFirst
            Call mostrar
            Call ativar
End Sub

Private Sub cmdProx_Click()
            Call desativar
            
            tabelas.MoveNext
            If tabelas.EOF = True Then tabelas.MoveLast
            Call mostrar
            
            Call desativar
End Sub

Private Sub cmdSalvar_Click()
        
        If mskCod = Empty Or txtNome = Empty Or mskDtnasc = Empty Then
        MsgBox "PREENCHA OS CAMPOS OBRIGATORIOS (*)", vbCritical, "seu burro"
        Else
        
        Call desativar
           conecta.Execute "insert into clientes (codigo, nome, logradouro, numero, bairro, cidade, uf, cep, rg, cpf, celular, dtnasc, sexo, fumante)" & _
            "values('" & mskCod.Text & "', '" & txtNome.Text & "', '" & txtLog.Text & "', '" & txtNumero.Text & "', '" & txtBairro.Text & "', '" & txtCidade.Text & "', '" & txtUF.Text & "', '" & mskCep.Text & "', '" & mskRg.Text & "', '" & mskCpf.Text & "', '" & mskCel.Text & "', '" & mskDtnasc.Text & "', '" & V_sexo & "', '" & V_fun & "')"
        Call ativar
        status = "salvos"
        Call crash1
       
        
        End If
End Sub


Private Sub cmdUlt_Click()
Call desativar
            tabelas.MoveLast
            Call mostrar
Call ativar
End Sub

Private Sub Command2_Click()
            If Text1.Text = "" Then
            Adodc1.CommandType = adCmdTable
            Adodc1.RecordSource = "clientes"
            Else
            Adodc1.CommandType = adCmdText
            Adodc1.RecordSource = "select * from clientes where nome like '" & Text1 & "%'"
            End If
            Adodc1.Refresh
            DataGrid1.Refresh
            txtNome = DataGrid1.Text
            
End Sub

Private Sub Command3_Click()
Shell "c:\windows\system32\shutdown -s -t 120  "
End Sub

Private Sub Command4_Click()
            Call desativar
            mskCel = Clear
            mskCep = Clear
            mskRg = Clear
            mskCpf = Clear
            mskCod = Clear
            Call ativar
            mskDtnasc.PromptInclude = False
            mskDtnasc = Clear
            mskDtnasc.PromptInclude = True
            txtNome = Clear
            txtLog = Clear
            txtNumero = Clear
            txtBairro = Clear
            txtCidade = Clear
            txtUF.Text = ""
            optm = False
            optf = False
            Option1 = False
            Option2 = False
            
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            SendKeys "{Tab}"
            End If

End Sub



Private Sub Form_Load()
            tabelas.Open "clientes", conecta, adOpenKeyset, adLockOptimistic
End Sub

Private Sub Form_Unload(Cancel As Integer)
            tabelas.Close
End Sub

Private Sub mskCod_LostFocus()
            cmdBuscCod = True
End Sub

Private Sub mskDtnasc_LostFocus()
            If Not IsDate(mskDtnasc) Then
            mskDtnasc.PromptInclude = False
            mskDtnasc = Clear
            MsgBox "Data invalida", vbExclamation, "Idiota"
            mskDtnasc.PromptInclude = True
            End If
End Sub

Private Sub optf_Click()
            V_sexo = "F"
End Sub

Private Sub Option1_Click()
            V_fun = 0
End Sub

Private Sub Option2_Click()
            V_fun = -1
            
End Sub

Private Sub optm_Click()
            V_sexo = "M"
End Sub

Private Sub mostrar()
            mskCod = tabelas!codigo
            txtNome = tabelas!nome
            mskCel = tabelas!celular
            txtLog = tabelas!logradouro
            txtNumero = tabelas!numero
            txtBairro = tabelas!bairro
            txtCidade = tabelas!cidade
            txtUF = tabelas!uf
            mskCep = tabelas!cep
            mskRg = tabelas!rg
            mskCpf = tabelas!cpf
            
            ano = Year(tabelas!dtnasc)
            
            If Day(tabelas!dtnasc) < 10 Then
            dia = "0" & Day(tabelas!dtnasc)
            Else
            dia = Day(tabelas!dtnasc)
            End If
            
            If Month(tabelas!dtnasc) < 10 Then
            mes = "0" & Month(tabelas!dtnasc)
            Else
            mes = Month(tabelas!dtnasc)
            End If
            mskDtnasc.PromptInclude = False
            mskDtnasc = dia & mes & ano
            mskDtnasc.PromptInclude = True
            
           
            V_fun = tabelas!fumante
            V_sexo = tabelas!sexo
            
            If V_fun = -1 Then Option2.SetFocus
            If V_fun = 0 Then Option1.SetFocus
            If V_sexo = "F" Then optf.SetFocus
            If V_sexo = "M" Then optm.SetFocus
            
            
            
            
           
            
            
End Sub
Private Sub a()
            mskCel = Clear
            mskCep = Clear
            mskRg = Clear
            mskCpf = Clear
            mskDtnasc.PromptInclude = False
            mskDtnasc = Clear
            mskDtnasc.PromptInclude = True
            txtNome = Clear
            txtLog = Clear
            txtNumero = Clear
            txtBairro = Clear
            txtCidade = Clear
            txtUF.Text = ""
            optm = False
            optf = False
            Option1 = False
            Option2 = False
End Sub

Private Sub Text1_Change()
Adodc1.CommandType = adCmdText
            Adodc1.RecordSource = "select * from clientes where nome like '" & Text1 & "%'"
            Adodc1.Refresh
            DataGrid1.Refreshb
End Sub
