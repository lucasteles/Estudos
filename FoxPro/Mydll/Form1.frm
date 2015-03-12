VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7815
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10740
   LinkTopic       =   "Form1"
   ScaleHeight     =   7815
   ScaleWidth      =   10740
   StartUpPosition =   3  'Windows Default
   Begin RichTextLib.RichTextBox text1 
      Height          =   6375
      Left            =   240
      TabIndex        =   4
      Top             =   1320
      Width           =   10215
      _ExtentX        =   18018
      _ExtentY        =   11245
      _Version        =   393217
      TextRTF         =   $"Form1.frx":0000
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Command4"
      Height          =   735
      Left            =   9840
      TabIndex        =   3
      Top             =   240
      Width           =   735
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command1"
      Height          =   615
      Left            =   6120
      TabIndex        =   2
      Top             =   360
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command1"
      Height          =   615
      Left            =   3360
      TabIndex        =   1
      Top             =   360
      Width           =   2655
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   615
      Left            =   480
      TabIndex        =   0
      Top             =   360
      Width           =   2655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim obj As New returnfields.RF


Private Sub Command1_Click()

Me.text1 = obj.ReturnFieldNameXML("tb_cadunico", True)

End Sub

Private Sub Command2_Click()
Me.text1 = obj.ReturnFieldName("tb_cadunico", False)
End Sub

Private Sub Command3_Click()
Me.text1 = obj.ReturnFieldNameTAB("tb_cadunico", True)

End Sub

Private Sub Command4_Click()
    Me.text1 = obj.LOFIELDS.field_1
End Sub

Private Sub Form_Load()
Me.text1 = obj.OpenDB("DRIVER=SQL SERVER;SERVER=NBTELES;UID=sa;PWD=root;DATABASE=volpepwiteste")
End Sub


