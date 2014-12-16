VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H8000000C&
   Caption         =   "Form1"
   ClientHeight    =   4860
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7425
   LinkTopic       =   "Form1"
   ScaleHeight     =   4860
   ScaleWidth      =   7425
   StartUpPosition =   3  'Windows Default
   Begin Project1.TelesGif TelesGif1 
      Height          =   1695
      Left            =   5880
      TabIndex        =   2
      Top             =   2040
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   2990
      Stretch         =   0   'False
   End
   Begin Project1.UserControl1 UserControl11 
      Height          =   1575
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   "OBJECT"
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   5535
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   30
   End
   Begin Project1.UserControl1 UserControl12 
      Height          =   1575
      Left            =   0
      TabIndex        =   1
      Top             =   1680
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   2778
      imagem          =   ""
      Texto           =   "OBJECT"
      BeginProperty Fonte {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty SelFontSize {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tekton Pro"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Fonte_Cor       =   16777215
      Fonte_Nova_Cor  =   255
      largura         =   5535
      altura          =   1575
      ImagemLargura   =   735
      ImagemAltura    =   615
      Percent         =   30
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Me.UserControl11.imagem = App.Path & "\image1.jpg"
    Me.UserControl12.imagem = App.Path & "\image1.jpg"
    
    Me.TelesGif1.File = App.Path + "\gif.gif"
    Me.TelesGif1.OpenGif
End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   If UserControl11.status = 1 Then
        UserControl11.Back
    End If
     If UserControl12.status = 1 Then
        UserControl12.Back
    End If
End Sub

Private Sub UserControl11_click()
    MsgBox "funciona"
End Sub

Private Sub UserControl11_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   If UserControl11.status = 0 Then
        UserControl11.GO
    End If
End Sub
Private Sub UserControl12_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   If UserControl12.status = 0 Then
        UserControl12.GO
    End If
End Sub

