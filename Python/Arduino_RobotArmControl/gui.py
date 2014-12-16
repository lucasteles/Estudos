# -*- coding: utf-8 -*- 

###########################################################################
## Python code generated with wxFormBuilder (version Sep  8 2010)
## http://www.wxformbuilder.org/
##
## PLEASE DO "NOT" EDIT THIS FILE!
###########################################################################

import wx

###########################################################################
## Class MainFrameBase
###########################################################################

class MainFrameBase ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = u"BionicArm - ATC", pos = wx.DefaultPosition, size = wx.Size( 210,333 ), style = wx.DEFAULT_FRAME_STYLE|wx.TAB_TRAVERSAL )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer2 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_panel = wx.Panel( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer4 = wx.FlexGridSizer( 10, 2, 0, 0 )
		fgSizer4.SetFlexibleDirection( wx.BOTH )
		fgSizer4.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.label0 = wx.StaticText( self.m_panel, wx.ID_ANY, u"Porta:", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.label0.Wrap( -1 )
		fgSizer4.Add( self.label0, 0, wx.ALL, 5 )
		
		cboPortasChoices = [ u"COM1", u"COM2", u"COM3", u"COM4", u"COM5", u"COM6", u"COM7", u"COM8", u"VOM9", u"COM10", u"COM12", u"COM13", u"COM14", u"COM15", u"COM16", u"COM17", u"VOM18", u"COM19", u"COM20" ]
		self.cboPortas = wx.ComboBox( self.m_panel, wx.ID_ANY, u"COM1", wx.DefaultPosition, wx.DefaultSize, cboPortasChoices, 0 )
		fgSizer4.Add( self.cboPortas, 0, wx.ALL, 5 )
		
		self.label1 = wx.StaticText( self.m_panel, wx.ID_ANY, u"Mov.Horizontal", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.label1.Wrap( -1 )
		fgSizer4.Add( self.label1, 0, wx.ALL, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.btnH1 = wx.Button( self.m_panel, wx.ID_ANY, u"Esquerda", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.btnH1, 0, wx.ALL, 5 )
		
		self.m_button16 = wx.Button( self.m_panel, wx.ID_ANY, u"Direita", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.m_button16, 0, wx.ALL, 5 )
		
		self.label2 = wx.StaticText( self.m_panel, wx.ID_ANY, u"Mov. vertical 1", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.label2.Wrap( -1 )
		fgSizer4.Add( self.label2, 0, wx.ALL, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.btnV11 = wx.Button( self.m_panel, wx.ID_ANY, u"Esquerda", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.btnV11, 0, wx.ALL, 5 )
		
		self.btnV12 = wx.Button( self.m_panel, wx.ID_ANY, u"Direita", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.btnV12, 0, wx.ALL, 5 )
		
		self.label3 = wx.StaticText( self.m_panel, wx.ID_ANY, u"Mov. vertical 2", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.label3.Wrap( -1 )
		fgSizer4.Add( self.label3, 0, wx.ALL, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.btnV21 = wx.Button( self.m_panel, wx.ID_ANY, u"Esquerda", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.btnV21, 0, wx.ALL, 5 )
		
		self.btnV22 = wx.Button( self.m_panel, wx.ID_ANY, u"Direita", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.btnV22, 0, wx.ALL, 5 )
		
		self.label4 = wx.StaticText( self.m_panel, wx.ID_ANY, u"Pinça:", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.label4.Wrap( -1 )
		fgSizer4.Add( self.label4, 0, wx.ALL, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.btnPinca = wx.Button( self.m_panel, wx.ID_ANY, u"Abre Pinça", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.btnPinca, 0, wx.ALL, 5 )
		
		self.btnFechaPinca = wx.Button( self.m_panel, wx.ID_ANY, u"Fecha Pinça", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.btnFechaPinca, 0, wx.ALL, 5 )
		
		self.m_staticText7 = wx.StaticText( self.m_panel, wx.ID_ANY, u"Comando:", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText7.Wrap( -1 )
		fgSizer4.Add( self.m_staticText7, 0, wx.ALL, 5 )
		
		self.txtR = wx.TextCtrl( self.m_panel, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, 0 )
		self.txtR.SetBackgroundColour( wx.SystemSettings.GetColour( wx.SYS_COLOUR_INACTIVECAPTION ) )
		
		fgSizer4.Add( self.txtR, 0, wx.ALL, 5 )
		
		self.m_panel.SetSizer( fgSizer4 )
		self.m_panel.Layout()
		fgSizer4.Fit( self.m_panel )
		bSizer2.Add( self.m_panel, 1, wx.EXPAND |wx.ALL, 0 )
		
		self.SetSizer( bSizer2 )
		self.Layout()
		self.m_statusBar = self.CreateStatusBar( 1, wx.ST_SIZEGRIP, wx.ID_ANY )
		
		# Connect Events
		self.cboPortas.Bind( wx.EVT_KILL_FOCUS, self.cboPortas_LostFocus )
		self.btnH1.Bind( wx.EVT_BUTTON, self.myH1 )
		self.m_button16.Bind( wx.EVT_BUTTON, self.myH2 )
		self.btnV11.Bind( wx.EVT_BUTTON, self.myV11 )
		self.btnV12.Bind( wx.EVT_BUTTON, self.myV12 )
		self.btnV21.Bind( wx.EVT_BUTTON, self.myV21 )
		self.btnV22.Bind( wx.EVT_BUTTON, self.myV22 )
		self.btnPinca.Bind( wx.EVT_BUTTON, self.myPinca )
		self.btnFechaPinca.Bind( wx.EVT_BUTTON, self.myFecha )
		self.txtR.Bind( wx.EVT_KEY_DOWN, self.myLerKey )
	
	def __del__( self ):
		pass
	
	
	# Virtual event handlers, overide them in your derived class
	def cboPortas_LostFocus( self, event ):
		event.Skip()
	
	def myH1( self, event ):
		event.Skip()
	
	def myH2( self, event ):
		event.Skip()
	
	def myV11( self, event ):
		event.Skip()
	
	def myV12( self, event ):
		event.Skip()
	
	def myV21( self, event ):
		event.Skip()
	
	def myV22( self, event ):
		event.Skip()
	
	def myPinca( self, event ):
		event.Skip()
	
	def myFecha( self, event ):
		event.Skip()
	
	def myLerKey( self, event ):
		event.Skip()
	

