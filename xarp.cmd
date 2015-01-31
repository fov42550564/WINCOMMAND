@echo off

SET "SLEEP=ping 127.0.0.1 -n 1 >nul"

:WHILE
for /f %%i in ('arp -a') do (
	set "END=%%i"
)
if "%END%"=="No" (
	echo 删除成功
	goto :eof
)
echo 正在删除...
arp -d
call %SLEEP% 
goto :WHILE