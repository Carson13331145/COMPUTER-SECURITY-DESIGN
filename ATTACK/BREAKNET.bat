@echo off

for /F "skip=3 tokens=4,5,6,7,8,9,10 delims= " %%a in ('netsh interface show interface') do (
	echo breaking network : %%a %%b %%c %%d %%e %%f %%g ......
	netsh interface set interface "%%a" disabled
	netsh interface set interface "%%a %%b" disabled
	netsh interface set interface "%%a %%b %%c" disabled
	netsh interface set interface "%%a %%b %%c %%d" disabled
	netsh interface set interface "%%a %%b %%c %%d %%e" disabled
	netsh interface set interface "%%a %%b %%c %%d %%e %%f" disabled
	netsh interface set interface "%%a %%b %%c %%d %%e %%f %%g" disabled
)

pause>nul
