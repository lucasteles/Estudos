VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm mdiVendas 
   BackColor       =   &H8000000C&
   Caption         =   "Vendas"
   ClientHeight    =   3090
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   120
      Top             =   1560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   48
      ImageHeight     =   48
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiVendas.frx":0000
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   1080
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   1905
      ButtonWidth     =   1455
      ButtonHeight    =   1799
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   1
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "clientes"
            ImageIndex      =   1
            Object.Width           =   1e-4
         EndProperty
      EndProperty
      OLEDropMode     =   1
   End
   Begin VB.Menu mnuCad 
      Caption         =   "&Cadastro"
      Begin VB.Menu mnuCadClientes 
         Caption         =   "c&Lientes"
      End
      Begin VB.Menu mnuCadForn 
         Caption         =   "Fornecedores"
      End
   End
End
Attribute VB_Name = "mdiVendas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub MDIForm_Load()
            Call abrir_banco
End Sub

Private Sub mnuCadClientes_Click()
            frmClientes.Show
End Sub

Private Sub mnuCadForn_Click()
devendas.rsComClientes.Filter = "nome=marcelo"
rptVendas.Show
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
            Select Case Button.Index
            Case 1: frmClientes.Show
            End Select
End Sub
