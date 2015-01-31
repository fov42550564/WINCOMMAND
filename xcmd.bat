::author: fangyunjiang
@echo off

set dic=%1
if "%1"=="" (set dic="C:\Docume~1\Administrator\×ÀÃæ")

start D:\"Program Files"\PowerCmd\PowerCmd.exe -P "%dic%"
