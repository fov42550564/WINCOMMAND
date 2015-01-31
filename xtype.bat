::author: fangyunjiang
@echo off & setlocal enabledelayedexpansion

set /a "index=0"
for /r %%i in (*.bat *.c *.cpp *.h *.txt *.vbs *.js *.html *.htm *.hta) do (
	set "files[!index!]=%%i"
	set /a index+=1
)

set /a index-=1

call :typeFile
goto :EOF


::function showFile
:showFile
echo *********************************************
for /l %%i in (0, 1, %index%) do (
	echo * %%i : !files[%%i]!
)
echo *********************************************
goto :EOF	
::end function


::function typeFile
:typeFile
	call :showFile
	set /p "si=input the index file to type, quit(q):"
	if %si%==q goto :EOF
	type !files[%si%]!
	pause
	goto typeFile
::end function
endlocal & goto :EOF
