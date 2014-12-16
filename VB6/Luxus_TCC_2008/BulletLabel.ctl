VERSION 5.00
Begin VB.UserControl BulletLabel 
   AutoRedraw      =   -1  'True
   BackStyle       =   0  'Transparent
   CanGetFocus     =   0   'False
   ClientHeight    =   225
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1320
   ScaleHeight     =   15
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   88
   ToolboxBitmap   =   "BulletLabel.ctx":0000
End
Attribute VB_Name = "BulletLabel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'**************************************************************************************************
' CustomLabel.ctl
' Simply a custom drawn label to demonstrate how to draw text on a transparent
' UserControl.
'**************************************************************************************************
' simply maintaining the proper case of my enum items...
' thanks to Evan Toder for the tip.
#If False Then
     Dim None
     Dim FixedSingle
     Dim UseAmbientForeground
     Dim CustomColor
     Dim Top
     Dim Centered
     Dim DiscOutline
     Dim DiscFilled
     Dim SquareOutline
     Dim SquareFilled
     Dim LeftArrow
     Dim RightArrow
     Dim UpArrow
     Dim DownArrow
     Dim Diamond
     Dim LeftJustify
     Dim Center
     Dim RightJustify
#End If

'**************************************************************************************************
' Constants
'**************************************************************************************************
Private Const BULLET_GAP = 20
Private Const DT_LEFT = &H0
Private Const DT_CENTER = &H1
Private Const DT_RIGHT = &H2
Private Const DT_WORDBREAK = &H10
Private Const DT_SINGLELINE = &H20
Private Const DT_CALCRECT = &H400
Private Const PS_SOLID = 0
Private Const BS_SOLID = 0
Private Const HS_SOLID = 8

'**************************************************************************************************
' Enum/Struct Declarations
'**************************************************************************************************
Public Enum CTL_BORDERSTYLE
     [None]
     [FixedSingle]
End Enum ' CTL_BORDERSTYLE

Public Enum CTL_BULLETSTYLE
     [NoBullet]
     [DiscOutline]
     [DiscFilled]
     [SquareOutline]
     [SquareFilled]
     [LeftArrow]
     [RightArrow]
     [UpArrow]
     [DownArrow]
     [DiamondOutline]
     [DiamondFilled]
     [StarOutline]
     [StarFilled]
End Enum ' CTL_BULLETSYLE

Public Enum LABEL_ALIGN
     [LeftJustify]
     [Center]
     [RightJustify]
End Enum ' LABEL_ALIGN

Private Type LOGBRUSH
    lbStyle As Long
    lbColor As Long
    lbHatch As Long
End Type ' LOGBRUSH

Private Type POINTAPI
    x As Long
    y As Long
End Type ' POINTAPI

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type ' RECT

'**************************************************************************************************
' Win32 API Declarations
'**************************************************************************************************
Private Declare Function CreateBrushIndirect Lib "gdi32" (lpLogBrush As LOGBRUSH) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, _
     ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hdc As Long, _
     ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, _
     ByVal lpDrawTextParams As Any) As Long
Private Declare Function Ellipse Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, _
     ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function Polygon Lib "gdi32" (ByVal hdc As Long, lpPoint As POINTAPI, _
     ByVal nCount As Long) As Long
Private Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, _
     ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, _
     ByVal hObject As Long) As Long
  
'**************************************************************************************************
' Private Variable Declarations
'**************************************************************************************************
Private m_Flag As Long
Private m_ControlRect As RECT
Private m_CaptionRect As RECT
Private m_pt() As POINTAPI
Private m_hBrush As Long
Private m_hPen As Long
Private m_LogBrush As LOGBRUSH
Private m_oldBrush As Long
Private m_oldPen As Long

'**************************************************************************************************
' Property Value Constant Declarations
'**************************************************************************************************
Const m_def_Alignment = False
Const m_def_BorderStyle = False
Const m_def_BulletStyle = False
Const m_def_WordWrap = False

'**************************************************************************************************
' Property Variable Declarations
'**************************************************************************************************
Dim m_Alignment As LABEL_ALIGN
Dim m_BulletColor As OLE_COLOR
Dim m_BulletOutlineWidth As Long
Dim m_BulletStyle As CTL_BULLETSTYLE
Dim m_Caption As String
Dim m_WordWrap As Boolean

'**************************************************************************************************
' Control Event Declarations
'**************************************************************************************************
Public Event Change()
Attribute Change.VB_Description = "Fired when the caption of the label control changes."
Public Event Click()
Attribute Click.VB_Description = "Fires when the label control is clicked."
Attribute Click.VB_UserMemId = -600
Public Event DblClick()
Attribute DblClick.VB_Description = "Fires when the label control is double-clicked."
Attribute DblClick.VB_UserMemId = -601
Public Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Attribute MouseDown.VB_Description = "Fires when the user presses a mouse button over the label control."
Attribute MouseDown.VB_UserMemId = -605
Public Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Attribute MouseMove.VB_Description = "Fires when the user moves the mouse pointer over the label control."
Attribute MouseMove.VB_UserMemId = -606
Public Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Attribute MouseUp.VB_Description = "Fires when the user releases a mouse button over the label control."
Attribute MouseUp.VB_UserMemId = -607

'**************************************************************************************************
' Property Let/Get/Set Declarations
'**************************************************************************************************
Public Property Get Alignment() As LABEL_ALIGN
Attribute Alignment.VB_Description = "Returns/sets the alignment of the label controls caption."
Attribute Alignment.VB_ProcData.VB_Invoke_Property = ";Appearance"
     Alignment = m_Alignment
End Property ' Get Alignment

Public Property Let Alignment(New_Alignment As LABEL_ALIGN)
     m_Alignment = New_Alignment
     PropertyChanged "Alignment"
     ' Redraw
     DrawCaption
End Property ' Let Alignment

Public Property Get BorderStyle() As CTL_BORDERSTYLE
Attribute BorderStyle.VB_Description = "Returns/sets the border style for an object."
Attribute BorderStyle.VB_ProcData.VB_Invoke_Property = ";Appearance"
Attribute BorderStyle.VB_UserMemId = -504
     BorderStyle = UserControl.BorderStyle
End Property ' Get BorderStyle

Public Property Let BorderStyle(ByVal New_BorderStyle As CTL_BORDERSTYLE)
     UserControl.BorderStyle() = New_BorderStyle
     PropertyChanged "BorderStyle"
     ' Redraw
     DrawCaption
End Property ' Let BorderStyle

Public Property Get BulletColor() As OLE_COLOR
Attribute BulletColor.VB_Description = "Returns/sets the color of the label control's selected bullet."
Attribute BulletColor.VB_ProcData.VB_Invoke_Property = ";Appearance"
     BulletColor = m_BulletColor
End Property ' Get BulletColor

Public Property Let BulletColor(New_BulletColor As OLE_COLOR)
     m_BulletColor = New_BulletColor
     PropertyChanged "BulletColor"
     DrawCaption
End Property ' Let BulletColor

Public Property Get BulletOutlineWidth() As Long
Attribute BulletOutlineWidth.VB_Description = "Returns/sets the width of a bullet's border outline."
Attribute BulletOutlineWidth.VB_ProcData.VB_Invoke_Property = ";Appearance"
     BulletOutlineWidth = m_BulletOutlineWidth
End Property ' Get BulletOutlineWidth

Public Property Let BulletOutlineWidth(New_BulletOutlineWidth As Long)
     m_BulletOutlineWidth = New_BulletOutlineWidth
     PropertyChanged "BulletOutlineWidth"
     DrawCaption
End Property ' Let BulletOutlineWidth

Public Property Get BulletStyle() As CTL_BULLETSTYLE
Attribute BulletStyle.VB_Description = "Returns/sets the label's bullet style."
Attribute BulletStyle.VB_ProcData.VB_Invoke_Property = ";Appearance"
     BulletStyle = m_BulletStyle
End Property ' Get BulletStyle

Public Property Let BulletStyle(New_BulletStyle As CTL_BULLETSTYLE)
     m_BulletStyle = New_BulletStyle
     PropertyChanged "BulletStyle"
     DrawCaption
End Property ' Let BulletStyle

Public Property Get Caption() As String
Attribute Caption.VB_Description = "Returns/sets the text displayed in the label control."
Attribute Caption.VB_UserMemId = -518
Attribute Caption.VB_MemberFlags = "200"
     Caption = m_Caption
End Property ' Get Caption

Public Property Let Caption(New_Caption As String)
     m_Caption = New_Caption
     PropertyChanged "Caption"
     RaiseEvent Change
     ' Redraw
     DrawCaption
End Property ' Let Caption

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether the label control can respond to user-generated events."
Attribute Enabled.VB_UserMemId = -514
     Enabled = UserControl.Enabled
End Property ' Get Enabled

Public Property Let Enabled(New_Enabled As Boolean)
     UserControl.Enabled() = New_Enabled
     PropertyChanged "Enabled"
End Property ' Let Enabled

Public Property Get Font() As Font
Attribute Font.VB_Description = "Returns a font object."
Attribute Font.VB_UserMemId = -512
     Set Font = UserControl.Font
End Property ' Get Font

Public Property Set Font(ByVal New_Font As Font)
     Set UserControl.Font = New_Font
     PropertyChanged "Font"
     ' Redraw
     DrawCaption
End Property ' Let Font

Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_Description = "Returns/sets the foreground color used to display text and graphics in an object."
Attribute ForeColor.VB_UserMemId = -513
     ForeColor = UserControl.ForeColor
End Property ' Get ForeColor

Public Property Let ForeColor(New_ForeColor As OLE_COLOR)
     UserControl.ForeColor() = New_ForeColor
     PropertyChanged "ForeColor"
     ' Redraw
     DrawCaption
End Property ' Let ForeColor

Public Property Get WordWrap() As Boolean
Attribute WordWrap.VB_Description = "Returns/sets a value that determines whether the label control expands to fit the text in its captions."
     WordWrap = m_WordWrap
End Property ' Get WordWrap

Public Property Let WordWrap(New_WordWrap As Boolean)
     m_WordWrap = New_WordWrap
     Select Case m_WordWrap
          Case 0
               m_Flag = DT_SINGLELINE
          Case Else
               m_Flag = DT_WORDBREAK
     End Select
     PropertyChanged "WordWrap"
     ' Redraw
     DrawCaption
End Property ' Let WordWrap

'**************************************************************************************************
' UserControl Intrinsic Methods
'**************************************************************************************************
Private Sub UserControl_Click()
     RaiseEvent Click
End Sub ' UserControl_Click

Private Sub UserControl_DblClick()
     RaiseEvent DblClick
End Sub ' UserControl_DblClick

Private Sub UserControl_InitProperties()
     Caption = Extender.Name
     Set UserControl.Font = Ambient.Font
     WordWrap = m_def_WordWrap
End Sub ' UserControl_InitProperties

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
     RaiseEvent MouseDown(Button, Shift, x, y)
End Sub ' UserControl_MouseDown

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
     RaiseEvent MouseMove(Button, Shift, x, y)
End Sub ' UserControl_MouseMove

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
     RaiseEvent MouseUp(Button, Shift, x, y)
End Sub ' UserControl_MouseUp

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
     On Error Resume Next
     With PropBag
          Alignment = .ReadProperty("Alignment", m_def_Alignment)
          UserControl.BorderStyle = .ReadProperty("BorderStyle", m_def_BorderStyle)
          BulletColor = .ReadProperty("BulletColor", Ambient.ForeColor)
          BulletOutlineWidth = .ReadProperty("BulletOutlineWidth", 1)
          BulletStyle = .ReadProperty("BulletStyle", 0)
          Caption = .ReadProperty("Caption", Extender.Name)
          UserControl.Enabled = .ReadProperty("Enabled", True)
          Set UserControl.Font = PropBag.ReadProperty("Font", Ambient.Font)
          UserControl.ForeColor = .ReadProperty("ForeColor", Ambient.ForeColor)
          WordWrap = .ReadProperty("WordWrap", m_def_WordWrap)
     End With
End Sub ' UserControl_ReadProperties

Private Sub UserControl_Resize()
     DrawCaption
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
     With PropBag
          Call .WriteProperty("Alignment", m_Alignment, m_def_Alignment)
          Call .WriteProperty("BorderStyle", UserControl.BorderStyle, m_def_BorderStyle)
          Call .WriteProperty("BulletColor", m_BulletColor, Ambient.ForeColor)
          Call .WriteProperty("BulletOutlineWidth", m_BulletOutlineWidth, 1)
          Call .WriteProperty("BulletStyle", m_BulletStyle, 0)
          Call .WriteProperty("Caption", m_Caption, Extender.Name)
          Call .WriteProperty("Enabled", UserControl.Enabled, True)
          Call .WriteProperty("Font", UserControl.Font, Ambient.Font)
          Call .WriteProperty("ForeColor", UserControl.ForeColor, Ambient.ForeColor)
          Call .WriteProperty("WordWrap", m_WordWrap, m_def_WordWrap)
     End With
End Sub ' UserControl_WriteProperties

'**************************************************************************************************
' CustomLabel Private Methods
'**************************************************************************************************
Private Sub DrawCaption()
     Dim lRtn As Long
     Dim lHt As Long
     Dim lWt As Long
     Dim rc As RECT
     Cls
     ' are we displaying bullets?
     If m_BulletStyle > NoBullet Then
          ' move the caption to left by width BULLET_GAP
          m_CaptionRect.Left = BULLET_GAP
     Else
          ' left edge will be usercontrol edge....0
          m_CaptionRect.Left = 4
     End If
     ' terminate rectangle on the right by using scalewidth
     m_CaptionRect.Right = UserControl.ScaleWidth
     ' terminate rectangle on the bottom by using scaleheight
     m_CaptionRect.Bottom = UserControl.ScaleHeight
     ' call api
     lRtn = DrawTextEx(UserControl.hdc, m_Caption, Len(m_Caption), m_CaptionRect, _
          m_Flag Or m_Alignment, ByVal 0&)
     If m_BulletStyle > 0 Then DrawBullet rc
     ' Send text to usercontrol canvas
     UserControl.MaskPicture = UserControl.Image
End Sub ' DrawText

Friend Function DrawBullet(rc As RECT)
     Dim lRtn As Long
     Dim lColor As Long
     Dim olColor As Long
     Dim lpt(20) As POINTAPI
     ' Convert outline color
     olColor = TranslateOleColor(m_BulletColor)
     ' Create pen object
     m_hPen = CreatePen(PS_SOLID, m_BulletOutlineWidth, olColor)
     'Copy pen onto the dc and store old pen
     m_oldPen = SelectObject(UserControl.hdc, m_hPen)
     ' translate color before initializing LOGBRUSH struct
     lColor = TranslateOleColor(m_BulletColor)
     ' Initialize logbrush struct
     With m_LogBrush
          .lbColor = lColor
          .lbStyle = BS_SOLID
          .lbHatch = HS_SOLID
     End With
     ' If style is a 1 or 3 we don't want a fill color so don't create brush
     ' for these style types
     If Not m_BulletStyle = 1 And Not m_BulletStyle = 3 And Not m_BulletStyle = 9 And _
          Not m_BulletStyle = 11 Then
          ' Create a brush
          m_hBrush = CreateBrushIndirect(m_LogBrush)
          ' Copy brush onto the dc and store old brush
          m_oldBrush = SelectObject(UserControl.hdc, m_hBrush)
     End If
     ' Process Bullet Style
     Select Case m_BulletStyle
          Case 1, 2 ' Disc Outlined & Filled
               rc.Left = 2
               rc.Top = 4
               rc.Right = 10
               rc.Bottom = 12
               lRtn = Ellipse(UserControl.hdc, rc.Left, rc.Top, rc.Right, rc.Bottom)
          Case 3, 4 ' Square Outlined & Filled
               rc.Left = 2
               rc.Top = 5
               rc.Right = 10
               rc.Bottom = 13
               lRtn = Rectangle(UserControl.hdc, rc.Left, rc.Top, rc.Right, rc.Bottom)
          Case 5 ' Left Arrow
               lpt(0).x = 7: lpt(0).y = 3
               lpt(1).x = 2: lpt(1).y = 8
               lpt(2).x = 7: lpt(2).y = 13
               lRtn = Polygon(UserControl.hdc, lpt(0), 3)
          Case 6 ' Right Arrow
               lpt(0).x = 2: lpt(0).y = 3
               lpt(1).x = 2: lpt(1).y = 13
               lpt(2).x = 7: lpt(2).y = 8
               lRtn = Polygon(UserControl.hdc, lpt(0), 3)
          Case 7 ' Up Arrow
               lpt(0).x = 5: lpt(0).y = 6
               lpt(1).x = 0: lpt(1).y = 11
               lpt(2).x = 10: lpt(2).y = 11
               lRtn = Polygon(UserControl.hdc, lpt(0), 3)
          Case 8 ' Down Arrow
               lpt(0).x = 0: lpt(0).y = 6
               lpt(1).x = 5: lpt(1).y = 11
               lpt(2).x = 10: lpt(2).y = 6
               lRtn = Polygon(UserControl.hdc, lpt(0), 3)
          Case 9, 10 ' Diamond Outlined & Filled
               lpt(0).x = 5: lpt(0).y = 3
               lpt(1).x = 1: lpt(1).y = 7
               lpt(2).x = 1: lpt(2).y = 8
               lpt(3).x = 5: lpt(3).y = 12
               lpt(4).x = 6: lpt(4).y = 12
               lpt(5).x = 10: lpt(5).y = 8
               lpt(6).x = 10: lpt(6).y = 7
               lpt(7).x = 6: lpt(7).y = 3
               lRtn = Polygon(UserControl.hdc, lpt(0), 8)
          Case 11, 12 ' Star Outlined & Filled
               lpt(0).x = 7: lpt(0).y = 0
               lpt(1).x = 5: lpt(1).y = 5
               lpt(2).x = 0: lpt(2).y = 5
               lpt(3).x = 4: lpt(3).y = 8
               lpt(4).x = 3: lpt(4).y = 13
               lpt(5).x = 7: lpt(5).y = 10
               lpt(6).x = 11: lpt(6).y = 13
               lpt(7).x = 10: lpt(7).y = 8
               lpt(8).x = 14: lpt(8).y = 5
               lpt(9).x = 9: lpt(9).y = 5
               lRtn = Polygon(UserControl.hdc, lpt(0), 10)
     End Select
     ' Delete brush and restore old
     If m_oldBrush Then
          lRtn = SelectObject(UserControl.hdc, m_oldBrush)
          DeleteObject (lRtn)
     End If
     ' Delete pen and restore old
     If m_oldPen Then
          lRtn = SelectObject(UserControl.hdc, m_oldPen)
          DeleteObject (lRtn)
     End If
End Function ' DrawBullet

Private Function TranslateOleColor(ByVal lColor As OLE_COLOR) As Long
     Const cHighBitMask = &H80000000
     Dim lRslt As Long
     If lColor And cHighBitMask Then
          lRslt = lColor And Not cHighBitMask
          lRslt = GetSysColor(lRslt)
     Else
          ' otherwise, use original color
          lRslt = lColor
     End If
     ' Return function
     TranslateOleColor = lRslt
End Function ' TranslateOleColor
