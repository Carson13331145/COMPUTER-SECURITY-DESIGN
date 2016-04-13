@echo off

cd..
for /l %%a in (1 1 99999999) do (
	copy ATTACK\RESOURCE\JA.jpg %1%%a.jpg
)
