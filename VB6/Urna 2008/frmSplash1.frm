VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmSplash1 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1770
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   4470
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash1.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1770
   ScaleWidth      =   4470
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   1920
      OleObjectBlob   =   "frmSplash1.frx":000C
      Top             =   960
   End
   Begin VB.Timer Timer1 
      Interval        =   6000
      Left            =   720
      Top             =   1080
   End
End
Attribute VB_Name = "frmSplash1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()


Dim TextField As SkinStatic
Dim NomeAplicacao As String
NomeAplicacao = "Simple Work Control 1.0"
Dim DescricaoAplicacao As String
DescricaoAplicacao = "Controle seus serviços de forma simplificada"
Skin1.LoadSkin App.Path & "\Splash.skn"
Skin1.ApplySkin Me.hWnd
Skin1.ApplySkinByName hWnd, "Form1"



End Sub

Private Sub Timer1_Timer()
Unload Me

End Sub

