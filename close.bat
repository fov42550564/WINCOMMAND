::author: fangyunjiang
@echo off
set cap= A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
set op=%1
for %%i in (%cap%) do call set op=%%op:%%i=%%i%%
if "%op%"=="QQ" taskkill /f /im QQ.exe
if "%op%"=="FX" taskkill /f /im Fetion.exe
if "%op%"=="MS" ctaskkill /f /im KwMusic.exe
if "%op%"=="XYJ" taskkill /f /im xyjonline.exe
if "%op%"=="HF" taskkill /f /im GameClient.exe
if "%op%"=="PPS" taskkill /f /im PPStream.exe
if "%op%"=="MV" taskkill /f /im QQPlayer.exe
if "%op%"=="XL" taskkill /f /im Thunder.exe
if "%op%"=="VBS" taskkill /f /im wscript.exe
if "%1"=="" taskkill /f /im explorer.exe & start explorer.exe
if "%op%"=="ALLWIN" call closeall.vbs
if "%op%"=="ALLTASK" call closeallex.vbs
if "%op%"=="--HELP" type C:\COMMAND\close.bat
::pause
