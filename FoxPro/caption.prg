DO decl
 
#DEFINE SW_SHOWNORMAL        1
#DEFINE GWL_USERDATA       -21
#DEFINE ccCustomTitle      "Calc DO TELES"
 
LOCAL hCalc, lnCounter
 
* retrieve window hanlde to Windows Calculadora
hCalc = GetCalcWinHandle()
 
* change the text of the title bar
= SetWindowText (hCalc, ccCustomTitle)
 
* retrieve the user data associated with the window
lnCounter = GetWindowLong (hCalc, GWL_USERDATA)
 
* increment value
lnCounter = lnCounter + 1
? "User-data value:", lnCounter
 
* set it back
? SetWindowLong (hCalc, GWL_USERDATA, lnCounter)  && optional value
 
FUNCTION  GetCalcWinHandle
    LOCAL hwnd
    hwnd = FindWindow (.NULL., ccCustomTitle)
    IF hwnd = 0
    * start the Calculadora if not found
        = WinExec ("calc.exe", SW_SHOWNORMAL)
        hwnd = FindWindow (.NULL., "Calculadora")
    ENDIF
RETURN hwnd
 
PROCEDURE  decl
    DECLARE INTEGER SetWindowLong IN user32;
        INTEGER hWnd, INTEGER nIndex, INTEGER dwNewLong
 
    DECLARE INTEGER FindWindow IN user32;
        STRING lpClassName, STRING lpWindowName
 
    DECLARE INTEGER GetWindowLong IN user32;
        INTEGER hWnd, INTEGER nIndex
 
    DECLARE INTEGER WinExec IN kernel32;
        STRING  lpCmdLine, INTEGER nCmdShow
 
    DECLARE INTEGER SetWindowText IN user32;
        INTEGER hWnd, STRING lpString
 
