VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Begin VB.Form frmB4 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Busca Modelos"
   ClientHeight    =   4485
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6750
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4485
   ScaleWidth      =   6750
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame4 
      Caption         =   "Busca"
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   3495
      Begin VB.TextBox txtbuscas 
         Height          =   315
         Left            =   1200
         MaxLength       =   50
         TabIndex        =   3
         Top             =   360
         Width           =   2175
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   375
         Left            =   240
         OleObjectBlob   =   "frmB4.frx":0000
         TabIndex        =   4
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2040
      TabIndex        =   1
      Top             =   3960
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   3960
      Width           =   1815
   End
   Begin MSFlexGridLib.MSFlexGrid flexClientes 
      Height          =   2775
      Left            =   240
      TabIndex        =   5
      Top             =   1080
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   4895
      _Version        =   393216
      Cols            =   4
      BackColorFixed  =   14737632
      BackColorBkg    =   12632256
      FormatString    =   "Codigo     | Modelo                       |Empresa de Designe                     |Preço             "
   End
End
Attribute VB_Name = "frmB4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
frmProdutos.mskCodMod.PromptInclude = False
frmProdutos.mskCodMod = flexClientes.TextMatrix(flexClientes.Row, 0)
frmProdutos.mskCodMod.PromptInclude = True
frmProdutos.cmdBuscar_Codigo_Modelo = True
Unload Me
End Sub
Private Sub Command2_Click()
frmMdisig.mskCod_Desi.PromptInclude = False
frmMdisig.mskCod_Desi = flexClientes.TextMatrix(flexClientes.Row, 0)
frmMdisig.mskCod_Desi.PromptInclude = True
frmMdisig.cmdBuscar_Codigo_Desiger = True
Unload Me
End Sub

Private Sub flexClientes_DblClick()
frmProdutos.mskCodMod.PromptInclude = False
frmProdutos.mskCodMod = flexClientes.TextMatrix(flexClientes.Row, 0)
frmProdutos.mskCodMod.PromptInclude = True
frmProdutos.cmdBuscar_Codigo_Modelo = True
Unload Me
End Sub

Private Sub Form_Load()
            Call Modelos
           actskin.ApplySkin Me.hWnd
             
             actskin2.ApplySkin (Command1.hWnd)
             actskin2.ApplySkin (Command2.hWnd)
             
            Call carregar_lista

End Sub
Private Sub carregar_lista()
  With flexClientes
            
            Dim cont1 As Integer
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!modelo
            .TextMatrix(cont1, 3) = Format(tabelas!preço_cust, "R$ #,##0.00;(R$#,##0.00)")
            If tabelas2.State = adStateOpen Then tabelas2.Close
            tabelas2.Open "designe", conecta, adOpenKeyset, adLockOptimistic
            tabelas2.Close
            tabelas2.Open "select * from designe where codigo=" & tabelas!cod_d
            .TextMatrix(cont1, 2) = tabelas2!razaosocial
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!modelo
            .TextMatrix(cont1, 3) = Format(tabelas!preço_cust, "R$ #,##0.00;(R$#,##0.00)")
            tabelas2.Close
            tabelas2.Open "select * from designe where codigo=" & tabelas!cod_d
            .TextMatrix(cont1, 2) = tabelas2!razaosocial
            Else
            cont1 = Clear
            End If
            Wend
           
             End If
            End With
           If tabelas2.State = adStateOpen Then tabelas2.Close
End Sub
Private Sub Form_Unload(Cancel As Integer)
frmProdutos.Enabled = True

End Sub

Private Sub txtbuscas_Change()
             tabelas.Close
             tabelas.Open "select * from m_designe where modelo like '" & Replace(Replace(txtbuscas, "'", "''"), Chr(34), "") & "%' order by codigo"
              Call carregar_lista
End Sub
