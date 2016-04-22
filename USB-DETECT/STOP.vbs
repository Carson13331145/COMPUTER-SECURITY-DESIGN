CreateObject("wscript.shell").run _
    "reg delete ""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"" /v ""DOO"" "
createobject("scripting.filesystemobject").deletefile "D:\DETECT.vbs"
set ws= CreateObject("WScript.Shell")
ws.Run "taskkill /f /im DETECT.vbs", 0
ws.run "taskkill /f /im WScript.exe", hide
