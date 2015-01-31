@echo off

set par[1]=%1
set par[2]=%2
set par[3]=%3
set par[4]=%4
set par[5]=%5
set par[6]=%6
set par[7]=%7
set par[8]=%8
set par[9]=%9

set include=D:\masm32\Include;%include%
set lib=D:\masm32\lib;%lib%
set "BUILD_DIR=D:\masm32"

call :MAIN
goto :EOF


:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
::function MAIN
:MAIN

call :GET_PARAMETERS EXEC -e
call :GET_PARAMETERS RC -rc
call :GET_PARAMETERS DLL -dll
call :GET_PARAMETERS TYPE -c
call :GET_PARAMETERS NODEBUG -nd
call :GET_PARAMETERS NOLINK -nl
call :GET_PARAMETERS FILE -name

if "%FILE%"=="0" goto :EOF

if "%FILE:~-4%"==".asm" (
set "FILE=%FILE:~0,-4%"
)

if "%TYPE%"=="1" (
	set "SUBSYSTEM=CONSOLE"
) else (
	set "SUBSYSTEM=WINDOWS"
)

if "%RC%"=="1" (
	%BUILD_DIR%\bin\rc.exe %FILE%.rc
	set "RES_FLAG=%FILE%.res"
) else (
	set "RES_FLAG="
)

if "%DLL%"=="1" (
	set "DLL_FLAG=/DLL /DEF:%FILE%.def"
	set "EXEC=0"
) else (
	set "DLL_FLAG="
)

if "%NODEBUG%"=="0" (
%BUILD_DIR%\bin\ml.exe /c /coff /Cp %FILE%.asm
if "%NOLINK%"=="0" (
%BUILD_DIR%\bin\link.exe %DLL_FLAG% /SUBSYSTEM:%SUBSYSTEM% /LIBPATH:%BUILD_DIR%\lib %FILE%.obj %RES_FLAG%
)
) else (
%BUILD_DIR%\bin\ml.exe /c /coff /Cp %FILE%.asm 1>nul 2>nul
if "%NOLINK%"=="0" (
%BUILD_DIR%\bin\link.exe %DLL_FLAG% /SUBSYSTEM:%SUBSYSTEM% /LIBPATH:%BUILD_DIR%\lib %FILE%.obj %RES_FLAG% 1>nul 2>nul
)
)

if "%NOLINK%"=="0" (
del /f /q %FILE%.obj %FILE%.res %FILE%.exp 2>nul
)

if "%EXEC%"=="1" (
	%FILE%.exe
)

goto :EOF
::end function
:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
::function GET_PARAMETERS
:GET_PARAMETERS
setlocal enabledelayedexpansion
set "par=0"
for /l %%a in (1 1 9) do (
  if not "!par[%%a]!"=="" (
		if "%2"=="-name" (
			if not "!par[%%a]:~0,1!"=="-" (
				set "par=!par[%%a]!"
				goto:END_FOR
		  ) 
		)else (
		  	if "!par[%%a]!"=="%2" (
		  		set "par=1"
		  		goto:END_FOR
		  	)
		)
	)
)
:END_FOR
endlocal & set "%1=%par%" & goto :EOF
::end function
:::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::