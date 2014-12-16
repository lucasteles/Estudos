VERSION 5.00
Begin VB.UserControl UserControl1 
   BackColor       =   &H00000000&
   ClientHeight    =   2115
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6030
   ScaleHeight     =   2115
   ScaleWidth      =   6030
   Begin VB.Timer tGO 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   4440
      Top             =   0
   End
   Begin VB.Timer tBACK 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   3840
      Top             =   0
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "OBJECT"
      BeginProperty Font 
         Name            =   "@Arial Unicode MS"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000B&
      Height          =   540
      Left            =   1680
      TabIndex        =   1
      Top             =   480
      Width           =   1620
   End
   Begin VB.Image Image1 
      Height          =   615
      Left            =   600
      Stretch         =   -1  'True
      Top             =   480
      Width           =   735
   End
   Begin VB.Label Label2 
      BackColor       =   &H80000007&
      Caption         =   "Label2"
      Height          =   1695
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5535
   End
   Begin VB.Image picture1 
      Height          =   1575
      Left            =   0
      Picture         =   "UserControl1.ctx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   5475
   End
End
Attribute VB_Name = "UserControl1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim MyHEIGHT As Integer
Dim MyWIDTH As Integer
Dim CAPTION As String
Dim urlimg As String
Dim NOME As String
Dim FontSize As Font
Dim ImagePorc As Integer
Dim NewFontSize As Font
Dim FontColor As OLE_COLOR
Dim newFontColor As OLE_COLOR
Dim image_w As Integer
Dim image_h As Integer
Dim status_ As Integer
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event click()

Private Sub resize()
     MyHEIGHT = UserControl.Height
    MyWIDTH = UserControl.Width
    Label2.Width = UserControl.Width
    Label2.Height = UserControl.Height
    picture1.Height = UserControl.Height
    picture1.Width = UserControl.Width
     Image1.Top = (UserControl.Height / 2) - (Image1.Height / 2)
    Label1.Top = (UserControl.Height / 2) - (Label1.Height / 2)
End Sub

Public Sub Back()
    Label2.Visible = True
    Set Label1.Font = FontSize
    Label1.ForeColor = FontColor
    tBACK.Enabled = True
    status_ = 0
    Call resize
End Sub

Public Sub GO()
    Label2.Visible = False
    Set Label1.Font = NewFontSize
    Label1.ForeColor = newFontColor
    status_ = 1
    tGO.Enabled = True
    Call resize
End Sub



Private Sub Label2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
     RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub

Private Sub picture1_Click()
 RaiseEvent click
End Sub

Private Sub tBACK_Timer()
    If image_h < Image1.Height Then
        Image1.Width = Image1.Width - 8
        Image1.Height = Image1.Height - 8
        Image1.Left = Image1.Left + 5
        Call resize
        tGO.Enabled = False
    Else
    tBACK.Enabled = False
    End If
End Sub

Private Sub tGO_Timer()
    If Image1.Height < ((image_h / 100) * ImagePorc) + image_h Then
        Image1.Width = Image1.Width + 8
        Image1.Height = Image1.Height + 8
        Image1.Left = Image1.Left - 5
        Call resize
        tBACK.Enabled = False
    Else
        tGO.Enabled = False
    End If
End Sub



Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub

Private Sub UserControl_Resize()
    Call resize
    image_w = Image1.Width
    image_h = Image1.Height
End Sub
Private Sub UserControl_Initialize()
    Call resize
    image_w = Image1.Width
    image_h = Image1.Height
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    urlimg = PropBag.ReadProperty("imagem", urlimg)
    Label1.CAPTION = PropBag.ReadProperty("Texto", "?")
    Set FontSize = PropBag.ReadProperty("fonte", Ambient.Font)
    Set NewFontSize = PropBag.ReadProperty("SelFontSize", Ambient.Font)
    FontColor = PropBag.ReadProperty("fonte_cor", &H8000000E) 'Preto
    newFontColor = PropBag.ReadProperty("Fonte_Nova_Cor", &H8000000E) 'Preto
    MyWIDTH = PropBag.ReadProperty("largura", 1215)
    MyHEIGHT = PropBag.ReadProperty("altura", 285)
    Image1.Width = PropBag.ReadProperty("ImagemLargura", 500)
    Image1.Height = PropBag.ReadProperty("ImagemAltura", 500)
    ImagePorc = PropBag.ReadProperty("Percent", 20)
    status_ = PropBag.ReadProperty("status", 0)
End Sub


Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("imagem", urlimg)
    Call PropBag.WriteProperty("Texto", Label1.CAPTION, "?")
    Call PropBag.WriteProperty("Fonte", FontSize, Ambient.Font)
    Call PropBag.WriteProperty("SelFontSize", NewFontSize, Ambient.Font)
    Call PropBag.WriteProperty("Fonte_Cor", FontColor, &H8000000E)
    Call PropBag.WriteProperty("Fonte_Nova_Cor", newFontColor, &H8000000E)
    Call PropBag.WriteProperty("largura", Width, 1215)
    Call PropBag.WriteProperty("altura", Height, 285)
    Call PropBag.WriteProperty("ImagemLargura", Image1.Width, 500)
    Call PropBag.WriteProperty("ImagemAltura", Image1.Height, 500)
    Call PropBag.WriteProperty("Percent", ImagePorc, 20)
    Call PropBag.WriteProperty("status", status_, 0)
End Sub

Public Property Get status() As Integer
status = status_
End Property

Public Property Let status(ByVal new_ As Integer)
 status_ = new_
 PropertyChanged "status"
End Property
Public Property Get Percent() As Integer
Percent = ImagePorc
End Property

Public Property Let Percent(ByVal new_ As Integer)
 ImagePorc = new_
 PropertyChanged "Percent"
End Property

Public Property Get SelFontSize() As Font
Set SelFontSize = NewFontSize
End Property

Public Property Set SelFontSize(ByVal new_ As Font)
 Set NewFontSize = new_
 PropertyChanged "SelFontSize"
End Property

Public Property Get ImagemLargura() As String
ImagemLargura = Image1.Width
End Property

Public Property Let ImagemLargura(ByVal new_w As String)
 Image1.Width = new_w
 PropertyChanged "ImagemLargura"
End Property

Public Property Get ImagemAltura() As String
ImagemAltura = Image1.Height
End Property

Public Property Let ImagemAltura(ByVal new_h As String)
 Image1.Height = new_h
 PropertyChanged "ImagemAltura"
End Property


Public Property Get imagem() As String
imagem = urlimg
End Property

Public Property Let imagem(ByVal new_img As String)
urlimg = new_img
Image1.Picture = LoadPicture(new_img)
PropertyChanged "imagem"
End Property


Public Property Get texto() As String
texto = Label1.CAPTION
End Property

Public Property Let texto(ByVal new_txt As String)
Label1.CAPTION = new_txt
PropertyChanged "texto"
End Property


Public Property Get Fonte() As Font
Set Fonte = FontSize
End Property

Public Property Set Fonte(ByVal New_Font As Font)
Set FontSize = New_Font
Set Label1.Font = FontSize
PropertyChanged "Fonte"
End Property

Public Property Get Fonte_Cor() As OLE_COLOR
Fonte_Cor = FontColor
End Property

Public Property Let Fonte_Cor(ByVal New_ForeColor As OLE_COLOR)
FontColor = New_ForeColor
Label1.ForeColor() = FontColor
PropertyChanged "Fonte_Cor"
End Property


Public Property Get Fonte_Nova_Cor() As OLE_COLOR
Fonte_Nova_Cor = newFontColor
End Property

Public Property Let Fonte_Nova_Cor(ByVal New_ForeColor As OLE_COLOR)
newFontColor = New_ForeColor
PropertyChanged "Fonte_Nova_Cor"
End Property

Public Property Get largura() As Long
largura = MyWIDTH
End Property

Public Property Let largura(ByVal Novo_L_Width As Long)
MyWIDTH = Novo_L_Width
picture1.Width = MyWIDTH
UserControl.Width = MyWIDTH
Label2.Width = MyWIDTH
PropertyChanged "largura"
Refresh
End Property

Public Property Get altura() As Long
altura = MyHEIGHT
End Property

Public Property Let altura(ByVal Novo_A_Height As Long)
MyHEIGHT = Novo_A_Height
picture1.Height = MyHEIGHT
Image1.Top = MyHEIGHT - (Image1.Top / 2)
Label1.Top = MyHEIGHT - (Label1.Top / 2)
UserControl.Height = MyHEIGHT
Label2.Height = MyHEIGHT
PropertyChanged "altura"
Refresh
End Property


