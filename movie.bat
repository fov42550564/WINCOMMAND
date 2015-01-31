::author: fangyunjiang
@echo off

set cap= A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
set op=%1

for %%i in (%cap%) do call set op=%%op:%%i=%%i%%
if "%op%"=="--HELP" type C:\COMMAND\movie.bat
if "%op%"=="--ON" (
subst O: F:\recycled\ÀΩ”–µÁ”∞
start O:\
)
if "%op%"=="--OFF" subst O: /D
