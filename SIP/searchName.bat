@ECHO Off
Title Searching IP in the same network
:send
@ECHO off&setlocal enabledelayedexpansion 

ECHO Getting ip and name, please wait... 
(ECHO Getting IP, please wait... ) >> VResult.txt
for /f "tokens=4 skip=2 delims=: " %%i in ('nbtstat -n') do ( 
set "IP=%%i"
set IP=!IP:~1,-1!
ECHO Local Ip: !IP!
(ECHO Local Ip: !IP! ) >> VResult.txt
goto :next 
)

:next 
for /f "delims=. tokens=1,2,3,4" %%i in ("%IP%") do (
	set "range=%%i.%%j.%%k"
)
ECHO.&ECHO Getting PC-name in the same network, please wait...
(ECHO.&ECHO Getting PC-name in the same network, please wait...) >> VResult.txt 
(ECHO This network segment [!range!.*] has PC: ) >> VResult.txt
for /f "delims=" %%i in ('net view') do ( 
set "var=%%i" 
::Search online PC-name
if "!var:~0,2!"=="\\" ( 
set "var=!var:~2!" 
(ECHO !var! ) >> VResult.txt
(ECHO !var!) >> VResultPCN.txt
ping -n 1 !var!>nul 
)) 
(ECHO.) >> VResult.txt
ECHO Getting PC-IP in the same network, please wait... 
(ECHO Getting PC-IP in the same network, please wait... ) >> VResult.txt
for /f "skip=3 tokens=1,* delims= " %%i in ('arp -a') do (
	(ECHO IP: %%i is being using) >> VResult.txt
	(ECHO %%i) >> VResultPCIP.txt
)

(ECHO.) >> VResult.txt
ECHO Searching over, enter to quit...
(ECHO Searching over, enter to quit...) >> VResult.txt
