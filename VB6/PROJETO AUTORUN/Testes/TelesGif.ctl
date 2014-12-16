VERSION 5.00
Begin VB.UserControl TelesGif 
   BackColor       =   &H00FFFFFF&
   BackStyle       =   0  'Transparent
   ClientHeight    =   2370
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2580
   DrawStyle       =   5  'Transparent
   ScaleHeight     =   2370
   ScaleWidth      =   2580
   Begin VB.Timer Timer1 
      Left            =   1800
      Top             =   1920
   End
   Begin VB.Image Image1 
      Height          =   1815
      Index           =   0
      Left            =   240
      Top             =   120
      Width           =   2175
   End
End
Attribute VB_Name = "TelesGif"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Dim File_ As String
Dim Stretch_ As Boolean
Private FrameCount As Long
Private TotalFrames As Long
Private RepeatTimes As Long

Private Sub Timer1_Timer()
On Error Resume Next
Dim i As Long
If FrameCount < TotalFrames Then
    Image1(FrameCount).Visible = False
    FrameCount = FrameCount + 1
Else
    FrameCount = 0
    For i = 1 To Image1.Count - 1
        Image1(i).Visible = False
    Next i
End If

Image1(FrameCount).Visible = True
Timer1.Interval = CLng(Image1(FrameCount).Tag)
If Err Then Exit Sub

End Sub

Public Sub OpenGif()
    Dim nFrames As Long
    nFrames = LoadGif(File_, Image1)
If nFrames > 0 Then
    FrameCount = 0
    Timer1.Interval = CLng(Image1(0).Tag)
    Timer1.Enabled = True
End If

End Sub

Public Sub Pause()
    Timer1.Enabled = False
End Sub
Public Sub Play()
    Timer1.Enabled = True
End Sub




Private Sub UserControl_Initialize()
    UserControl.BackStyle = 0
End Sub

Private Sub UserControl_Resize()
Image1(0).Move 0, 0, ScaleWidth, ScaleHeight
End Sub
Private Function LoadGif(sFile As String, aImg As Variant) As Long
On Error Resume Next

Dim hFile As Long
Dim sImgHeader As String
Dim sFileHeader As String
Dim sBuff As String
Dim sPicsBuff As String
Dim nImgCount As Long
Dim i As Long
Dim j As Long
Dim xOff As Long
Dim yOff As Long
Dim TimeWait As Long
Dim sGifMagic As String

If Dir$(sFile) = "" Or sFile = "" Then
    MsgBox "Arquivo " & sFile & " nao encontrado", vbInformation
    Exit Function
End If

sGifMagic = Chr$(0) & Chr$(33) & Chr$(249)

If aImg.Count > 1 Then
    For i = 1 To aImg.Count - 1
        Unload aImg(i)
    Next i
End If

hFile = FreeFile

Open sFile For Binary Access Read As hFile
sBuff = String(LOF(hFile), Chr(0))
Get #hFile, , sBuff
Close #hFile


i = 1
nImgCount = 0
j = InStr(1, sBuff, sGifMagic) + 1
sFileHeader = Left(sBuff, j)

If Left$(sFileHeader, 3) <> "GIF" Then
    MsgBox "Nao e um arquivo *.gif", vbInformation
    Exit Function
End If

LoadGif = True

i = j + 2

If Len(sFileHeader) >= 127 Then
    RepeatTimes& = Asc(Mid(sFileHeader, 126, 1)) + _
    (Asc(Mid(sFileHeader, 127, 1)) * 256&)
Else
    RepeatTimes = 0
End If

hFile = FreeFile
Open "temp.gif" For Binary As hFile

Do

    nImgCount = nImgCount + 1
    
    j = InStr(i, sBuff, sGifMagic) + 3
    
    If j > Len(sGifMagic) Then
        
        sPicsBuff = String(Len(sFileHeader) + j - i, Chr$(0))
        sPicsBuff = sFileHeader & Mid(sBuff, i - 1, j - i)
        Put #hFile, 1, sPicsBuff
        
        sImgHeader = Left(Mid(sBuff, i - 1, j - i), 16)
        
        TimeWait = ((Asc(Mid(sImgHeader, 4, 1))) + _
        (Asc(Mid(sImgHeader, 5, 1)) * 256&)) * 10&
            
        If nImgCount > 1 Then
            
            Load aImg(nImgCount - 1)
            
            xOff = Asc(Mid(sImgHeader, 9, 1)) + _
            (Asc(Mid(sImgHeader, 10, 1)) * 256&)
            
            yOff = Asc(Mid(sImgHeader, 11, 1)) + _
            (Asc(Mid(sImgHeader, 12, 1)) * 256&)
            
            aImg(nImgCount - 1).Left = aImg(0).Left + _
            (xOff * Screen.TwipsPerPixelX)
            aImg(nImgCount - 1).Top = aImg(0).Top + _
            (yOff * Screen.TwipsPerPixelY)
            
        End If
    
        aImg(nImgCount - 1).Tag = TimeWait
        aImg(nImgCount - 1).Picture = LoadPicture("temp.gif")
        
        i = j
    End If

Loop Until j = 3

Close #hFile
Kill "temp.gif"

TotalFrames = aImg.Count - 1

LoadGif = TotalFrames
Exit Function

ErrHandler:
MsgBox "Error No. " & Err.Number & " lendo arquivo", vbCritical
LoadGif = False
On Error GoTo 0
If Err Then Beep

End Function


Public Property Get Stretch() As Boolean
    Stretch = Image1(0).Stretch
End Property

Public Property Let Stretch(ByVal NewV As Boolean)
    Image1(0).Stretch = NewV
    PropertyChanged "Stretch"
End Property


Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Image1(0).Stretch = PropBag.ReadProperty("Stretch", False)
    UserControl.BackColor = PropBag.ReadProperty("BackColor", &HFFFFFF)
    UserControl.BackColor = PropBag.ReadProperty("BackColor2", &HFFFFFF)
   ' UserControl.BackStyle = PropBag.ReadProperty("Transparencia", 0)
    File_ = PropBag.ReadProperty("File", "")
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("Stretch", Image1(0).Stretch)
    Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &HFFFFFF)
    Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &HFFFFFF)
   ' Call PropBag.WriteProperty("Transparencia", UserControl.BackStyle, 0)
    Call PropBag.WriteProperty("File", File_, "")
End Sub


Public Property Get BackColor() As OLE_COLOR
    BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal vNewValue As OLE_COLOR)
    UserControl.BackColor = vNewValue
     PropertyChanged "BackColor"
End Property

Public Property Get BackColor2() As Long
    BackColor2 = CLng(UserControl.BackColor)
End Property

Public Property Let BackColor2(ByVal vNewValue As Long)
    UserControl.BackColor = vNewValue
     PropertyChanged "BackColor2"
End Property


'Public Property Get Transparencia() As Boolean
   ' Transparencia = IIf(UserControl.BackStyle = 0, True, False)
'End Property

'Public Property Let Transparencia(ByVal vNewValue As Boolean)
   ' UserControl.BackStyle = IIf(vNewValue = True, 0, 1)
'End Property
Public Property Get File() As String
    File = File_
End Property

Public Property Let File(ByVal vNewValue As String)
    File_ = vNewValue
End Property

