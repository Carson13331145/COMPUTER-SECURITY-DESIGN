@echo off
echo Matching...
for /f "tokens=1*" %%b in (VResultPCIP.txt) do (
	nbtstat -a %%b >> MResult.txt
)
echo Complete matching...
