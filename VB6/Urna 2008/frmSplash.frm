VERSION 5.00
Begin VB.Form frmSplash 
   BackColor       =   &H000000FF&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   3570
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   8865
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3570
   ScaleWidth      =   8865
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrfim 
      Interval        =   2000
      Left            =   0
      Top             =   0
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Height          =   3315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   8625
      Begin VB.Timer Timer8 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer Timer7 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer Timer6 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer Timer5 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer Timer4 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer Timer3 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer Timer1 
         Interval        =   250
         Left            =   0
         Top             =   0
      End
      Begin VB.Image Image2 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":0442
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Image Image8 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":2F64
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Image Image7 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":3A81
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Image Image6 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":45B9
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Image Image5 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":50D7
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Image Image4 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":5C07
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Image Image3 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":673E
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Image Image1 
         Height          =   855
         Left            =   6240
         Picture         =   "frmSplash.frx":726F
         Stretch         =   -1  'True
         Top             =   1800
         Width           =   975
      End
      Begin VB.Image imgLogo 
         Height          =   1950
         Left            =   1080
         Picture         =   "frmSplash.frx":7D94
         Top             =   600
         Width           =   1920
      End
      Begin VB.Label lblWarning 
         BackStyle       =   0  'Transparent
         Caption         =   "Info B"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   195
         Left            =   480
         TabIndex        =   2
         Top             =   3000
         Width           =   3975
      End
      Begin VB.Label lblProductName 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Urna Eletronica"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   510
         Left            =   4080
         TabIndex        =   4
         Top             =   600
         Width           =   3210
      End
      Begin VB.Label lblLicenseTo 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Info B"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   1560
         TabIndex        =   1
         Top             =   240
         Width           =   6855
      End
      Begin VB.Label B 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "By Lucas"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   435
         Left            =   5520
         TabIndex        =   3
         Top             =   1200
         Width           =   1590
      End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
    Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
End Sub

Private Sub Frame1_Click()
    Unload Me
End Sub

Private Sub Timer1_Timer()
Timer1.Enabled = False
Timer2.Enabled = False
Timer3.Enabled = False
Timer4.Enabled = False
Timer5.Enabled = False
Timer6.Enabled = False
Timer7.Enabled = False
Timer8.Enabled = False


            Image1.Visible = False
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
            Image5.Visible = False
            Image6.Visible = False
            Image7.Visible = False
            Image8.Visible = False
            Image2.Visible = True
            Timer2.Enabled = True
            
End Sub

Private Sub tmrfim_Timer()
            Unload Me
           
End Sub

Private Sub Timer2_Timer()
Timer1.Enabled = False
Timer2.Enabled = False
Timer3.Enabled = False
Timer4.Enabled = False
Timer5.Enabled = False
Timer6.Enabled = False
Timer7.Enabled = False
Timer8.Enabled = False


            Image1.Visible = False
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
            Image5.Visible = False
            Image6.Visible = False
            Image7.Visible = False
            Image8.Visible = False
            Image3.Visible = True
            Timer3.Enabled = True
            
End Sub

Private Sub Timer3_Timer()
Timer1.Enabled = False
Timer2.Enabled = False
Timer3.Enabled = False
Timer4.Enabled = False
Timer5.Enabled = False
Timer6.Enabled = False
Timer7.Enabled = False
Timer8.Enabled = False


            Image1.Visible = False
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
            Image5.Visible = False
            Image6.Visible = False
            Image7.Visible = False
            Image8.Visible = False
            Image4.Visible = True
            Timer4.Enabled = True
            
End Sub

Private Sub Timer4_Timer()
Timer1.Enabled = False
Timer2.Enabled = False
Timer3.Enabled = False
Timer4.Enabled = False
Timer5.Enabled = False
Timer6.Enabled = False
Timer7.Enabled = False
Timer8.Enabled = False


            Image1.Visible = False
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
            Image5.Visible = False
            Image6.Visible = False
            Image7.Visible = False
            Image8.Visible = False
            Image5.Visible = True
            Timer5.Enabled = True
            
             Form1.Show
             frmSplash.SetFocus
            
End Sub

Private Sub Timer5_Timer()
Timer1.Enabled = False
Timer2.Enabled = False
Timer3.Enabled = False
Timer4.Enabled = False
Timer5.Enabled = False
Timer6.Enabled = False
Timer7.Enabled = False
Timer8.Enabled = False


            Image1.Visible = False
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
            Image5.Visible = False
            Image6.Visible = False
            Image7.Visible = False
            Image8.Visible = False
            Image6.Visible = True
            Timer6.Enabled = True
            
            
            
End Sub

Private Sub Timer6_Timer()
Timer1.Enabled = False
Timer2.Enabled = False
Timer3.Enabled = False
Timer4.Enabled = False
Timer5.Enabled = False
Timer6.Enabled = False
Timer7.Enabled = False
Timer8.Enabled = False


            Image1.Visible = False
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
            Image5.Visible = False
            Image6.Visible = False
            Image7.Visible = False
            Image8.Visible = False
            Image7.Visible = True
            Timer7.Enabled = True
            
End Sub
Private Sub Timer7_Timer()
Timer1.Enabled = False
Timer2.Enabled = False
Timer3.Enabled = False
Timer4.Enabled = False
Timer5.Enabled = False
Timer6.Enabled = False
Timer7.Enabled = False
Timer8.Enabled = False


            Image1.Visible = False
            Image2.Visible = False
            Image3.Visible = False
            Image4.Visible = False
            Image5.Visible = False
            Image6.Visible = False
            Image7.Visible = False
            Image8.Visible = False
            Image8.Visible = True
            Timer8.Enabled = True
            
End Sub

