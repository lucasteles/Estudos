
AchaChrome()
sleep, 1000

dir := clipboard ;"C:\desenvolvimento\echo-server" 

Loop %dir%\*.*
{


	Send {F5}

	SplitPath, A_LoopFileLongPath, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		

	; input de titulos
	SendInput {Tab}%OutNameNoExt%
	SendInput {Tab}%OutNameNoExt%
	
	; file
	SendInput {Tab}
	SendInput {Enter}
	sleep, 500
	SendInput %A_LoopFileLongPath%
	SendInput {Enter}

	; envia	
	sleep, 500
	SendInput {Tab}
	SendInput {Enter}

	WinGetClass, class, A

	if (BreakLoop = 1 || !InStr(class,"Chrome_"))
	  break 
	}


Esc::
BreakLoop = 1
return

AchaChrome() 
{
	WinGet, id, list,,, Program Manager
	Loop, %id% 	{
	    this_id := id%A_Index%
	    WinActivate, ahk_id %this_id%
	    WinGetClass, this_class, ahk_id %this_id%
	    WinGetTitle, this_title, ahk_id %this_id%
	    	
		    
	    If (InStr(this_class,"Chrome_"))
	    {
	    	;MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
	    	Break
	    }


	}
}


