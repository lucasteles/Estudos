Attribute VB_Name = "Module1"

'TRANSPARENCIA
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Public Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal color As Long, ByVal X As Byte, ByVal Alpha As Long) As Boolean
Public Const LWA_COLORKEY = 1
Public Const LWA_ALPHA = 2
Public Const LWA_BOTH = 3
Public Const WS_EX_LAYERED = &H80000
Public Const GWL_EXSTYLE = -20

'TRANSPARENCIA
Public Sub SetTrans(oForm As Form, Optional bytAlpha As Byte = 255, Optional lColor As Long = 0)
    Dim lStyle As Long
    lStyle = GetWindowLong(oForm.hwnd, GWL_EXSTYLE)
    
    If Not (lStyle And WS_EX_LAYERED) = WS_EX_LAYERED Then
        SetWindowLong oForm.hwnd, GWL_EXSTYLE, lStyle Or WS_EX_LAYERED
    End If
    'lColor = COR QUE DEVE FICAR TOTALMENTE TRANSPARENCIA NO PORM
    If lColor = Empty Then
        SetLayeredWindowAttributes oForm.hwnd, 1, bytAlpha, LWA_COLORKEY Or LWA_ALPHA
    Else
        SetLayeredWindowAttributes oForm.hwnd, lColor, bytAlpha, LWA_COLORKEY Or LWA_ALPHA
    End If
End Sub


