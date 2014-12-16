import wx
from MainFrame import MainFrame
import threading
import time
import serial
import sys

global app
global bt

bt = None

class Root(wx.App):
    def OnInit(self):
        self.m_frame = MainFrame(None)
        self.m_frame.Show()
        self.SetTopWindow(self.m_frame)
        return True

def ToArduino():
    global bt
    bt=None
    
    while True:
        cRet = ''
        for num in range(0,app.m_frame.Fila.qsize()):
            cRet = cRet + app.m_frame.Fila.get()

        
        if (cRet):
            try :
                if (not bt):
                    bt = serial.Serial(app.m_frame.cboPortas.GetValue(),9600)
                    
                bt.write(cRet.upper())
            except Exception:
                bt=None
                print("Erro na comunicacao serial")
                pass

app = Root(0)
thread = threading.Thread(target=ToArduino)
thread.start()

app.MainLoop()
thread.join()

if bt:
    bt.close()


    
