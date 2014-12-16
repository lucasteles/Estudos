VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{396F7AC0-A0DD-11D3-93EC-00C0DFE7442A}#1.0#0"; "vbalIml6.ocx"
Begin VB.MDIForm mdiLuxus 
   BackColor       =   &H8000000C&
   Caption         =   "Luxus System"
   ClientHeight    =   7755
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11250
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin ACTIVESKINLibCtl.Skin Skin2 
      Left            =   1800
      OleObjectBlob   =   "MDIForm1.frx":08CA
      Top             =   840
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   0
      Top             =   0
   End
   Begin Luxus.ACPRibbon Ribbon 
      Align           =   1  'Align Top
      Height          =   1740
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11250
      _ExtentX        =   19844
      _ExtentY        =   3069
      BackColor       =   4210752
      ForeColor       =   -2147483630
      Begin ACTIVESKINLibCtl.Skin Skin1 
         Left            =   840
         OleObjectBlob   =   "MDIForm1.frx":0AFE
         Top             =   840
      End
      Begin vbalIml6.vbalImageList vbalImageList1 
         Left            =   4440
         Top             =   840
         _ExtentX        =   953
         _ExtentY        =   953
         IconSizeX       =   32
         IconSizeY       =   32
         ColourDepth     =   32
         Size            =   2250120
         Images          =   "MDIForm1.frx":0D32
         Version         =   131072
         KeyCount        =   510
         Keys            =   $"MDIForm1.frx":2262DA
      End
      Begin vbalIml6.vbalImageList ImageListSubMenu 
         Left            =   3960
         Top             =   840
         _ExtentX        =   953
         _ExtentY        =   953
         ColourDepth     =   32
         Size            =   102172
         Images          =   "MDIForm1.frx":2264DB
         Version         =   131072
         KeyCount        =   89
         Keys            =   "ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
      End
   End
End
Attribute VB_Name = "mdiLUxus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MDIForm_Unload(Cancel As Integer)
End
End Sub

Private Sub Ribbon_ButtonClick(ByVal ID As String, ByVal Caption As String)


Select Case ID
Case "btClientes"
   frmClientes.Show
    frmClientes.SetFocus
    
Case "btFornecedores"
     frmForneced.Show
     frmForneced.SetFocus
     
Case "btDesigne"
    frmDesig.Show
     frmDesig.SetFocus
     
Case "btTrans"
    frmTransport.Show
    frmTransport.SetFocus
    
Case "btModelos"
    frmMdisig.Show
    frmMdisig.SetFocus
    
Case "btPeças"
    frmPeças.Show
    frmPeças.SetFocus
    
    
Case "btProdutos"
    frmProdutos.Show
    frmProdutos.SetFocus
    
Case "bttipo"
    frmTipo_cor.Show
    frmTipo_cor.SetFocus
    
Case "btPedidos"
      frmPedidos.Show
      frmPedidos.SetFocus
      
      
Case "btEstoque"
      frmEstoque.Show
      frmEstoque.SetFocus
      
Case "btCalc"
     frmCalc.Show
     frmCalc.SetFocus
     
     
Case "btCaixa"
    frmCaixa.Show
    frmCaixa.SetFocus
    
Case "btUsu"
    frmUsuarios.Show
    frmUsuarios.SetFocus
    
Case "btContas_a_Receber"
    frmContasReceber.Show
    frmContasReceber.SetFocus
    
Case "btContas_a_Pagar"
   frmContasPagar.Show
   frmContasPagar.SetFocus
   
Case "btCustos"
    frmCustosfixos.Show
    frmCustosfixos.SetFocus
    
Case "btContP"
    frmProduçao.Show
    frmProduçao.SetFocus
    
Case "btcontT"
    frmContTrans.Show
    frmContTrans.SetFocus
    
Case "btpedc"
    frmPed_Comp.Show
    frmPed_Comp.SetFocus
    
Case "btpedm"
    frmPed_Des.Show
    frmPed_Des.SetFocus
    
Case "btpedt"
    frmPed_Trans.Show
    frmPed_Trans.SetFocus
    
Case "btPedt"
    frmPed_Trans.Show
    frmPed_Trans.SetFocus
    
Case "vbCad"
Dim Word As New Word.Application
  Word.Documents.Open App.Path & "\1.doc"
  Word.Visible = True
 Word.WindowState = wdWindowStateMaximize

Case "vbFin"
Dim Word2 As New Word.Application
    Word2.Documents.Open App.Path & "\2.doc"
    Word2.Visible = True
    Word2.WindowState = wdWindowStateMaximize


Case "vbCont"
Dim Word3 As New Word.Application
   Word3.Documents.Open App.Path & "\3.doc"
   Word3.Visible = True
   Word3.WindowState = wdWindowStateMaximize

End Select




End Sub


Private Sub MDIForm_Load()
Set actskin = Ribbon.LoadSkin
actskin3.ApplySkin Me.hWnd
Ribbon.Theme = 3
Me.Picture = Ribbon.LoadBackground
Me.BackColor = Ribbon.BackColor

End Sub



Private Sub Timer1_Timer()
mdiLUxus.Caption = "Luxus Systen - " & Date & " - " & Time
End Sub
