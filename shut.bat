::author: fangyunjiang
@echo off
if "%1"=="no" (shutdown -a) else (
if "%1"=="rs" (shutdown -r) else (
shutdown -s -f -t %1
)
)
::pause
