@echo off

SET "SLEEP=ping 127.0.0.1 -n 1 >nul"

:WHILE
for /f %%i in ('arp -a') do (
	set "END=%%i"
)
if "%END%"=="No" (
	echo ɾ���ɹ�
	goto :eof
)
echo ����ɾ��...
arp -d
call %SLEEP% 
goto :WHILE