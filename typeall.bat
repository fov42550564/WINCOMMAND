@echo off & setlocal enabledelayedexpansion
tree /f "%cd%"
set/p=按enter逐个阅读文件 & pause<nul

for /r %%i in (*.bat *.c *.cpp *.h *.txt *.vbs *.js *.html *.htm *.hta) do (
	cls
	echo %%i
	echo;
	type "%%i"
	echo;
	set/p=按enter阅读下一个文件 & pause<nul
)
endlocal
exit
