VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.UserControl ACPRibbon 
   Alignable       =   -1  'True
   BackColor       =   &H00404040&
   ClientHeight    =   3000
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7095
   ControlContainer=   -1  'True
   ScaleHeight     =   3000
   ScaleWidth      =   7095
   Begin ACTIVESKINLibCtl.Skin Skin3 
      Left            =   6510
      OleObjectBlob   =   "ACPRibbon.ctx":0000
      Top             =   2370
   End
   Begin ACTIVESKINLibCtl.Skin Skin2 
      Left            =   6540
      OleObjectBlob   =   "ACPRibbon.ctx":26FA5
      Top             =   1860
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   6540
      OleObjectBlob   =   "ACPRibbon.ctx":3ECCC
      Top             =   1290
   End
   Begin VB.Label ButMouse 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   990
      Index           =   0
      Left            =   2040
      TabIndex        =   4
      ToolTipText     =   "çlll"
      Top             =   1800
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Image Glip_on 
      Height          =   60
      Index           =   0
      Left            =   2280
      Top             =   1560
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.Image Glip_off 
      Height          =   60
      Index           =   0
      Left            =   2160
      Top             =   1560
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.Image Button_left_over 
      Height          =   990
      Index           =   0
      Left            =   2520
      Top             =   1800
      Visible         =   0   'False
      Width           =   45
   End
   Begin VB.Image Button_center_over 
      Height          =   990
      Index           =   0
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   1800
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Image Button_right_over 
      Height          =   990
      Index           =   0
      Left            =   3480
      Top             =   1800
      Visible         =   0   'False
      Width           =   45
   End
   Begin VB.Image Cat_Dlg_over 
      Height          =   210
      Index           =   0
      Left            =   4080
      Top             =   1320
      Visible         =   0   'False
      Width           =   225
   End
   Begin VB.Image Cat_Dlg_on 
      Height          =   210
      Index           =   0
      Left            =   3840
      Top             =   1320
      Visible         =   0   'False
      Width           =   225
   End
   Begin VB.Image Cat_Dlg 
      Height          =   210
      Index           =   0
      Left            =   3600
      Top             =   1320
      Visible         =   0   'False
      Width           =   225
   End
   Begin VB.Image Button_Icon 
      Appearance      =   0  'Flat
      Height          =   495
      Index           =   0
      Left            =   1320
      Top             =   1920
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Button_Caption 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   180
      Index           =   0
      Left            =   1440
      TabIndex        =   5
      Top             =   2520
      Visible         =   0   'False
      Width           =   510
   End
   Begin VB.Image Button_right 
      Height          =   990
      Index           =   0
      Left            =   1920
      Top             =   1800
      Visible         =   0   'False
      Width           =   45
   End
   Begin VB.Image Button_center 
      Height          =   990
      Index           =   0
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   1800
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Image Button_left 
      Height          =   990
      Index           =   0
      Left            =   960
      Top             =   1800
      Visible         =   0   'False
      Width           =   45
   End
   Begin VB.Label TabMouse 
      Height          =   360
      Index           =   0
      Left            =   2520
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label Tab_caption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Aba 01"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Index           =   0
      Left            =   840
      TabIndex        =   0
      Top             =   180
      Visible         =   0   'False
      Width           =   690
   End
   Begin VB.Image Tab_right 
      Height          =   360
      Index           =   0
      Left            =   2280
      Top             =   120
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Image Tab_center 
      Height          =   360
      Index           =   0
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   120
      Visible         =   0   'False
      Width           =   270
   End
   Begin VB.Image Tab_left 
      Height          =   360
      Index           =   0
      Left            =   1680
      Top             =   120
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Image Tab_left_over 
      Height          =   360
      Index           =   0
      Left            =   1680
      Top             =   600
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Image Tab_center_over 
      Height          =   360
      Index           =   0
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   600
      Visible         =   0   'False
      Width           =   270
   End
   Begin VB.Image Tab_right_over 
      Height          =   360
      Index           =   0
      Left            =   2280
      Top             =   600
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Label CatMouse 
      Height          =   1350
      Index           =   0
      Left            =   4560
      TabIndex        =   3
      Top             =   150
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label Cat_Caption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Index           =   0
      Left            =   5040
      TabIndex        =   2
      Tag             =   "sadf"
      Top             =   1200
      Visible         =   0   'False
      Width           =   630
   End
   Begin VB.Image Cat_Right_on 
      Height          =   1335
      Index           =   0
      Left            =   6120
      Top             =   150
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.Image Cat_Center_on 
      Height          =   1335
      Index           =   0
      Left            =   5880
      Stretch         =   -1  'True
      Top             =   150
      Visible         =   0   'False
      Width           =   60
   End
   Begin VB.Image Cat_Left_on 
      Height          =   1335
      Index           =   0
      Left            =   5760
      Top             =   150
      Visible         =   0   'False
      Width           =   60
   End
   Begin VB.Image Cat_Right_off 
      Height          =   1335
      Index           =   0
      Left            =   5400
      Top             =   150
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.Image Cat_Left_off 
      Height          =   1335
      Index           =   0
      Left            =   5040
      Top             =   150
      Visible         =   0   'False
      Width           =   60
   End
   Begin VB.Image Cat_Center_off 
      Height          =   1335
      Index           =   0
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   150
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.Image BarraLeft 
      Height          =   2130
      Left            =   0
      Top             =   0
      Width           =   165
   End
   Begin VB.Image BarraRight 
      Height          =   2130
      Left            =   480
      Top             =   0
      Width           =   165
   End
   Begin VB.Image Barra2 
      Height          =   2130
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   405
   End
End
Attribute VB_Name = "ACPRibbon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "PropPageWizardRun" ,"Yes"


Private Declare Function GetTempFileName Lib "kernel32" Alias "GetTempFileNameA" (ByVal lpszPath As String, ByVal lpPrefixString As String, ByVal wUnique As Long, ByVal lpTempFileName As String) As Long
Private Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Const MAX_PATH = 260

Private Const FORMAT_MESSAGE_ALLOCATE_BUFFER = &H100
Private Const FORMAT_MESSAGE_ARGUMENT_ARRAY = &H2000
Private Const FORMAT_MESSAGE_FROM_HMODULE = &H800
Private Const FORMAT_MESSAGE_FROM_STRING = &H400
Private Const FORMAT_MESSAGE_FROM_SYSTEM = &H1000
Private Const FORMAT_MESSAGE_IGNORE_INSERTS = &H200
Private Const FORMAT_MESSAGE_MAX_WIDTH_MASK = &HFF
Private Declare Function FormatMessage Lib "kernel32" Alias "FormatMessageA" (ByVal dwFlags As Long, lpSource As Any, ByVal dwMessageId As Long, ByVal dwLanguageId As Long, ByVal lpBuffer As String, ByVal nSize As Long, Arguments As Long) As Long

Dim TotalButton As Integer
Dim TotalTabs As Integer
Dim TotalCats As Integer
Dim TabSelected As String
Dim TabID(30) As String
Dim TabC(30) As String
Dim CatsID(30) As String
Dim CatsC(30) As String
Dim CatsT(30) As String
Dim CatsD(30) As Boolean

Dim TopBuID(90) As String
Dim TopBuS(90) As String
Dim TopBuC(90) As String
Dim TopBuI(90) As Picture
Dim TopBuT(90) As String
Dim TopBuG(90) As Boolean

Dim MS As Boolean
Dim Mx, My As Integer
Event TabClick(ByVal ID As String, ByVal Caption As String)
Event CatClick(ByVal ID As String, ByVal Caption As String)
Event ButtonClick(ByVal ID As String, ByVal Caption As String)
Const m_def_Theme = 0
Const m_def_BC = False
Dim m_Theme As Variant
Dim m_BC As Boolean
Dim zImg As Object

Dim TAB_NORMAL
Dim TAB_SELECTED
Private Sub TabNone(Optional Index As Integer = -1)
    If Index <> -1 Then
        For I = 0 To Index - 1
            If Tab_center_over(I).Visible = True Then
                Tab_center_over(I).Visible = False
                Tab_left_over(I).Visible = False
                Tab_right_over(I).Visible = False
            End If
        Next
        If Tab_center(Index).Visible = False Then
            Tab_center_over(Index).Visible = True
            Tab_left_over(Index).Visible = True
            Tab_right_over(Index).Visible = True
        End If
        For I = Index + 1 To TabMouse.UBound
            If Tab_center_over(I).Visible = True Then
                Tab_center_over(I).Visible = False
                Tab_left_over(I).Visible = False
                Tab_right_over(I).Visible = False
            End If
        Next
    Else
        For I = 0 To TabMouse.UBound
            If Tab_center_over(I).Visible = True Then
                Tab_center_over(I).Visible = False
                Tab_left_over(I).Visible = False
                Tab_right_over(I).Visible = False
            End If
        Next
    End If
End Sub
Private Sub CatNone(Optional Index As Integer = -1)
    If Index <> -1 Then
        For I = 0 To Index - 1
            If Cat_Center_on(I).Visible = True Then
                Cat_Center_on(I).Visible = False
                Cat_Left_on(I).Visible = False
                Cat_Right_on(I).Visible = False
                If Cat_Dlg(I).Visible = True Then
                    Cat_Dlg_on(I).Visible = False
                    Cat_Dlg_over(I).Visible = False
                End If
            End If
        Next
        Cat_Center_on(Index).Visible = True
        Cat_Left_on(Index).Visible = True
        Cat_Right_on(Index).Visible = True
        If Cat_Dlg(Index).Visible = True Then
            Cat_Dlg_on(Index).Visible = True
            Cat_Dlg_over(Index).Visible = False
        End If
        For I = Index + 1 To CatMouse.UBound
            If Cat_Center_on(I).Visible = True Then
                Cat_Center_on(I).Visible = False
                Cat_Left_on(I).Visible = False
                Cat_Right_on(I).Visible = False
                If Cat_Dlg(I).Visible = True Then
                    Cat_Dlg_on(I).Visible = False
                    Cat_Dlg_over(I).Visible = False
                End If
            End If
        Next
    Else
        For I = 0 To CatMouse.UBound
            If Cat_Center_on(I).Visible = True Then
                Cat_Center_on(I).Visible = False
                Cat_Left_on(I).Visible = False
                Cat_Right_on(I).Visible = False
                If Cat_Dlg(I).Visible = True Then
                    Cat_Dlg_on(I).Visible = False
                    Cat_Dlg_over(I).Visible = False
                End If
            End If
        Next
    End If
End Sub
Private Sub ButNone(Optional Index As Integer = -1)
    If Index <> -1 Then
        For KL = 0 To Index - 1
            If Button_center(KL).Visible = True Then
                Button_left(KL).Visible = False
                Button_right(KL).Visible = False
                Button_center(KL).Visible = False
                If Glip_off(I).Visible = True Then
                    Glip_on(I).Visible = False
                End If
            End If
        Next
        If Button_left(Index).Visible = False Then
            Button_left(Index).Visible = True
            Button_center(Index).Visible = True
            Button_right(Index).Visible = True
            If Glip_off(Index).Visible = True Then
                Glip_on(Index).Visible = True
            End If
        End If
        For KL = Index + 1 To ButMouse.UBound
            If Button_center(KL).Visible = True Then
                Button_left(KL).Visible = False
                Button_right(KL).Visible = False
                Button_center(KL).Visible = False
                If Glip_off(I).Visible = True Then
                    Glip_on(I).Visible = False
                End If
            End If
        Next
    Else
        For KL = 0 To ButMouse.UBound
            If Button_center(KL).Visible = True Then
                Button_left(KL).Visible = False
                Button_right(KL).Visible = False
                Button_center(KL).Visible = False
                If Glip_off(I).Visible = True Then
                    Glip_on(I).Visible = False
                End If
            End If
        Next
    End If
End Sub
Private Sub Barra2_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone
    CatNone
    ButNone
End Sub
Private Sub BarraLeft_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone
    CatNone
    ButNone
End Sub
Private Sub BarraRight_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone
    CatNone
    ButNone
End Sub
Private Sub ButMouse_Click(Index As Integer)
    RaiseEvent ButtonClick(ButMouse(Index).Tag, Button_Caption(Index).Caption)

End Sub
Private Sub ButMouse_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    Button_left_over(Index).Visible = True
    Button_center_over(Index).Visible = True
    Button_right_over(Index).Visible = True
End Sub
Private Sub ButMouse_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone
    CatNone Button_center(Index).Tag
    ButNone Index
End Sub
Private Sub ButMouse_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    Button_left_over(Index).Visible = False
    Button_center_over(Index).Visible = False
    Button_right_over(Index).Visible = False
End Sub
Private Sub Cat_Dlg_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone
    CatNone Index
    ButNone
End Sub
Private Sub Cat_Dlg_on_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone
    CatNone Index
    ButNone
    Cat_Dlg_over(Index).Visible = True
End Sub
Private Sub Cat_Dlg_over_Click(Index As Integer)
    RaiseEvent CatClick(Cat_Caption(Index).Tag, Cat_Caption(Index).Caption)
End Sub
Private Sub CatMouse_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone
    CatNone Index
    ButNone
End Sub
Private Sub TabMouse_Click(Index As Integer)
    TabNone
    For I = 0 To Index - 1
        Tab_center(I).Visible = False
        Tab_left(I).Visible = False
        Tab_right(I).Visible = False
        Tab_caption(I).ForeColor = TAB_NORMAL
    Next
    Tab_caption(Index).ForeColor = TAB_SELECTED
    Tab_center(Index).Visible = True
    Tab_left(Index).Visible = True
    Tab_right(Index).Visible = True
    For I = Index + 1 To TabMouse.UBound
        Tab_center(I).Visible = False
        Tab_left(I).Visible = False
        Tab_right(I).Visible = False
        Tab_caption(I).ForeColor = TAB_NORMAL
    Next
    TabSelected = TabID(Index)
    CatsUpdate
    RaiseEvent TabClick(TabID(Index), TabC(Index))
End Sub
Private Sub TabMouse_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    TabNone Index
    CatNone
    ButNone
End Sub
Private Sub UserControl_Initialize()
    Barra2.Top = -(26 * 15)
    BarraLeft.Top = Barra2.Top
    BarraRight.Top = Barra2.Top

    UserControl.Height = Barra2.Height
    Barra2.Width = 2048 * 15
    TotalTopButton = 0
    TotalButton = 0
    TotalTabs = 0
    TotalCats = 0
    TabSelected = ""
    TabMouse(0).BackStyle = 0
    CatMouse(0).BackStyle = 0
    ButMouse(0).BackStyle = 0
End Sub
Private Sub TabsUpdate()
    On Error Resume Next
    For I = 1 To (TotalTabs - 1)
        Unload Tab_caption(I)
        Unload Tab_left(I)
        Unload Tab_center(I)
        Unload Tab_right(I)
        Unload Tab_left_over(I)
        Unload Tab_center_over(I)
        Unload Tab_right_over(I)
        Unload TabMouse(I)
    Next
    For I = 0 To (TotalTabs - 1)
        If I <> 0 Then
            Load Tab_caption(I)
            Load Tab_left(I)
            Load Tab_center(I)
            Load Tab_right(I)
            Load Tab_left_over(I)
            Load Tab_center_over(I)
            Load Tab_right_over(I)
            Load TabMouse(I)
            Tab_left(I).Left = Tab_right(I - 1).Left + Tab_right(I).Width
        Else
            Tab_left(0).Left = 90
        End If
        TabMouse(I).Left = Tab_left(I).Left
        
        Tab_caption(I).Top = 0 + 60
        Tab_center(I).Top = 0
        Tab_left(I).Top = 0
        Tab_right(I).Top = 0
        Tab_center_over(I).Top = 0
        Tab_left_over(I).Top = 0
        Tab_right_over(I).Top = 0
        TabMouse(I).Top = 0
        
        Tab_caption(I) = TabC(I)
        Tab_center(I).Width = Tab_caption(I).Width
        Tab_center(I).Left = Tab_left(I).Left + Tab_left(I).Width
        Tab_caption(I).Left = Tab_center(I).Left
        Tab_right(I).Left = Tab_center(I).Left + Tab_center(I).Width
        
        Tab_center_over(I).Width = Tab_center(I).Width
        Tab_center_over(I).Left = Tab_center(I).Left
        Tab_left_over(I).Left = Tab_left(I).Left
        Tab_right_over(I).Left = Tab_right(I).Left
        
        TabMouse(I).Width = Tab_left(I).Width + Tab_right(I).Width + Tab_center(I).Width
        
        Tab_caption(I).ForeColor = TAB_NORMAL
        
        Tab_caption(I).Visible = True
        If I = 0 Then
            Tab_center(I).Visible = True
            Tab_left(I).Visible = True
            Tab_right(I).Visible = True
            Tab_caption(I).ForeColor = TAB_SELECTED
        End If
        TabMouse(I).Visible = True
    
        Tab_center(I).ZOrder 0
        Tab_left(I).ZOrder 0
        Tab_right(I).ZOrder 0
        
        Tab_center_over(I).ZOrder 0
        Tab_left_over(I).ZOrder 0
        Tab_right_over(I).ZOrder 0
        
        Tab_caption(I).ZOrder 0
        TabMouse(I).ZOrder 0
    Next
End Sub
Private Sub CatsUpdate()
    On Error Resume Next
    ztopo = 360
    Cat_Center_off(0).Top = ztopo
    Cat_Center_on(0).Top = ztopo
    Cat_Left_off(0).Top = ztopo
    Cat_Left_on(0).Top = ztopo
    Cat_Right_off(0).Top = ztopo
    Cat_Right_on(0).Top = ztopo
    CatMouse(0).Top = ztopo
    Cat_Caption(0).Top = 1400
    
    Dim TotalCatsT As Integer
    Dim CatsIDT(30) As String
    Dim CatsCT(30) As String
    Dim CatsTT(30) As String
    Dim CatsDT(30) As Boolean
    TotalCatsT = 0
    For I = 0 To TotalCats
        If CatsT(I) = TabSelected And TabSelected <> "" And CatsT(I) <> "" Then
            CatsIDT(TotalCatsT) = CatsID(I)
            CatsTT(TotalCatsT) = CatsT(I)
            CatsCT(TotalCatsT) = CatsC(I)
            CatsDT(TotalCatsT) = CatsD(I)
            TotalCatsT = TotalCatsT + 1
        End If
    Next
    For I = 1 To CatMouse.UBound
            Unload Cat_Left_off(I)
            Unload Cat_Left_on(I)
            Unload Cat_Right_off(I)
            Unload Cat_Right_on(I)
            Unload Cat_Center_off(I)
            Unload Cat_Center_on(I)
            Unload Cat_Caption(I)
            Unload CatMouse(I)
            Unload Cat_Dlg(I)
            Unload Cat_Dlg_on(I)
            Unload Cat_Dlg_over(I)
    Next
    For I = 1 To Button_center.UBound
        Unload Button_left(I)
        Unload Button_center(I)
        Unload Button_right(I)
        Unload Button_left_over(I)
        Unload Button_center_over(I)
        Unload Button_right_over(I)
        Unload Button_Caption(I)
        Unload Button_Icon(I)
        Unload Glip_on(I)
        Unload Glip_off(I)
        Unload ButMouse(I)
    Next
    Button_left(0).Visible = False
    Button_center(0).Visible = False
    Button_right(0).Visible = False
    Button_Caption(0).Visible = False
    Button_Icon(0).Visible = False
    ButMouse(0).Visible = False
    
    Cat_Left_off(0).Visible = False
    Cat_Left_on(0).Visible = False
    Cat_Right_off(0).Visible = False
    Cat_Right_on(0).Visible = False
    Cat_Center_off(0).Visible = False
    Cat_Center_on(0).Visible = False
    Cat_Caption(0).Visible = False
    CatMouse(0).Visible = False
    Cat_Dlg(0).Visible = False
    Cat_Dlg_on(0).Visible = False
    Cat_Dlg_over(0).Visible = False
    For I = 0 To (TotalCatsT - 1)
        If I <> 0 Then
            Load Cat_Left_off(I)
            Load Cat_Left_on(I)
            Load Cat_Right_off(I)
            Load Cat_Right_on(I)
            Load Cat_Center_off(I)
            Load Cat_Center_on(I)
            Load Cat_Caption(I)
            Load CatMouse(I)
            Load Cat_Dlg(I)
            Load Cat_Dlg_on(I)
            Load Cat_Dlg_over(I)
            Cat_Left_off(I).Left = Cat_Right_off(I - 1).Left + Cat_Right_off(I).Width
        Else
            Cat_Left_off(I).Left = 120
        End If
        CatMouse(I).Left = Cat_Left_off(I).Left
        
        Cat_Caption(I).Caption = CatsCT(I)
        Cat_Caption(I).Tag = CatsIDT(I)
        
        Cat_Center_off(I).Left = Cat_Left_off(I).Left + Cat_Left_off(I).Width
        
        BUTSIZE = ButtonsUpdate(CatsIDT(I), Cat_Center_off(I).Left, I + 0)
        
        If CatsDT(I) = True Then
            Cat_Center_off(I).Width = Cat_Caption(I).Width + Cat_Dlg(I).Width
        Else
            Cat_Center_off(I).Width = Cat_Caption(I).Width
        End If
        
        If Cat_Center_off(I).Width < BUTSIZE Then
            Cat_Center_off(I).Width = BUTSIZE
            Cat_Caption(I).Left = Cat_Center_off(I).Left + ((Cat_Center_off(I).Width - Cat_Caption(I).Width) / 2)
        Else
            Cat_Caption(I).Left = Cat_Center_off(I).Left
        End If
        
        Cat_Right_off(I).Left = Cat_Center_off(I).Left + Cat_Center_off(I).Width
        
        Cat_Center_on(I).Width = Cat_Center_off(I).Width
        Cat_Center_on(I).Left = Cat_Center_off(I).Left
        Cat_Left_on(I).Left = Cat_Left_off(I).Left
        Cat_Right_on(I).Left = Cat_Right_off(I).Left
        
        CatMouse(I).Width = Cat_Left_off(I).Width + Cat_Right_off(I).Width + Cat_Center_off(I).Width
        
        Cat_Caption(I).Visible = True
        Cat_Center_off(I).Visible = True
        Cat_Left_off(I).Visible = True
        Cat_Right_off(I).Visible = True
        CatMouse(I).Visible = True
    
        Cat_Center_off(I).ZOrder 0
        Cat_Left_off(I).ZOrder 0
        Cat_Right_off(I).ZOrder 0
        
        Cat_Center_on(I).ZOrder 0
        Cat_Left_on(I).ZOrder 0
        Cat_Right_on(I).ZOrder 0
        
        Cat_Caption(I).ZOrder 0
        CatMouse(I).ZOrder 0
        
        Cat_Dlg(I).Left = (Cat_Right_off(I).Left - Cat_Dlg(I).Width) + 15
        Cat_Dlg(I).Top = (Cat_Right_off(I).Top + Cat_Right_off(I).Height) - (Cat_Dlg(I).Height + 60)
        
        Cat_Dlg_on(I).Left = Cat_Dlg(I).Left
        Cat_Dlg_over(I).Left = Cat_Dlg(I).Left
        
        Cat_Dlg_on(I).Top = Cat_Dlg(I).Top
        Cat_Dlg_over(I).Top = Cat_Dlg(I).Top
        
        
        Cat_Dlg_on(I).Visible = False
        Cat_Dlg_over(I).Visible = False
        
        If CatsDT(I) = True Then
            Cat_Dlg(I).Visible = True
        End If
        Cat_Dlg(I).ZOrder 0
        Cat_Dlg_on(I).ZOrder 0
        Cat_Dlg_over(I).ZOrder 0
    Next
    DoEvents
    For KL = 0 To ButMouse.UBound
        Button_left(KL).Visible = False
        Button_left(KL).ZOrder 0
        Button_right(KL).Visible = False
        Button_right(KL).ZOrder 0
        Button_center(KL).Visible = False
        Button_center(KL).ZOrder 0
        
        Button_left_over(KL).Visible = False
        Button_left_over(KL).ZOrder 0
        Button_right_over(KL).Visible = False
        Button_right_over(KL).ZOrder 0
        Button_center_over(KL).Visible = False
        Button_center_over(KL).ZOrder 0
        
        Button_Icon(KL).ZOrder 0
        Button_Caption(KL).ZOrder 0
        
        Glip_off(KL).ZOrder 0
        Glip_on(KL).ZOrder 0
        
        ButMouse(KL).ZOrder 0
    Next
End Sub
Private Sub UserControl_Resize()
    'On Error Resume Next
    UserControl.Height = Barra2.Height - (26 * 15)
    'UserControl.Width = UserControl.ParentControls.Item(0).ScaleWidth
    'BarraRight.Left = UserControl.Width - BarraRight.Width
End Sub
Public Sub Refresh()
Attribute Refresh.VB_Description = "Forces a complete repaint of a object."
    UserControl_Resize
    TabsUpdate
    CatsUpdate
End Sub
Private Sub UserControl_InitProperties()
    m_Theme = m_def_Theme
    m_BC = m_def_BC
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    m_Theme = PropBag.ReadProperty("Theme", m_def_Theme)
    m_BC = PropBag.ReadProperty("ButtonCenter", m_def_BC)
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("Theme", m_Theme, m_def_Theme)
    Call PropBag.WriteProperty("ButtonCenter", m_BC, m_def_BC)
    Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &H464646)
    Call PropBag.WriteProperty("ForeColor", UserControl.ForeColor, &HFFFFFF)
End Sub
Public Function AddTab(zID As String, zCaption As String) As Boolean
    TotalTabs = TotalTabs + 1
    TabID(TotalTabs - 1) = zID
    zCaption = Replace(zCaption, vbNewLine, " ")
    TabC(TotalTabs - 1) = zCaption
    If TabSelected = "" Then
        TabSelected = zID
    End If
End Function
Public Function AddCat(zID As String, zTab As String, zCaption As String, zDlgButton As Boolean) As Boolean
    TotalCats = TotalCats + 1
    CatsID(TotalCats - 1) = zID
    CatsT(TotalCats - 1) = zTab
    zCaption = Replace(zCaption, vbNewLine, " ")
    CatsC(TotalCats - 1) = zCaption
    CatsD(TotalCats - 1) = zDlgButton
End Function
Public Function AddButton(zID As String, zSubCat As String, zCaption As String, zPicture As Integer, Optional zMore As Boolean = False, Optional zToolTip As String) As Boolean
    TotalButton = TotalButton + 1
    TopBuID(TotalButton - 1) = zID
    TopBuS(TotalButton - 1) = zSubCat
    TopBuC(TotalButton - 1) = zCaption
    If zToolTip = "" Or zToolTip = Null Then
        If InStr(zCaption, vbNewLine) Then
            zCaption = Replace(zCaption, vbNewLine, " ")
        End If
        TopBuT(TotalButton - 1) = zCaption
    Else
        zToolTip = Replace(zToolTip, vbNewLine, " ")
        TopBuT(TotalButton - 1) = zToolTip
    End If
    Set TopBuI(TotalButton - 1) = zImg.ItemPicture(zPicture)
    TopBuG(TotalButton - 1) = zMore
End Function
Private Function ButtonsUpdate(SubCat As String, PosIni As Integer, CatID As Integer) As Integer
    On Error Resume Next
    Dim TotalButtonT As Integer
    Dim TopBuIDT(90) As String
    Dim TopBuST(90) As String
    Dim TopBuCT(90) As String
    Dim TopBuIT(90) As Picture
    Dim TopBuTT(90) As String
    Dim TopBuGT(90) As Boolean
    TotalSize = 0
    TotalButtonT = 0
    For I = 0 To TotalButton
        If TopBuS(I) = SubCat Then
            TopBuIDT(TotalButtonT) = TopBuID(I)
            TopBuST(TotalButtonT) = TopBuS(I)
            TopBuCT(TotalButtonT) = TopBuC(I)
            TopBuTT(TotalButtonT) = TopBuT(I)
            Set TopBuIT(TotalButtonT) = TopBuI(I)
            TopBuGT(TotalButtonT) = TopBuG(I)
            TotalButtonT = TotalButtonT + 1
        End If
    Next
    Button_left(0).Visible = False
    Button_center(0).Visible = False
    Button_right(0).Visible = False
    Button_Caption(0).Visible = True
    Button_Icon(0).Visible = True
    ButMouse(0).Visible = True
    xt = ButMouse.UBound + 1
    For I = xt To (TotalButtonT - 1) + xt
        If I <> 0 Then
            Load Button_left(I)
            Load Button_center(I)
            Load Button_right(I)
            Load Button_left_over(I)
            Load Button_center_over(I)
            Load Button_right_over(I)
            Load Button_Caption(I)
            Load Button_Icon(I)
            Load Glip_on(I)
            Load Glip_off(I)
            Load ButMouse(I)
        End If
        ButMouse(I).Tag = TopBuIDT(I - xt)
        
        Button_center(I).Tag = CatID

        ButMouse(I).Top = Cat_Left_off(0).Top + 60
        Button_left(I).Top = ButMouse(I).Top
        Button_center(I).Top = ButMouse(I).Top
        Button_right(I).Top = ButMouse(I).Top
        Button_left_over(I).Top = ButMouse(I).Top
        Button_center_over(I).Top = ButMouse(I).Top
        Button_right_over(I).Top = ButMouse(I).Top
        
        If I = xt Then
            posatu = PosIni
        Else
            posatu = ButMouse(I - 1).Left + ButMouse(I - 1).Width + 30
        End If
        ButMouse(I).Left = posatu
        Button_left(I).Left = ButMouse(I).Left
        Button_left_over(I).Left = Button_left(I).Left
        Button_center(I).Left = Button_left(I).Left + Button_left(I).Width
        Button_center_over(I).Left = Button_center(I).Left
        
        Button_Caption(I).Caption = TopBuCT(I - xt)
        
        Set Button_Icon(I) = TopBuIT(I - xt)
        
        If m_BC = True Then
            ESP = Button_center(I).Height - (Button_Icon(I).Height + Button_Caption(I).Height)
            If TopBuGT(I - xt) = True Then
                Button_Icon(I).Top = Button_center(I).Top + ((ESP - (Button_Caption(I).Height / 2)) / 2)
            Else
                Button_Icon(I).Top = Button_center(I).Top + ((ESP) / 2)
            End If
        Else
            Button_Icon(I).Top = Button_center(I).Top + 90
        End If
            
        
        Button_Caption(I).Top = Button_Icon(I).Top + Button_Icon(I).Height
        
        Glip_off(I).Top = Button_Caption(I).Top + Button_Caption(I).Height + ((Button_Caption(I).Height - Glip_off(I).Height) / 2)
        Glip_on(I).Top = Glip_off(I).Top
        
        
        If Button_Caption(I).Width > Button_Icon(I).Width Then
            Button_Caption(I).Left = Button_center(I).Left
            esp2 = (Button_Caption(I).Width - Button_Icon(I).Width) / 2
            Button_Icon(I).Left = Button_Caption(I).Left + esp2
            Area = Button_Caption(I).Width
        Else
            Button_Icon(I).Left = Button_center(I).Left
            esp2 = (Button_Icon(I).Width - Button_Caption(I).Width) / 2
            Button_Caption(I).Left = Button_Icon(I).Left + esp2
            Area = Button_Icon(I).Width
        End If
    
        Glip_off(I).Left = Button_Caption(I).Left + ((Button_Caption(I).Width - Glip_on(I).Width) / 2)
        Glip_on(I).Left = Glip_off(I).Left
    
        Button_center(I).Width = Area
        Button_center_over(I).Width = Button_center(I).Width
        Button_right(I).Left = Button_center(I).Left + Button_center(I).Width
        Button_right_over(I).Left = Button_right(I).Left
        ButMouse(I).Width = (Button_right(I).Width + Button_right(I).Width) + Button_center(I).Width
        
        ButMouse(I).ToolTipText = TopBuTT(I - xt)
        Button_Icon(I).Visible = True
        Button_Caption(I).Visible = True
        ButMouse(I).Visible = True
        If TopBuGT(I - xt) = True Then
            Glip_off(I).Visible = True
            Glip_off(I).ZOrder 0
            Glip_on(I).ZOrder 0
        End If
    
        TotalSize = TotalSize + ButMouse(I).Width + 30
    Next
    ButtonsUpdate = TotalSize - 30
End Function
Public Property Get Theme() As Integer
Attribute Theme.VB_ProcData.VB_Invoke_Property = "PropertyPage1"
    Theme = m_Theme
End Property
Public Property Let Theme(ByVal New_Theme As Integer)
    If New_Theme < 0 Or New_Theme > 2 Then New_Theme = 0
    m_Theme = New_Theme
    PropertyChanged "Theme"
    LoadTheme m_Theme
End Property
Public Property Get ButtonCenter() As Variant
    ButtonCenter = m_BC
End Property
Public Property Let ButtonCenter(ByVal New_BC As Variant)
    m_BC = New_BC
    PropertyChanged "ButtonCenter"
End Property
Private Function LoadTheme(iTema)
    Select Case iTema
        Case 0
            ID = "BLACK"
            Cat_Caption(0).ForeColor = &HFFFFFF
            TAB_NORMAL = vbWhite
            TAB_SELECTED = vbBlack
            Button_Caption(0).ForeColor = &H80000008
            UserControl.BackColor = &H464646
            UserControl.ForeColor = &HFFFFFF
        Case 1
            ID = "BLUE"
            Cat_Caption(0).ForeColor = &HB86A3E
            TAB_NORMAL = &H8B4215
            TAB_SELECTED = &H8B4215
            Button_Caption(0).ForeColor = &H8B4215
            UserControl.BackColor = &HDAB08E
            UserControl.ForeColor = &H8B4215
        Case 2
            ID = "SILVER"
            Cat_Caption(0).ForeColor = &H6A625C
            TAB_NORMAL = &H6A625C
            TAB_SELECTED = &H6A625C
            Button_Caption(0).ForeColor = &H6A625C
            UserControl.BackColor = &HDDD4D0
            UserControl.ForeColor = &H6A625C
        Case Else
            ID = "BLACK"
    End Select
    Set Barra2.Picture = LoadResPicture(101, ID)
    Set BarraLeft.Picture = LoadResPicture(102, ID)
    Set BarraRight.Picture = LoadResPicture(103, ID)
    Set Cat_Dlg(0).Picture = LoadResPicture(118, ID)
    Set Cat_Dlg_on(0).Picture = LoadResPicture(119, ID)
    Set Cat_Dlg_over(0).Picture = LoadResPicture(120, ID)
    Set Cat_Left_off(0).Picture = LoadResPicture(121, ID)
    Set Cat_Center_off(0).Picture = LoadResPicture(122, ID)
    Set Cat_Right_off(0).Picture = LoadResPicture(123, ID)
    Set Cat_Left_on(0).Picture = LoadResPicture(124, ID)
    Set Cat_Center_on(0).Picture = LoadResPicture(125, ID)
    Set Cat_Right_on(0).Picture = LoadResPicture(126, ID)
    Set Tab_left(0).Picture = LoadResPicture(127, ID)
    Set Tab_center(0).Picture = LoadResPicture(128, ID)
    Set Tab_right(0).Picture = LoadResPicture(129, ID)
    Set Tab_left_over(0).Picture = LoadResPicture(130, ID)
    Set Tab_center_over(0).Picture = LoadResPicture(131, ID)
    Set Tab_right_over(0).Picture = LoadResPicture(132, ID)
    Set Glip_off(0).Picture = LoadResPicture(133, ID)
    Set Glip_on(0).Picture = LoadResPicture(134, ID)
    Set Button_left_over(0).Picture = LoadResPicture(135, ID)
    Set Button_center_over(0).Picture = LoadResPicture(136, ID)
    Set Button_right_over(0).Picture = LoadResPicture(137, ID)
    Set Button_left(0).Picture = LoadResPicture(138, ID)
    Set Button_center(0).Picture = LoadResPicture(139, ID)
    Set Button_right(0).Picture = LoadResPicture(140, ID)
End Function
Private Property Get TempDir() As String
    Dim sRet As String, c As Long
    Dim lErr As Long
    sRet = String$(MAX_PATH, 0)
    c = GetTempPath(MAX_PATH, sRet)
    lErr = Err.LastDllError
    If c = 0 Then
        Err.Raise 10000 Or lErr, App.EXEName & ".cAniCursor", WinAPIError(lErr)
    End If
    TempDir = Left$(sRet, c)
End Property
Private Property Get TempFileName(Optional ByVal sPrefix As String, Optional ByVal sPathName As String) As String
    Dim lErr As Long
    Dim iPos As Long
    If sPrefix = "" Then sPrefix = ""
    If sPathName = "" Then sPathName = TempDir
    Dim sRet As String
    sRet = String(MAX_PATH, 0)
    GetTempFileName sPathName, sPrefix, 0, sRet
    lErr = Err.LastDllError
    If Not lErr = 0 Then
        Err.Raise 10000 Or lErr, App.EXEName & ".cAniCursor", WinAPIError(lErr)
    End If
    iPos = InStr(sRet, vbNullChar)
    If Not iPos = 0 Then
        TempFileName = Left$(sRet, iPos - 1)
    End If
End Property
Private Function WinAPIError(ByVal lLastDLLError As Long) As String
    Dim sBuff As String
    Dim lCount As Long
    sBuff = String$(256, 0)
    lCount = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM Or FORMAT_MESSAGE_IGNORE_INSERTS, 0, lLastDLLError, 0&, sBuff, Len(sBuff), ByVal 0)
    If lCount Then
        WinAPIError = Left$(sBuff, lCount)
    End If
End Function
Public Property Get LoadSkin() As Skin
Select Case m_Theme
Case 0
Set LoadSkin = Skin1
Case 1
Set LoadSkin = Skin2
Case 2
Set LoadSkin = Skin3
Case Else
Set LoadSkin = Skin1
End Select
End Property
Public Property Get LoadBackground() As IPicture
    Dim sFile As String
    Dim B() As Byte
    Dim iFile As Integer
    On Error GoTo ErrorHandler
    Select Case m_Theme
        Case 0
            B = LoadResData(141, "BLACK")
        Case 1
            B = LoadResData(141, "BLUE")
        Case 2
            B = LoadResData(141, "SILVER")
    End Select
    sFile = TempFileName("LRP")
    iFile = FreeFile
    Open sFile For Binary Access Write Lock Read As #iFile
        Put #iFile, , B
    Close #iFile
    iFile = 0
    Set LoadBackground = LoadPicture(sFile)
    KillFile sFile
    Exit Property
ErrorHandler:
    Dim lErr As Long, sErr As String
    lErr = Err.Number:   sErr = Err.Description
    If Not iFile = 0 Then Close #iFile
    KillFile sFile
    Err.Raise Err.Number, App.EXEName & ".cLoadResPicture", Err.Description
    Exit Property
End Property
Private Property Get LoadResPicture(ByVal ID As Variant, ByVal Format As Variant) As IPicture
    Dim sFile As String
    Dim B() As Byte
    Dim iFile As Integer
    On Error GoTo ErrorHandler
    B = LoadResData(ID, Format)
    sFile = TempFileName("LRP")
    iFile = FreeFile
    Open sFile For Binary Access Write Lock Read As #iFile
        Put #iFile, , B
    Close #iFile
    iFile = 0
    Set LoadResPicture = LoadPicture(sFile)
    KillFile sFile
    Exit Property
ErrorHandler:
    Dim lErr As Long, sErr As String
    lErr = Err.Number:   sErr = Err.Description
    If Not iFile = 0 Then Close #iFile
    KillFile sFile
    Err.Raise Err.Number, App.EXEName & ".cLoadResPicture", Err.Description
    Exit Property
End Property
Private Sub KillFile(ByVal sFile As String)
    On Error Resume Next
    Kill sFile
End Sub
Public Sub Resize()
    UserControl_Resize
End Sub
Public Property Let ImageList(ByVal zImageList As Object)
    Set zImg = zImageList
End Property
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
    BackColor = UserControl.BackColor
End Property
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_Description = "Returns/sets the foreground color used to display text and graphics in an object."
    ForeColor = UserControl.ForeColor
End Property
