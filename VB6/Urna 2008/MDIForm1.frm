VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "Controle Urna 2008"
   ClientHeight    =   8190
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   11580
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   Picture         =   "MDIForm1.frx":0442
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1800
      Top             =   2280
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":2A646
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":2AA98
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":2AEEA
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":2B33C
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":2B656
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11580
      _ExtentX        =   20426
      _ExtentY        =   1111
      ButtonWidth     =   1032
      ButtonHeight    =   1005
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   5
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   2
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   4
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   1
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   5
         EndProperty
      EndProperty
      BorderStyle     =   1
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   3360
         Top             =   120
      End
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   600
      OleObjectBlob   =   "MDIForm1.frx":2BAA8
      Top             =   600
   End
   Begin VB.Menu bnbmbnm 
      Caption         =   "&Arquivo"
      Begin VB.Menu hjj 
         Caption         =   "Zerar eleiçao"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuConc 
         Caption         =   "&Concluir a eleiçao"
         Shortcut        =   +^{F1}
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub hjj_Click()
Call zerar

If tabela.State = adStateOpen Then tabela.Close
tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
tabela!foda = 0
tabela.Update

Toolbar1.Buttons.Item(1).Enabled = True
mnuConc.Enabled = True
hjj.Enabled = False
End Sub


Private Sub MDIForm_Load()

Skin1.LoadSkin (App.Path & "\Alien.skn") ' app.patch indica que o skin esta na mesma página que o projeto
Skin1.ApplySkin Me.hWnd ' aplica o skin

Call conectar_banco

If tabela.State = adStateOpen Then tabela.Close
tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
If tabela!foda = 1 Then
Toolbar1.Buttons.Item(1).Enabled = False
mnuConc.Enabled = False
hjj.Enabled = True
End If
Exit Sub



tabela.Close
tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic
tabela.Close
             tabela.Open " select * from cand where votos <> 0 "
             
                   
             If tabela.BOF = False Or tabela.EOF = False Then
             MsgBox " As eleições ja foram iniciadas, por este motivo algumas opções estão desativadas!", vbInformation
             Beep
                Toolbar1.Buttons.Item(2).Enabled = False
                Toolbar1.Buttons.Item(3).Enabled = False
                Toolbar1.Buttons.Item(4).Enabled = False
                Toolbar1.Buttons.Item(5).Enabled = False

             
            
             End If
End Sub

Private Sub mnuConc_Click()

If tabela.State = adStateOpen Then tabela.Close
tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
tabela!foda = 1
tabela!Data = Date
tabela!hora = Time
tabela.Update
MsgBox "Eleiçao concluida: " & Date & " - " & Time
                Toolbar1.Buttons.Item(2).Enabled = True
                Toolbar1.Buttons.Item(3).Enabled = True
                Toolbar1.Buttons.Item(4).Enabled = True
                Toolbar1.Buttons.Item(5).Enabled = True
                 hjj.Enabled = True
                mnuConc.Enabled = False
                 Toolbar1.Buttons.Item(1).Enabled = False
                 Unload frmAlunos

End Sub

Private Sub Timer1_Timer()
             deUrna.rscomCand.Open "select * from cand order by votos"
rptCand.Show
            conecta.Execute "update cand set porc = 0"
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic
            Timer1.Enabled = False
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
On Error Resume Next
            Select Case Button.Index
            
            Case 2: frmCad.Show
            Case 4
            
             If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
             If tabela!foda = 1 Then vencedor.Show Else MsgBox "Esta opçao so esta acessivel apos concluir a eleiçao!", vbApplicationModal
            Case 1: frmAlunos.Show
            Case 3
            
            If tabela.State = adStateOpen Then tabela.Close
             tabela.Open "conc", conecta, adOpenKeyset, adLockOptimistic
           If tabela!foda = 1 Then GoTo sexo
           
           
             If tabela.State = adStateOpen Then tabela.Close
             tabela.Open " select * from cand where votos <> 0 "
             
                   
             If tabela.BOF = False Or tabela.EOF = False Then
                MsgBox "A eleição foi iniciada. Nenhuma informação pode ser alterada", vbInformation
                Exit Sub
                Else
                Call Rel
             End If
sexo:
            Call Rel
            Case 5: frmGrafico.Show
            
            End Select
End Sub


Private Sub Rel()
On Error Resume Next
            Dim cont As Integer
            Dim porc As Variant
            Dim CP As String
            
            
            
            
            If tabela.State = adStateOpen Then tabela.Close
            tabela.Open "cand", conecta, adOpenKeyset, adLockOptimistic
            
            
          
            
            cont = Clear
            tabela.MoveFirst
            porc = tabela!votos
            While cont = Empty
            tabela.MoveNext
            If tabela.EOF = False Then
            porc = porc + tabela!votos
            Else
            cont = 1
            End If
            Wend
            
            
            cont = Clear
            tabela.MoveFirst
            CP = (tabela!votos / porc) * 100
            If Len(CP) > 4 Then CP = Mid(CP, 1, 4)
            CP = CP & "%"
            tabela!porc = CP
            tabela.Update
            
            While tabela.EOF = False
            tabela.MoveNext
            If tabela.EOF = False Or tabela.BOF = False Then
            CP = (tabela!votos / porc) * 100
            If Len(CP) > 4 Then CP = Mid(CP, 1, 4)
            CP = CP & "%"
            conecta.Execute "update cand set porc='" & CP & "' where cod_do_cand=" & tabela!cod_do_cand
            End If
            Wend
            Timer1.Enabled = True
            
            
            
    
             cont = Clear
             CP = Clear
             porc = Clear
             
             
        

End Sub

