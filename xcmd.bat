::author: fangyunjiang
@echo off

set dic=%1
if "%1"=="" (set dic="C:\Docume~1\Administrator\����")

start D:\"Program Files"\PowerCmd\PowerCmd.exe -P "%dic%"
