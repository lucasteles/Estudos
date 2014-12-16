VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmControle 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Controle"
   ClientHeight    =   6675
   ClientLeft      =   5610
   ClientTop       =   2700
   ClientWidth     =   5595
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6675
   ScaleWidth      =   5595
   ShowInTaskbar   =   0   'False
   Begin TabDlg.SSTab sstab1 
      Height          =   6135
      Left            =   240
      TabIndex        =   9
      Top             =   120
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   10821
      _Version        =   393216
      Tabs            =   2
      TabHeight       =   520
      BackColor       =   15924684
      TabCaption(0)   =   "Cadastro"
      TabPicture(0)   =   "frmControle.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label9"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label8"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Label7"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Label6"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Label4"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Label2"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Label1"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "Label3"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "Label5"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "Label10"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "Label11"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "mskCod"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "mskDT"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "mskCEP"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "mskCelular"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "mskTelefone"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "Skin1"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "Command7"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "cmdProximo"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "cmdAnterior"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "cmdLimpar"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "cmdSair"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).Control(22)=   "cmdDeletar"
      Tab(0).Control(22).Enabled=   0   'False
      Tab(0).Control(23)=   "cmdSalvar"
      Tab(0).Control(23).Enabled=   0   'False
      Tab(0).Control(24)=   "txtRua"
      Tab(0).Control(24).Enabled=   0   'False
      Tab(0).Control(25)=   "Frame1"
      Tab(0).Control(25).Enabled=   0   'False
      Tab(0).Control(26)=   "txtBairro"
      Tab(0).Control(26).Enabled=   0   'False
      Tab(0).Control(27)=   "txtNome"
      Tab(0).Control(27).Enabled=   0   'False
      Tab(0).Control(28)=   "txtNumero"
      Tab(0).Control(28).Enabled=   0   'False
      Tab(0).Control(29)=   "cmdBuscar"
      Tab(0).Control(29).Enabled=   0   'False
      Tab(0).Control(30)=   "Timer2"
      Tab(0).Control(30).Enabled=   0   'False
      Tab(0).ControlCount=   31
      TabCaption(1)   =   "Banco de Dados"
      TabPicture(1)   =   "frmControle.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "text1"
      Tab(1).Control(1)=   "Command1"
      Tab(1).Control(2)=   "Text2"
      Tab(1).Control(3)=   "Timer1"
      Tab(1).Control(4)=   "Adodc1"
      Tab(1).Control(5)=   "DataGrid1"
      Tab(1).ControlCount=   6
      Begin VB.Timer Timer2 
         Interval        =   1000
         Left            =   4560
         Top             =   5520
      End
      Begin VB.CommandButton cmdBuscar 
         Caption         =   "Buscar"
         Height          =   615
         Left            =   2040
         Picture         =   "frmControle.frx":0038
         TabIndex        =   22
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txtNumero 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   960
         TabIndex        =   2
         Top             =   2160
         Width           =   3975
      End
      Begin VB.TextBox txtNome 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   960
         MaxLength       =   50
         TabIndex        =   0
         Top             =   1200
         Width           =   3975
      End
      Begin VB.TextBox txtBairro 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   960
         MaxLength       =   50
         TabIndex        =   3
         Top             =   2640
         Width           =   3975
      End
      Begin VB.Frame Frame1 
         Caption         =   "Sexo"
         Height          =   1095
         Left            =   2280
         TabIndex        =   8
         Top             =   3120
         Width           =   1335
         Begin VB.OptionButton optF 
            Caption         =   "Feminino"
            Height          =   255
            Left            =   120
            TabIndex        =   21
            Top             =   600
            Width           =   975
         End
         Begin VB.OptionButton optM 
            Caption         =   "Masculino"
            Height          =   255
            Left            =   120
            TabIndex        =   20
            Top             =   240
            Width           =   1095
         End
      End
      Begin VB.TextBox txtRua 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   960
         MaxLength       =   50
         TabIndex        =   1
         Top             =   1680
         Width           =   3975
      End
      Begin VB.CommandButton cmdSalvar 
         Caption         =   "Salvar "
         Height          =   495
         Left            =   2520
         Picture         =   "frmControle.frx":047A
         TabIndex        =   19
         Top             =   4560
         Width           =   615
      End
      Begin VB.CommandButton cmdDeletar 
         Caption         =   "Excluir"
         Height          =   495
         Left            =   3720
         Picture         =   "frmControle.frx":08BC
         TabIndex        =   18
         Top             =   4560
         Width           =   615
      End
      Begin VB.CommandButton cmdSair 
         Caption         =   "Sair"
         Height          =   495
         Left            =   4320
         Picture         =   "frmControle.frx":0CFE
         TabIndex        =   17
         Top             =   4560
         Width           =   615
      End
      Begin VB.CommandButton cmdLimpar 
         Caption         =   "Novo"
         Height          =   495
         Left            =   3120
         Picture         =   "frmControle.frx":1140
         TabIndex        =   16
         Top             =   4560
         Width           =   615
      End
      Begin VB.CommandButton cmdAnterior 
         Height          =   495
         Left            =   3720
         Picture         =   "frmControle.frx":1582
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   3240
         Width           =   615
      End
      Begin VB.CommandButton cmdProximo 
         Height          =   495
         Left            =   4320
         Picture         =   "frmControle.frx":19C4
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   3240
         Width           =   615
      End
      Begin VB.TextBox text1 
         Height          =   375
         Left            =   -74760
         TabIndex        =   13
         Top             =   360
         Width           =   3255
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Mostrar Todos"
         Height          =   375
         Left            =   -71400
         TabIndex        =   12
         Top             =   360
         Width           =   1335
      End
      Begin VB.TextBox Text2 
         DataField       =   "Codigo"
         DataSource      =   "Adodc1"
         Height          =   285
         Left            =   -74760
         TabIndex        =   11
         Top             =   5760
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   -71640
         Top             =   5640
      End
      Begin VB.CommandButton Command7 
         Height          =   735
         Left            =   3600
         Picture         =   "frmControle.frx":1E06
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   5160
         Width           =   735
      End
      Begin ACTIVESKINLibCtl.Skin Skin1 
         Left            =   2520
         OleObjectBlob   =   "frmControle.frx":3270
         Top             =   5280
      End
      Begin MSAdodcLib.Adodc Adodc1 
         Height          =   450
         Left            =   -73200
         Top             =   5640
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   794
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
         Connect         =   "Provider=microsoft.jet.oledb.4.0; data source=Banco.mdb"
         OLEDBString     =   "Provider=microsoft.jet.oledb.4.0; data source=Banco.mdb"
         OLEDBFile       =   ""
         DataSourceName  =   ""
         OtherAttributes =   ""
         UserName        =   ""
         Password        =   ""
         RecordSource    =   "Banco"
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
      Begin MSDataGridLib.DataGrid DataGrid1 
         Bindings        =   "frmControle.frx":34A4
         Height          =   4815
         Left            =   -74880
         TabIndex        =   23
         Top             =   840
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   8493
         _Version        =   393216
         HeadLines       =   1
         RowHeight       =   15
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
      Begin MSMask.MaskEdBox mskTelefone 
         Height          =   375
         Left            =   1200
         TabIndex        =   5
         Top             =   4320
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   9
         Mask            =   "####-####"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCelular 
         Height          =   375
         Left            =   1200
         TabIndex        =   6
         Top             =   4800
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   9
         Mask            =   "####-####"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCEP 
         Height          =   375
         Left            =   1200
         TabIndex        =   7
         Top             =   5280
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   9
         Mask            =   "#####-###"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskDT 
         Height          =   375
         Left            =   600
         TabIndex        =   4
         Top             =   3720
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         _Version        =   393216
         MaxLength       =   10
         Mask            =   "##/##/####"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskCod 
         Height          =   375
         Left            =   960
         TabIndex        =   24
         Top             =   720
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   8
         Mask            =   "########"
         PromptChar      =   "_"
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "dd/tt/llll"
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
         Left            =   3960
         TabIndex        =   35
         Top             =   600
         Width           =   720
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "dd/ll/tttt"
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
         Left            =   2760
         TabIndex        =   34
         Top             =   600
         Width           =   780
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
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
         Left            =   0
         TabIndex        =   33
         Top             =   2160
         Width           =   840
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
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
         Left            =   120
         TabIndex        =   32
         Top             =   720
         Width           =   750
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
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
         Left            =   120
         TabIndex        =   31
         Top             =   1200
         Width           =   630
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Data de Aniversário"
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
         Left            =   120
         TabIndex        =   30
         Top             =   3240
         Width           =   2085
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Rua"
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
         Left            =   120
         TabIndex        =   29
         Top             =   1680
         Width           =   450
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
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
         Left            =   120
         TabIndex        =   28
         Top             =   2640
         Width           =   630
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
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
         Left            =   240
         TabIndex        =   27
         Top             =   5280
         Width           =   480
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Telefone"
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
         Left            =   120
         TabIndex        =   26
         Top             =   4320
         Width           =   930
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
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
         Left            =   120
         TabIndex        =   25
         Top             =   4800
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmControle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Sexo As String
Dim dia As String
Dim mes As String
Dim ano As String
Private Sub cmdAnterior_Click()
Call Desativar
Tabelas.MoveNext
If Tabelas.EOF = True Then Tabelas.MoveFirst
Call Mostrar
Call Ativar
End Sub

Private Sub cmdBuscar_Click()
On Error GoTo cmdBuscar
Call Desativar
Tabelas.Close
Tabelas.Open "Select * from Banco where Codigo=" & mskCod
Call Mostrar
MsgBox "Informações Buscadas com Sucesso", vbInformation, "..."
Call Ativar

Tabelas.Close
Tabelas.Open "Select * from Banco"
cmdBuscar:


End Sub

Private Sub cmdDeletar_Click()

Call Desativar
If MsgBox("Excluir Cadastro?", vbQuestion + vbYesNo + vbDefaultButton2, "...") = vbYes Then
Conecta.Execute "delete * from Banco where codigo=" & mskCod
MsgBox "Cadastro Exclído", vbInformation, "..."
cmdLimpar = True
Call Ativar
End If

Adodc1.Refresh
DataGrid1.Refresh

Tabelas.Close
Tabelas.Open "select * from Banco"
End Sub

Private Sub cmdLimpar_Click()
txtNome = Clear
txtRua = Clear
txtNumero = Clear
txtBairro = Clear
Call Desativar
mskCelular.Text = Clear
mskCEP.Text = Clear
mskTelefone.Text = Clear
mskCod.Text = Clear
Call Ativar

mskDT.PromptInclude = False
mskDT.Text = Clear
mskDT.PromptInclude = True

optM = False
optF = False


Call Desativar
Tabelas.Close
Tabelas.Open "Banco", Conecta, adOpenKeyset, adLockOptimistic


Call Ativar


txtNome.SetFocus

End Sub

Private Sub cmdProximo_Click()
Call Desativar


Tabelas.MovePrevious
If Tabelas.BOF = True Then Tabelas.MoveLast
Call Mostrar
Call Ativar



End Sub

Private Sub cmdSair_Click()
If MsgBox("Sair?", vbQuestion + vbYesNo + vbDefaultButton2, "...") = vbYes Then End
End Sub

Private Sub cmdSalvar_Click()


Call Desativar
If mskCod = Empty Then
Dim q As Integer
Dim w As Integer
q = 1
While w = Empty
Tabelas.Close
Tabelas.Open "select * from Banco where Codigo=" & q
If Tabelas.BOF = False Or Tabelas.EOF = False Then
q = q + 1
Else
w = 1
End If
Wend
mskCod = q
End If


mskDT.PromptInclude = False
If mskDT = Empty Then
mskDT = "11111111"

End If
mskDT.PromptInclude = True


Tabelas.Close
 Tabelas.Open "Select * from Banco where Codigo=" & mskCod
 If Tabelas.BOF = False Or Tabelas.EOF = False Then
 If MsgBox("Alterar Cadastro?", vbQuestion + vbYesNo + vbDefaultButton2, "...") = vbYes Then
 Conecta.Execute "update Banco set Nome='" & txtNome & "' , Rua='" & txtRua & "' , Numero='" & txtNumero & "' , Bairro='" & txtBairro & "' , Telefone='" & mskTelefone & "' , Celular='" & mskCelular & "' , CEP='" & mskCEP & "' , DT='" & mskDT & "' , Sexo='" & Sexo & "' where Codigo=" & mskCod
MsgBox "Cadastro Alterado", vbInformation, "..."

End If

Else

Conecta.Execute "Insert Into Banco(Codigo, Nome, Rua, Numero, Bairro, Telefone, Celular, CEP, DT, Sexo)" & _
"Values('" & mskCod.Text & "' , '" & txtNome & "' , '" & txtRua & "' , '" & txtNumero & "' , '" & txtBairro & "' , '" & mskTelefone.Text & "' , '" & mskCelular.Text & "' , '" & mskCEP.Text & "' , '" & mskDT.Text & "' , '" & Sexo & "')"
Call Ativar
MsgBox "Informações Gravadas", vbInformation, "..."
cmdLimpar = True
End If

Adodc1.Refresh
DataGrid1.Refresh


End Sub



Private Sub Command1_Click()
text1 = Clear
End Sub

Private Sub Command7_Click()
DataReport1.Show
End Sub

Private Sub DataGrid1_Click()
Timer1.Enabled = True
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
 If KeyAscii = 13 Then
            SendKeys "{TAB}"
            End If
End Sub

Private Sub Form_Load()
Call Desativar
Label10.Caption = Date
Timer2 = True
a = "BlueMSN.skn"


Skin1.LoadSkin (App.Path & "\" & a) ' app.patch indica que o skin esta na mesma página que o projeto
Skin1.ApplySkin Me.hWnd ' aplica o skin
Call Abrir_Banco

Tabelas.Open "Banco", Conecta, adOpenKeyset, adLockOptimistic


Dim z As Integer


Tabelas.MoveLast
mskCod = Tabelas!codigo



Call Ativar
End Sub





Private Sub mskCod_LostFocus()
cmdBuscar = True
End Sub

Private Sub mskDT_LostFocus()
If Not IsDate(mskDT) Then
MsgBox "Data Ínvalida", vbCritical, "..."
mskDT.PromptInclude = False
mskDT.Text = Clear
mskDT.PromptInclude = True
End If
End Sub

Private Sub optF_Click()
Sexo = "F"
End Sub

Private Sub optM_Click()
Sexo = "M"
End Sub

Private Sub Desativar()

mskCelular.PromptInclude = False
mskCEP.PromptInclude = False
mskTelefone.PromptInclude = False
mskCod.PromptInclude = False
End Sub

Private Sub Ativar()
mskCelular.PromptInclude = True
mskCEP.PromptInclude = True
mskTelefone.PromptInclude = True
mskCod.PromptInclude = True
End Sub

Private Sub Mostrar()
Call Desativar

txtNome = Tabelas!Nome
txtRua = Tabelas!Rua
txtNumero = Tabelas!Numero
txtBairro = Tabelas!Bairro
mskCelular = Tabelas!Celular
mskCEP = Tabelas!CEP
mskTelefone = Tabelas!Telefone
mskCod = Tabelas!codigo
Sexo = Tabelas!Sexo
If Sexo = "M" Then optM.SetFocus
If Sexo = "F" Then optF.SetFocus

If Day(Tabelas!DT) < 10 Then
dia = "0" & Day(Tabelas!DT)
Else
dia = Day(Tabelas!DT)
End If

If Month(Tabelas!DT) < 10 Then
mes = "0" & Month(DT)
Else
mes = Month(DT)
End If

ano = Year(Tabelas!DT)

mskDT.PromptInclude = False
mskDT.Text = dia & mes & ano
mskDT.PromptInclude = True


Call Ativar

End Sub

Private Sub Text1_Change()
            Adodc1.CommandType = adCmdText
            Adodc1.RecordSource = "select * from banco where nome like '" & text1 & "%'"
            Adodc1.Refresh
            DataGrid1.Refresh
End Sub

Private Sub Timer1_Timer()
Call Desativar
mskCod = Text2
sstab1.Tab = 0
Timer1.Enabled = False
cmdBuscar = True
Call Ativar

End Sub

Private Sub Timer2_Timer()
Label11.Caption = Time
End Sub
