::author: fangyunjiang
@echo off

set "pwd=%cd%"
set "_path=%1"

set tag=%_path:~1,1%
if not "%tag%"==":" (
set "_path=%pwd%\%_path%"
)

nw E:\study\nodejs\node-webkit\nw-read %_path%
