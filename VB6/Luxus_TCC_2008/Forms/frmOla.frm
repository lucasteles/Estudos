VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmola 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1140
   ClientLeft      =   7500
   ClientTop       =   6840
   ClientWidth     =   4425
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   FillStyle       =   0  'Solid
   Icon            =   "frmOla.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1140
   ScaleWidth      =   4425
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   615
      Left            =   120
      ScaleHeight     =   615
      ScaleWidth      =   735
      TabIndex        =   1
      Top             =   360
      Width           =   735
      Begin VB.Image ImgCritical 
         Height          =   480
         Left            =   0
         Picture         =   "frmOla.frx":000C
         Stretch         =   -1  'True
         Top             =   0
         Visible         =   0   'False
         Width           =   480
      End
      Begin VB.Image imgObs 
         Height          =   600
         Left            =   0
         Picture         =   "frmOla.frx":0C4E
         Stretch         =   -1  'True
         Top             =   0
         Width           =   600
      End
      Begin VB.Image Img 
         Height          =   600
         Left            =   0
         Picture         =   "frmOla.frx":145B
         Stretch         =   -1  'True
         Top             =   0
         Visible         =   0   'False
         Width           =   600
      End
      Begin VB.Image imgInfo 
         Height          =   600
         Left            =   0
         Picture         =   "frmOla.frx":20F7
         Stretch         =   -1  'True
         Top             =   0
         Visible         =   0   'False
         Width           =   600
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel lbl 
      Height          =   855
      Left            =   960
      OleObjectBlob   =   "frmOla.frx":2FEB
      TabIndex        =   0
      Top             =   360
      Width           =   3375
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   1920
      OleObjectBlob   =   "frmOla.frx":305B
      Top             =   720
   End
   Begin VB.Timer Timer1 
      Interval        =   6000
      Left            =   3600
      Top             =   120
   End
End
Attribute VB_Name = "frmola"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cont As Integer
Private Sub Form_Activate()
    Call Subir
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then Unload Me
End Sub

Private Sub Form_Load()
lbl.Caption = "Bem Vindo" & Chr(13) & nome
If status = "salvos" Or status = "salvas" Then
imgInfo.Visible = True
imgObs.Visible = False
Timer1.Interval = 4000
lbl.Caption = "Suas informaçoes foram salvas com sucesso"
ElseIf status = "alteradas" Then
lbl.Caption = "Suas informaçoes foram alteradas com sucesso"
Timer1.Interval = 4000
imgInfo.Visible = True
imgObs.Visible = False
ElseIf status = "excluidos" Then
lbl.Caption = "Suas informaçoes foram excluidas com sucesso"
Timer1.Interval = 4000
imgInfo.Visible = True
imgObs.Visible = False
End If


Skin1.LoadSkin (App.Path & "\WinMediaPlayer11.skn")
Skin1.ApplySkin Me.hWnd

    Me.Left = Screen.Width - (Me.Width + 650)
    Me.Top = Screen.Height - 4000 'Para ficar do tamanho certo
End Sub
Private Sub Subir()
    Dim H As Integer
    
    H = Me.Height
    Me.Height = 0
    
    While Me.Height < H
        Me.Height = Me.Height + 1
        Me.Top = Me.Top - 1
        DoEvents
    Wend
End Sub

Private Sub Descer()
    On Error Resume Next
    
    While Me.Height > 585
        Me.Height = Me.Height - 1
        Me.Top = Me.Top + 1
        DoEvents
    Wend
    Unload Me
End Sub

Private Sub Form_LostFocus()
            Unload Me
End Sub

Private Sub Label1_Click()

End Sub

Private Sub Timer1_Timer()
Call Descer
    Unload Me
End Sub

Private Sub Timer2_Timer()

End Sub

