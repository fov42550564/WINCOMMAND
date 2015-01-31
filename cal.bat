::author:fangyunjiang
@echo off

::init 初始化变量
set "year=%1"
set "month=%2"
set "day=%3"

set "blank= "
set "title=Su%blank%Mo%blank%Tu%blank%We%blank%Th%blank%Fr%blank%Sa"
set "monthname=January February March April May June July August September October November December"
set "monthname1=       January               February                 March "
set "monthname2=        April                   May                   June "
set "monthname3=        July                  August                September"
set "monthname4=       October               November               December"


::progress 过程处理
if defined year (
if defined month (
if defined day (
call :showMonthCal %year% %month% %day%
) else (
call :showMonthCal %year% %month%
)
) else (
call :showYearCal %year%
)
) else (
call :showNowCal
)
goto :EOF


::显示本日的日历
:showNowCal
setlocal enabledelayedexpansion
set "year=%date:~0,4%"
set "month_h=%date:~5,1%"
set "month_h=%month_h:0=%"
set "month=%month_h%%date:~6,1%"
set "day_h=%date:~8,1%"
set "day_h=%day_h:0=%"
set "day=%day_h%%date:~9,1%"
call :showMonthCal %year% %month% %day%
endlocal & goto :EOF

::显示月的日历
:showMonthCal
setlocal enabledelayedexpansion
set "year=%1"
set "month=%2"
if "%3"=="" ( set "day=-1" ) else ( set "day=%3" )
set "monthtitle=     "
for /f "tokens=%month% delims= " %%i in ("%monthname%") do set "monthtitle=!monthtitle!%%i  %year%"
echo %monthtitle%

echo %title%
call :getDaysList %year% %month% %day% dayslist
for /l %%a in (1 1 6) do (
   set "check="
   for /f "delims= " %%k in ("!dayslist!") do set "check=1"
   if defined check (
   echo !dayslist:~0,21!
   ) else (
   echo.
   )
   set "dayslist=!dayslist:~21!"
)
endlocal & goto :EOF

::显示全年的日历
:showYearCal
setlocal enabledelayedexpansion
set "year=%1"
echo                                %year%
echo.

for /l %%a in (1 1 4) do (
set /a "first=(%%a-1)*3+1"
set /a "last=%%a*3"
set "index=1"
for /l %%i in (!first! 1 !last!) do (
call :getDaysList %year% %%i -1 dayslist!index!
set /a "index=!index!+1"
)
echo !monthname%%a!
echo %title%    %title%    %title%   
for /l %%a in (1 1 6) do (
   set "check="
   set "dayslist=!dayslist1:~0,21!   !dayslist2:~0,21!   !dayslist3:~0,21!"
   for /f "delims= " %%k in ("!dayslist!") do set "check=1"
   if defined check (
   echo !dayslist!
   ) else (
   echo.
   )
   set "dayslist1=!dayslist1:~21!"
   set "dayslist2=!dayslist2:~21!"
   set "dayslist3=!dayslist3:~21!"
)
)
endlocal & goto :EOF


::获取天数列表
:getDaysList
set "y=%1"
set "m=%2"
set "month=%2"
set "day=%3"

set /a "leap=(!(%y%%%4)&(!!(%y%%%100)))|(!(%y%%%400))+28"
set "months=31 %leap% 31 30 31 30 31 31 30 31 30 31"

if %m% leq 2 (
set /a y=%y%-1
set /a m=%m%+12
)

set "dayslist="
set /a w=(%y%/100/4-%y%/100*2+%y%%%100+%y%%%100/4+13*(%m%+1)/5)%%7
set /a gg=(%y%/100/4-%y%/100*2+%y%%%100+%y%%%100/4+13*(%m%+1)/5)
echo %gg%
echo %w%
echo ===
set /a w=(%w%+7)%%7

setlocal enabledelayedexpansion

for /f "tokens=%month% delims= " %%a in ("%months%") do set "maxdays=%%a"
for /l %%a in (1 1 %w%) do set "cell=    " & set "dayslist=!dayslist!!cell:~-3!"
for /l %%i in (1 1 %maxdays%) do (
   if %day% EQU %%i (
      set "cell=#%%i  " 
   ) else (
      set "cell=%%i  " 
   )
set "dayslist=!dayslist!!cell:~0,3!"
)
set "dayslist=%dayslist%                                                               "
endlocal & set %4=%dayslist% & goto :EOF




















