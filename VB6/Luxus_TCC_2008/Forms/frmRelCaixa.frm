VERSION 5.00
Begin VB.Form frmRela 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Imprimir Relatórios"
   ClientHeight    =   9435
   ClientLeft      =   3345
   ClientTop       =   -1635
   ClientWidth     =   11655
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   9435
   ScaleWidth      =   11655
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Pictu 
      BackColor       =   &H00FFFFFF&
      Height          =   9312
      Left            =   0
      ScaleHeight     =   9255
      ScaleWidth      =   11595
      TabIndex        =   0
      Top             =   0
      Width           =   11652
   End
   Begin VB.Image Image1 
      Height          =   1695
      Left            =   120
      Picture         =   "frmRelCaixa.frx":0000
      Stretch         =   -1  'True
      Top             =   10080
      Width           =   2655
   End
End
Attribute VB_Name = "frmRela"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Form_Load()
actskin.ApplySkin Me.hWnd
End Sub
