VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmSplash 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   4245
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   7380
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   2640
      OleObjectBlob   =   "frmSplash.frx":0442
      Top             =   1680
   End
   Begin VB.Timer Timer1 
      Interval        =   4000
      Left            =   120
      Top             =   3240
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim TextField As SkinStatic
Dim NomeAplicacao As String
NomeAplicacao = "Location Control"
Dim DescricaoAplicacao As String
DescricaoAplicacao = "Controle de Endereços"
Skin1.LoadSkin App.Path & "\Splash.skn"
Skin1.ApplySkin Me.hWnd
Skin1.ApplySkinByName hWnd, "Form1"



Set TextField = Skin1.GetSkinnedWindow(hWnd).FindObject("NomeAplicacao")
TextField.SetCaption NomeAplicacao
Set TextField = Skin1.GetSkinnedWindow(hWnd).FindObject("DescricaoAplicacao")
TextField.SetCaption DescricaoAplicacao

End Sub

Private Sub Timer1_Timer()
Unload Me
frmControle.Show
End Sub
