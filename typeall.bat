@echo off & setlocal enabledelayedexpansion
tree /f "%cd%"
set/p=��enter����Ķ��ļ� & pause<nul

for /r %%i in (*.bat *.c *.cpp *.h *.txt *.vbs *.js *.html *.htm *.hta) do (
	cls
	echo %%i
	echo;
	type "%%i"
	echo;
	set/p=��enter�Ķ���һ���ļ� & pause<nul
)
endlocal
exit
