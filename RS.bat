::author: fangyunjiang
@echo off
set cap= A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
set op=%1
for %%i in (%cap%) do call set op=%%op:%%i=%%i%%
if "%op%"=="DM" regsvr32 DesktopMenu.dll
if "%op%"=="-DM" regsvr32 /u DesktopMenu.dll
if "%op%"=="MC" regsvr32 MenuColor.dll
if "%op%"=="-MC" regsvr32 /u MenuColor.dll
if "%op%"=="--help" cat c:/command/rs.bat