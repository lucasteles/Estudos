Attribute VB_Name = "gif"
Option Explicit
Private Declare Function ShellAbout Lib "shell32.dll" Alias "ShellAboutA" (ByVal hwnd As Long, ByVal szApp As String, ByVal szOtherStuff As String, ByVal hIcon As Long) As Long

Private Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type
Dim Temp As Variant
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private FrameCount As Long

Private Const LB_DIR As Long = &H18D
Private Const DDL_ARCHIVE As Long = &H20
Private Const DDL_EXCLUSIVE As Long = &H8000
Private Const DDL_FLAGS As Long = DDL_ARCHIVE Or DDL_EXCLUSIVE

Private TotalFrames As Long
Private RepeatTimes As Long

Function LoadGif(sFile As String, aImg As Variant) As Long
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
    MsgBox "Fila " & sFile & " no encontrada", vbInformation
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
MsgBox "Error No. " & Err.Number & " leyendo la fila", vbCritical
LoadGif = False
On Error GoTo 0
If Err Then Beep
End Function

