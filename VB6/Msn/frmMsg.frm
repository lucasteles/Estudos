VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMsg 
   Caption         =   "GDP' Messenger"
   ClientHeight    =   6315
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9825
   LinkTopic       =   "Form1"
   ScaleHeight     =   6315
   ScaleWidth      =   9825
   StartUpPosition =   3  'Windows Default
   Begin RichTextLib.RichTextBox txtMsg 
      Height          =   1815
      Left            =   120
      TabIndex        =   4
      Top             =   3840
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   3201
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmMsg.frx":0000
   End
   Begin VB.CommandButton cmdEnviar 
      Caption         =   "Enviar"
      Height          =   375
      Left            =   6720
      TabIndex        =   3
      Top             =   5760
      Width           =   1215
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   8640
      OleObjectBlob   =   "frmMsg.frx":0082
      Top             =   3120
   End
   Begin VB.Timer Timer2 
      Interval        =   100
      Left            =   8640
      Top             =   2520
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   8640
      Top             =   2040
   End
   Begin VB.PictureBox PicMe 
      BackColor       =   &H00FFFFFF&
      Height          =   1575
      Left            =   8160
      ScaleHeight     =   1515
      ScaleWidth      =   1515
      TabIndex        =   2
      Top             =   4080
      Width           =   1575
   End
   Begin VB.PictureBox PicVC 
      BackColor       =   &H00FFFFFF&
      Height          =   1455
      Left            =   8160
      ScaleHeight     =   1395
      ScaleWidth      =   1515
      TabIndex        =   1
      Top             =   480
      Width           =   1575
   End
   Begin VB.ListBox lstMsg 
      Height          =   3180
      Left            =   120
      MultiSelect     =   2  'Extended
      TabIndex        =   0
      Top             =   480
      Width           =   7815
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   6255
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   11033
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmMsg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdEnviar_Click()
On Error GoTo erro
            

            Dim cod As Long
            SendKeys "{backspace}"
        
            If txtMsg.Text = Clear Then
            txtMsg = Clear
            txtMsg.SetFocus
            Exit Sub
            End If
            
2:            If Tabelas.State = adStateOpen Then Tabelas.Close
            Tabelas.Open Nome_tab, conectar, adOpenKeyset, adLockOptimistic
            
            If Tabelas.EOF = False And Tabelas.BOF = False Then Tabelas.MoveLast
            
            
            If Tabelas.EOF = False And Tabelas.BOF = False Then
            
            cod = Tabelas!codigo
            
            Else
            
            cod = 0
            
            End If
            
            Tabelas.Close
            Tabelas.Open Nome_tab, conectar, adOpenKeyset, adLockOptimistic
             
             
            Tabelas.AddNew
            Tabelas!codigo = cod + 1
            Tabelas!texto = txtMsg.Text
            Tabelas!codusu = cod_usuario
            Tabelas!codrec = cod_rec(TabStrip1.SelectedItem.Index)
            Tabelas.Update
            
            stat!status = 1
            stat.Update
                        
            lstMsg.AddItem (nome_usuario & " diz:")
            lstMsg.AddItem (txtMsg.Text)
            lstMsg.ListIndex = lstMsg.ListCount - 1
            txtMsg = Empty
            lstMsg.SetFocus
            
            SendKeys "{backspace}"
            Exit Sub
erro: Tabelas.Update
GoTo 2:
            
End Sub

Private Sub Form_Activate()
Call Form_Load
End Sub

Private Sub Form_Load()
On Error GoTo 2
frmMsg.Caption = "GDP ' Messenger"
frmMsg.Caption = frmMsg.Caption & " - Conversa com: " & nome_rec(TabStrip1.SelectedItem.Index)
Skin1.LoadSkin (App.Path & "\IceCold.skn")
Skin1.ApplySkin Me.hWnd

Nome_tab = cod_rec(TabStrip1.SelectedItem.Index) & "_" & cod_usuario
Rec_tab = cod_usuario & "_" & cod_rec(TabStrip1.SelectedItem.Index)

If Tabelas.State = adStateOpen Then Tabelas.Close
Tabelas.Open Nome_tab, conectar, adOpenKeyset, adLockOptimistic
2:
If stat.State = adStateOpen Then stat.Close
stat.Open "status", conectar, adOpenKeyset, adLockOptimistic

If usu.State = adStateOpen Then usu.Close
usu.Open "usuarios", conectar, adOpenKeyset, adLockOptimistic

End Sub

Private Sub Form_Unload(Cancel As Integer)
   
If TabStrip1.Tabs.Count > 1 Then
     For i = TabStrip1.SelectedItem.Index To TabStrip1.Tabs.Count
        cod_rec(i) = cod_rec(i + 1)
     Next
     
    cod_rec(TabStrip1.Tabs.Count) = Clear
    Me.TabStrip1.Tabs.Remove (TabStrip1.SelectedItem.Index)
    
    Cancel = True
   
End If


End Sub

Private Sub TabStrip1_Click()
Nome_tab = TABcod(TabStrip1.SelectedItem.Index) & "_" & cod_usuario
Rec_tab = cod_usuario & "_" & TABcod(TabStrip1.SelectedItem.Index)
frmMsg.Caption = "GDP ' Messenger"
frmMsg.Caption = frmMsg.Caption & " - Conversa com: " & TabStrip1.SelectedItem.Caption

End Sub

Private Sub Timer1_Timer()
'On Error GoTo erro
'erro:
            If stat!status = 1 Then
            If Tabelas.State = adStateOpen Then Tabelas.Close
            Tabelas.Open "Select * from " & Rec_tab & " where codusu=" & cod_rec(TabStrip1.SelectedItem.Index) & "And codrec = " & cod_usuario
            
               If Tabelas!codusu = 0 Then Exit Sub
                   
            While Tabelas.EOF = False
            lstMsg.AddItem (nome_rec(TabStrip1.SelectedItem.Index) & " diz:")
            lstMsg.AddItem (Tabelas!texto)
            lstMsg.ListIndex = lstMsg.ListCount - 1
            Tabelas.MoveNext
            
            Wend
            
            conectar.Execute "delete * from " & Rec_tab & " where codusu=" & cod_rec(frmLogin.cmbOn.ListIndex + 1) & "And codrec = " & cod_usuario
            stat!status = 0
            stat.Update
                        
            End If
             
End Sub

Private Sub txtMsg_KeyPress(KeyAscii As Integer)
            If KeyAscii = 13 Then
            cmdEnviar = True
            txtMsg = Clear
            txtMsg.SetFocus
            End If
End Sub
