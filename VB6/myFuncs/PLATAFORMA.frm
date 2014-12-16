VERSION 5.00
Begin VB.MDIForm PLATAFORMA 
   BackColor       =   &H8000000C&
   Caption         =   "FUNCTIONS"
   ClientHeight    =   8040
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   8610
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Menu mnuARQUI 
      Caption         =   "Arquivo"
      Begin VB.Menu mnuCLI 
         Caption         =   "Clientes"
      End
      Begin VB.Menu mnuPROD 
         Caption         =   "Produtos"
      End
      Begin VB.Menu mnuPED 
         Caption         =   "Pedidos"
      End
   End
End
Attribute VB_Name = "PLATAFORMA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub MDIForm_Load()
Call BANCO
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
Call SAIR
End Sub

Private Sub mnuCLI_Click()
    frmCLIENTES.Show
End Sub

Private Sub mnuPED_Click()
    MyFuncs.Show
End Sub

Private Sub mnuPROD_Click()
    frmPROD.Show
End Sub
