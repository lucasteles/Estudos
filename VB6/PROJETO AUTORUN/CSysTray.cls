VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CSysTray"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'*:********************************************************************************
'*: Class. . . . . . . . . . : clsSysTray.cls
'*: Description. . . . . . . : When the application is minimized, it minimizes to
'*:                            be an icon in the system tray.
'*: Author . . . . . . . . . : Martin Richardson
'*: Acknowledgements . . . . : Mark Hunter (system tray routines)
'*: Copyright. . . . . . . . : This class is freeware
'*:
'*: Update...................: This class was changed by me, Todd Herman to make it
'*:                            more streamlined and allow it handle animated cursors.
'*:********************************************************************************
'*: Code to set up in the main form:

'*: Properties
'*:
'*: Icon
'*:     Icon displayed in the taskbar.  Use this property to set the icon, or return
'*:     it.
'*: ToolTip
'*:     Tooltip text displayed when the mouse is over the icon in the system tray.  Use
'*:     this property to assign text to the tooltip, or to return the value of it.
'*: SourceWindow As Form
'*:     Reference to the form which will minimize to the system tray.
'*: DefaultDblClk As Boolean
'*:     Set to True to fire the DEFAULT (defined below) for the mouse double click event
'*:     which will show the application and remove the icon from the tray. (default)
'*:     Set to FALSE to override the below default event.
'*:
'*: Methods:
'*:
'*: MinToSysTray
'*:     Minimize the application, have it appear as an icon in the system tray.
'*:     The applicion disappears from the task bar and only appears in the
'*:     system tray.
'*: IconInSysTray
'*:     Create an icon for the application in the system tray, but leave the icon
'*:     visible and on the task bar.
'*: RemoveFromSysTray
'*:     Remove the icon from the system tray.
'*:
'*: These methods are available, but the same actions can be accomplished by
'*: setting the ICON and TOOLTIP properties.
'*:
'*: ChangeToolTip( sNewToolTip As String )
'*:     Set/change the tooltip displayed when the mouse is over the tray icon.
'*:     ex: gSysTray.ChangeToolTip "Processing..."
'*: ChangeIcon( sIconPath as string )
'*:     Set/change the icon which appears in the system tray.  The default icon
'*:     is the icon of the form.
'*:     ex: gSysTray.ChangeIcon app.path & "\MyIcon.ico"
'*:
'*: Events:
'*:
'*: LButtonDblClk
'*:     Fires when double clicking the left mouse button over the tray icon.  This event
'*:     has default code which will show the form and remove the icon from the
'*:     system tray when it fires.  Set the property DefaultDblClk to False to
'*:     bypass this code.
'*: LButtonDown
'*:     Fires when the left mouse button goes down over the tray icon.
'*: LButtonUp
'*:     Fires when the left mouse button comes up over the tray icon.
'*: RButtonDblClk
'*:     Fires when double clicking the right mouse button over the tray icon.
'*: RButtonDown
'*:     Fires when the right mouse button goes down over the tray icon.
'*: RButtonUp
'*:     Fires when the right mouse button comes up over the tray icon.
'*:     Best place for calling a popup menu.
'*:
'*: Example of utilizing a popup menu with the RButtonUp event:
'*: 1.  Create a menu on the form being minimized, or on it's own seperate form.
'*:     Let's say the form with the menu is called frmMenuForm.
'*: 2.  Set the name of the root menu item to be mnuRightClickMenu
'*: 3.  Assuming the name of the Private SysTray object is still gSysTray, use this code
'*:     in the main form:
'*:
'Private Sub gSysTray_RButtonUP()
'    PopUpMenu frmMenuForm.mnuRightClickMenu
'End Sub
'*:
'*:********************************************************************************

'*:********************************************************************************
'*: User Defined Types
'*:********************************************************************************
Private Type NOTIFYICONDATA
    cbSize As Long
    hwnd As Long
    uId As Long
    uFlags As Long
    ucallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type

'*:********************************************************************************
'*: Constants
'*:********************************************************************************
Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const WM_MOUSEMOVE = &H200
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4

Private Const WM_LBUTTONDBLCLK = &H203
Private Const WM_LBUTTONDOWN = &H201
Private Const WM_LBUTTONUP = &H202
Private Const WM_RBUTTONDBLCLK = &H206
Private Const WM_RBUTTONDOWN = &H204
Private Const WM_RBUTTONUP = &H205

'*:********************************************************************************
'*: API Declarations
'*:********************************************************************************
Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Private Declare Function DrawIconEx Lib "user32" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Private Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long

Private Const LR_LOADFROMFILE = &H10
Private Const IMAGE_BITMAP = 0
Private Const IMAGE_ICON = 1
Private Const IMAGE_CURSOR = 2
Private Const IMAGE_ENHMETAFILE = 3
Private Const DI_MASK = &H1
Private Const DI_IMAGE = &H2
Private Const DI_DEFAULTSIZE = &H8
Private Const DI_NORMAL = DI_MASK Or DI_IMAGE Or DI_DEFAULTSIZE

'*:********************************************************************************
'*: Local variables
'*:********************************************************************************
Private IconData As NOTIFYICONDATA
Private WithEvents pbPictureHook As PictureBox
Attribute pbPictureHook.VB_VarHelpID = -1
Private sToolTip As String

'*:********************************************************************************
'*: Events
'*:********************************************************************************
Public Event LButtonDblClk()
Public Event LButtonDown()
Public Event LButtonUp()
Public Event RButtonDblClk()
Public Event RButtonDown()
Public Event RButtonUp()

'*:********************************************************************************
'*: local variable(s) to hold property value(s)
'*:********************************************************************************
Private frmSourceWindow As Form 'local copy
Private bDefaultDblClk As Boolean 'local copy
Private iCurrentFrame As Integer
Public Property Let ToolTip(ByVal sData As String)

    'Set the tooltip value for the system tray icon
    ChangeToolTip sData
    
End Property
Public Property Get ToolTip() As String

    'Get the tooltip value for the system tray icon
    ToolTip = sToolTip
    
End Property
'Public Property Let Icon(ByVal vData As Variant)
    'Change the current icon in the system tray.  This is the same
    'as directly calling ChangeIcon
'    ChangeIcon sData
'End Property
'Public Property Get Icon() As Variant
'    Icon = IconData.hIcon      'pichook.Picture
'End Property
Public Property Let DefaultDblClk(ByVal bData As Boolean)

    'If this is set to true, the application will be restored to it's normal
    'size when the user double clicks on the system tray icon.  This value
    'defaults to true.
    bDefaultDblClk = bData
    
End Property
Public Property Get DefaultDblClk() As Boolean

    DefaultDblClk = bDefaultDblClk
    
End Property
Public Property Set SourceWindow(ByVal frmData As Form)

    'To do some of the work, we need to use the calling form.  This property sets
    'a link to that form
    Set frmSourceWindow = frmData
    SetPicHook
    
End Property
Public Property Get SourceWindow() As Form

    'Get the current form being used as the source
    Set SourceWindow = frmSourceWindow
    
End Property
Private Sub Class_Initialize()
    
    'This is run when the class is first instantiated.  It sets the defaults.
    bDefaultDblClk = True
    
    IconData.cbSize = Len(IconData)
    IconData.uId = 1&
    IconData.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
    IconData.ucallbackMessage = WM_MOUSEMOVE
    IconData.hIcon = 0
    IconData.szTip = Chr$(0)       'Default to no tooltip
    
End Sub
Private Sub pbPictureHook_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    'This is where the true use of the pbPictureHook control comes in.  We use its
    'mouse move events to determine when the mouse button has been pressed over the
    'system tray icon.
    Static rec As Boolean
    Dim msg As Long
    Dim oldmsg As Long
    
    oldmsg = msg
    msg = X / Screen.TwipsPerPixelX
   
    If rec = False Then
        rec = True
        Select Case msg
            Case WM_LBUTTONDBLCLK:
                LButtonDblClk
            Case WM_LBUTTONDOWN:
                RaiseEvent LButtonDown
            Case WM_LBUTTONUP:
                RaiseEvent LButtonUp
            Case WM_RBUTTONDBLCLK:
                RaiseEvent RButtonDblClk
            Case WM_RBUTTONDOWN:
                RaiseEvent RButtonDown
            Case WM_RBUTTONUP:
                RaiseEvent RButtonUp
        End Select
        rec = False
    End If
    
End Sub
Private Sub LButtonDblClk()

    If bDefaultDblClk Then
        frmSourceWindow.WindowState = vbNormal
        frmSourceWindow.Show
        App.TaskVisible = True
        RemoveFromSysTray
    End If
    
    RaiseEvent LButtonDblClk
    
End Sub
Public Sub RemoveFromSysTray()
    
    'Remove the icon from the system tray.
    IconData.cbSize = Len(IconData)
    IconData.hwnd = pbPictureHook.hwnd
    IconData.uId = 1&
    
    Shell_NotifyIcon NIM_DELETE, IconData

End Sub
Public Sub IconInSysTray()
    
    'This simply adds the icon to the system tray without altering anything else.
    Shell_NotifyIcon NIM_ADD, IconData

End Sub
Public Sub MinToSysTray()
    
    'This method adds the icon to the system tray, but it also hides the calling form
    'and makes it invisible in the task bar.
    Me.IconInSysTray
    
    frmSourceWindow.Hide
    App.TaskVisible = False

End Sub
Private Sub SetPicHook()

    'This method creates a picture box at design time to be used as a hook.  We need
    'it to temporarily store the icon image and to record events.
    On Error GoTo AlreadyAdded
    
    Set pbPictureHook = frmSourceWindow.Controls.Add("VB.PictureBox", "pbPictureHook")

    pbPictureHook.Visible = False
    pbPictureHook.Picture = frmSourceWindow.Icon
    pbPictureHook.AutoRedraw = True
    pbPictureHook.AutoSize = True
    
    IconData.hwnd = pbPictureHook.hwnd
    
    Exit Sub

AlreadyAdded:
    If Err.Number <> 727 Then  ' pichook has already been added
       MsgBox "Run-time error '" & Err.Number & "':" & vbCrLf & vbCrLf & Err.Description, vbCritical + vbOKOnly, "Error"
       Stop
       Resume
    End If

End Sub
Public Sub ChangeIcon(sIconPath As String)

    'This is where the beauty happens.  This is where we change the icon.  Anytime
    'ChangeIcon is called we are setting a new icon to be used on the system tray.
    'If an "ani" file (animated cursor) is being sent we need to do things a little
    'differently.  I search EVERYWHERE for a way to do this and found nothing.  It took
    'me several days to come up with this method.  I am currently working on an even
    'better, more stream lined way, which will remove the need for the ImageList
    'control.
    'If we are dealing with an ANI file, keep in mind that a new frame will be displayed
    'every subsequent call to ChangeIcon.  Therefore, to do the animation, you just need
    'to create your own timer that calls the ChangeIcon method with the ANI file path.

    Dim lResult As Long
    Dim liNewImage As ListImage
    
    'Kill the reference to the current icon.  Since we are about to create a link
    'to a new icon, we don't want a bunch of icons floating around in memory.
    DestroyIcon (IconData.hIcon)

    'Determine if we are dealing with an animated cursor or not
    If Right(sIconPath, 3) = "ani" Then
        'First we load the animated cursor into an icon handle
        IconData.hIcon = LoadImage(App.hInstance, sIconPath, IMAGE_CURSOR, 0, 0, LR_LOADFROMFILE)
        'Now we draw the current frame (which starts at 0) to the device context of
        'our picture box
        lResult = DrawIconEx(pbPictureHook.hdc, 0, 0, IconData.hIcon, 0, 0, iCurrentFrame, 0, DI_NORMAL)
        'lResult will = 1 if there is no problem, 0 if there is.  Err.LastDLLError will
        'be set with the value of any errors that occurr.  A 0 will be returned if that
        'frame does not exist in out ANI file.
        If lResult = 0 Then
            'Reset the frame counter to 0 and try again, if it fails again, we have
            'a real error that we need to trap and display.
            iCurrentFrame = 0
            lResult = DrawIconEx(pbPictureHook.hdc, 0, 0, IconData.hIcon, 0, 0, iCurrentFrame, 0, DI_NORMAL)
            If lResult = 0 Then
                MsgBox "[" & Err.LastDllError & "]  " & Err.Description, vbCritical And vbOKOnly, "Error Loading file"
                DestroyIcon (IconData.hIcon)
                End
            Else
                iCurrentFrame = iCurrentFrame + 1
            End If
        Else
            iCurrentFrame = iCurrentFrame + 1
        End If
        
        'This is where it gets a bit conviluted.  To get the icon image out of the
        'picture box's DC you use the image property.  However, this converts the icon
        'to a bitmap.  You can verify this by checking the picture object's "type"
        'property.  The only way I found to fix this problem, is by storing the
        'bitmap into an image list and using the ImageList's ExtractIcon method to
        'return and icon.  I will be changing this code soon to use the ImageList API
        'rather then relying on the actually control.
        pbPictureHook.Picture = pbPictureHook.Image
        Set liNewImage = frmMain.ImageList1.ListImages.Add(1, "NEWICON", pbPictureHook.Picture)
        pbPictureHook.Picture = frmMain.ImageList1.ListImages("NEWICON").ExtractIcon
        frmMain.ImageList1.ListImages.Clear
        IconData.hIcon = pbPictureHook.Picture
    Else
        'Load the icon into an icon handle and store it in our structure
        IconData.hIcon = LoadImage(App.hInstance, sIconPath, IMAGE_ICON, 0, 0, LR_LOADFROMFILE)
    End If
    
    Shell_NotifyIcon NIM_MODIFY, IconData
    
End Sub
Public Sub ChangeToolTip(ByVal sNewTip As String)

    sToolTip = sNewTip
    IconData.szTip = sNewTip & Chr$(0)
    
    Shell_NotifyIcon NIM_MODIFY, IconData
    
    'If frmSourceWindow.WindowState = vbMinimized Then
    '    frmSourceWindow.Caption = sNewTip
    'End If
    
End Sub
