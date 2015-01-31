::author:fangyunjiang
@echo off
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::常量定义
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::农历数据
::1901-1910
set /a "lu_data[1901]=0x04AE53"
set /a "lu_data[1902]=0x0A5748"
set /a "lu_data[1903]=0x5526BD"
set /a "lu_data[1904]=0x0D2650"
set /a "lu_data[1905]=0x0D9544"
set /a "lu_data[1906]=0x46AAB9"
set /a "lu_data[1907]=0x056A4D"
set /a "lu_data[1908]=0x09AD42"
set /a "lu_data[1909]=0x24AEB6"
set /a "lu_data[1910]=0x04AE4A"
::1911-1920
set /a "lu_data[1911]=0x6A4DBE"
set /a "lu_data[1912]=0x0A4D52"
set /a "lu_data[1913]=0x0D2546"
set /a "lu_data[1914]=0x5D52BA"
set /a "lu_data[1915]=0x0B544E"
set /a "lu_data[1916]=0x0D6A43"
set /a "lu_data[1917]=0x296D37"
set /a "lu_data[1918]=0x095B4B"
set /a "lu_data[1919]=0x749BC1"
set /a "lu_data[1920]=0x049754"
::1921-1930
set /a "lu_data[1921]=0x0A4B48"
set /a "lu_data[1922]=0x5B25BC"
set /a "lu_data[1923]=0x06A550"
set /a "lu_data[1924]=0x06D445"
set /a "lu_data[1925]=0x4ADAB8"
set /a "lu_data[1926]=0x02B64D"
set /a "lu_data[1927]=0x095742"
set /a "lu_data[1928]=0x2497B7"
set /a "lu_data[1929]=0x04974A"
set /a "lu_data[1930]=0x664B3E"
::1931-1940
set /a "lu_data[1931]=0x0D4A51"
set /a "lu_data[1932]=0x0EA546"
set /a "lu_data[1933]=0x56D4BA"
set /a "lu_data[1934]=0x05AD4E"
set /a "lu_data[1935]=0x02B644"
set /a "lu_data[1936]=0x393738"
set /a "lu_data[1937]=0x092E4B"
set /a "lu_data[1938]=0x7C96BF"
set /a "lu_data[1939]=0x0C9553"
set /a "lu_data[1940]=0x0D4A48"
::1941-1950
set /a "lu_data[1941]=0x6DA53B"
set /a "lu_data[1942]=0x0B554F"
set /a "lu_data[1943]=0x056A45"
set /a "lu_data[1944]=0x4AADB9"
set /a "lu_data[1945]=0x025D4D"
set /a "lu_data[1946]=0x092D42"
set /a "lu_data[1947]=0x2C95B6"
set /a "lu_data[1948]=0x0A954A"
set /a "lu_data[1949]=0x7B4ABD"
set /a "lu_data[1950]=0x06CA51"
::1951-1960
set /a "lu_data[1951]=0x0B5546"
set /a "lu_data[1952]=0x555ABB"
set /a "lu_data[1953]=0x04DA4E"
set /a "lu_data[1954]=0x0A5B43"
set /a "lu_data[1955]=0x352BB8"
set /a "lu_data[1956]=0x052B4C"
set /a "lu_data[1957]=0x8A953F"
set /a "lu_data[1958]=0x0E9552"
set /a "lu_data[1959]=0x06AA48"
set /a "lu_data[1960]=0x7AD53C"
::1961-1970
set /a "lu_data[1961]=0x0AB54F"
set /a "lu_data[1962]=0x04B645"
set /a "lu_data[1963]=0x4A5739"
set /a "lu_data[1964]=0x0A574D"
set /a "lu_data[1965]=0x052642"
set /a "lu_data[1966]=0x3E9335"
set /a "lu_data[1967]=0x0D9549"
set /a "lu_data[1968]=0x75AABE"
set /a "lu_data[1969]=0x056A51"
set /a "lu_data[1970]=0x096D46"
::1971-1980
set /a "lu_data[1971]=0x54AEBB"
set /a "lu_data[1972]=0x04AD4F"
set /a "lu_data[1973]=0x0A4D43"
set /a "lu_data[1974]=0x4D26B7"
set /a "lu_data[1975]=0x0D254B"
set /a "lu_data[1976]=0x8D52BF"
set /a "lu_data[1977]=0x0B5452"
set /a "lu_data[1978]=0x0B6A47"
set /a "lu_data[1979]=0x696D3C"
set /a "lu_data[1980]=0x095B50"
::1981-1990
set /a "lu_data[1981]=0x049B45"
set /a "lu_data[1982]=0x4A4BB9"
set /a "lu_data[1983]=0x0A4B4D"
set /a "lu_data[1984]=0xAB25C2"
set /a "lu_data[1985]=0x06A554"
set /a "lu_data[1986]=0x06D449"
set /a "lu_data[1987]=0x6ADA3D"
set /a "lu_data[1988]=0x0AB651"
set /a "lu_data[1989]=0x093746"
set /a "lu_data[1990]=0x5497BB"
::1991-2000
set /a "lu_data[1991]=0x04974F"
set /a "lu_data[1992]=0x064B44"
set /a "lu_data[1993]=0x36A537"
set /a "lu_data[1994]=0x0EA54A"
set /a "lu_data[1995]=0x86B2BF"
set /a "lu_data[1996]=0x05AC53"
set /a "lu_data[1997]=0x0AB647"
set /a "lu_data[1998]=0x5936BC"
set /a "lu_data[1999]=0x092E50"
set /a "lu_data[2000]=0x0C9645"
::2001-2010
set /a "lu_data[2001]=0x4D4AB8"
set /a "lu_data[2002]=0x0D4A4C"
set /a "lu_data[2003]=0x0DA541"
set /a "lu_data[2004]=0x25AAB6"
set /a "lu_data[2005]=0x056A49"
set /a "lu_data[2006]=0x7AADBD"
set /a "lu_data[2007]=0x025D52"
set /a "lu_data[2008]=0x092D47"
set /a "lu_data[2009]=0x5C95BA"
set /a "lu_data[2010]=0x0A954E"
::2011-2020
set /a "lu_data[2011]=0x0B4A43"
set /a "lu_data[2012]=0x4B5537"
set /a "lu_data[2013]=0x0AD54A"
set /a "lu_data[2014]=0x955ABF"
set /a "lu_data[2015]=0x04BA53"
set /a "lu_data[2016]=0x0A5B48"
set /a "lu_data[2017]=0x652BBC"
set /a "lu_data[2018]=0x052B50"
set /a "lu_data[2019]=0x0A9345"
set /a "lu_data[2020]=0x474AB9"
::2021-2030
set /a "lu_data[2021]=0x06AA4C"
set /a "lu_data[2022]=0x0AD541"
set /a "lu_data[2023]=0x24DAB6"
set /a "lu_data[2024]=0x04B64A"
set /a "lu_data[2025]=0x69573D"
set /a "lu_data[2026]=0x0A4E51"
set /a "lu_data[2027]=0x0D2646"
set /a "lu_data[2028]=0x5E933A"
set /a "lu_data[2029]=0x0D534D"
set /a "lu_data[2030]=0x05AA43"
::2031-2040
set /a "lu_data[2031]=0x36B537"
set /a "lu_data[2032]=0x096D4B"
set /a "lu_data[2033]=0xB4AEBF"
set /a "lu_data[2034]=0x04AD53"
set /a "lu_data[2035]=0x0A4D48"
set /a "lu_data[2036]=0x6D25BC"
set /a "lu_data[2037]=0x0D254F"
set /a "lu_data[2038]=0x0D5244"
set /a "lu_data[2039]=0x5DAA38"
set /a "lu_data[2040]=0x0B5A4C"
::2041-2050
set /a "lu_data[2041]=0x056D41"
set /a "lu_data[2042]=0x24ADB6"
set /a "lu_data[2043]=0x049B4A"
set /a "lu_data[2044]=0x7A4BBE"
set /a "lu_data[2045]=0x0A4B51"
set /a "lu_data[2046]=0x0AA546"
set /a "lu_data[2047]=0x5B52BA"
set /a "lu_data[2048]=0x06D24E"
set /a "lu_data[2049]=0x0ADA42"
set /a "lu_data[2050]=0x355B37"
::2051-2060
set /a "lu_data[2051]=0x09374B"
set /a "lu_data[2052]=0x8497C1"
set /a "lu_data[2053]=0x049753"
set /a "lu_data[2054]=0x064B48"
set /a "lu_data[2055]=0x66A53C"
set /a "lu_data[2056]=0x0EA54F"
set /a "lu_data[2057]=0x06B244"
set /a "lu_data[2058]=0x4AB638"
set /a "lu_data[2059]=0x0AAE4C"
set /a "lu_data[2060]=0x092E42"
::2061-2070
set /a "lu_data[2061]=0x3C9735"
set /a "lu_data[2062]=0x0C9649"
set /a "lu_data[2063]=0x7D4ABD"
set /a "lu_data[2064]=0x0D4A51"
set /a "lu_data[2065]=0x0DA545"
set /a "lu_data[2066]=0x55AABA"
set /a "lu_data[2067]=0x056A4E"
set /a "lu_data[2068]=0x0A6D43"
set /a "lu_data[2069]=0x452EB7"
set /a "lu_data[2070]=0x052D4B"
::2071-2080
set /a "lu_data[2071]=0x8A95BF"
set /a "lu_data[2072]=0x0A9553"
set /a "lu_data[2073]=0x0B4A47"
set /a "lu_data[2074]=0x6B553B"
set /a "lu_data[2075]=0x0AD54F"
set /a "lu_data[2076]=0x055A45"
set /a "lu_data[2077]=0x4A5D38"
set /a "lu_data[2078]=0x0A5B4C"
set /a "lu_data[2079]=0x052B42"
set /a "lu_data[2080]=0x3A93B6"
::2081-2090
set /a "lu_data[2081]=0x069349"
set /a "lu_data[2082]=0x7729BD"
set /a "lu_data[2083]=0x06AA51"
set /a "lu_data[2084]=0x0AD546"
set /a "lu_data[2085]=0x54DABA"
set /a "lu_data[2086]=0x04B64E"
set /a "lu_data[2087]=0x0A5743"
set /a "lu_data[2088]=0x452738"
set /a "lu_data[2089]=0x0D264A"
set /a "lu_data[2090]=0x8E933E"
::2091-2100
set /a "lu_data[2091]=0x0D5252"
set /a "lu_data[2092]=0x0DAA47"
set /a "lu_data[2093]=0x66B53B"
set /a "lu_data[2094]=0x056D4F"
set /a "lu_data[2095]=0x04AE45"
set /a "lu_data[2096]=0x4A4EB9"
set /a "lu_data[2097]=0x0A4D4C"
set /a "lu_data[2098]=0x0D1541"
set /a "lu_data[2099]=0x2D92B5"
set /a "lu_data[2100]=0x0D5349"

::月份名字
set "lum_name[0]=正"
set "lum_name[1]=二"
set "lum_name[2]=三"
set "lum_name[3]=四"
set "lum_name[4]=五"
set "lum_name[5]=六"
set "lum_name[6]=七"
set "lum_name[7]=八"
set "lum_name[8]=九"
set "lum_name[9]=十"
set "lum_name[10]=冬"
set "lum_name[11]=腊"

::天数名字
set "lud_name[1]=初一"
set "lud_name[2]=初二"
set "lud_name[3]=初三"
set "lud_name[4]=初四"
set "lud_name[5]=初五"
set "lud_name[6]=初六"
set "lud_name[7]=初七"
set "lud_name[8]=初八"
set "lud_name[9]=初九"
set "lud_name[10]=初十"
set "lud_name[11]=十一"
set "lud_name[12]=十二"
set "lud_name[13]=十三"
set "lud_name[14]=十四"
set "lud_name[15]=十五"
set "lud_name[16]=十六"
set "lud_name[17]=十七"
set "lud_name[18]=十八"
set "lud_name[19]=十九"
set "lud_name[20]=二十"
set "lud_name[21]=廿一"
set "lud_name[22]=廿二"
set "lud_name[23]=廿三"
set "lud_name[24]=廿四"
set "lud_name[25]=廿五"
set "lud_name[26]=廿六"
set "lud_name[27]=廿七"
set "lud_name[28]=廿八"
set "lud_name[29]=廿九"
set "lud_name[30]=三十"

::天干
set "tiangan[0]=甲"
set "tiangan[1]=乙"
set "tiangan[2]=丙"
set "tiangan[3]=丁"
set "tiangan[4]=戊"
set "tiangan[5]=己"
set "tiangan[6]=庚"
set "tiangan[7]=辛"
set "tiangan[8]=壬"
set "tiangan[9]=癸"

::地址
set "dizhi[0]=子"
set "dizhi[1]=丑"
set "dizhi[2]=寅"
set "dizhi[3]=卯"
set "dizhi[4]=辰"
set "dizhi[5]=巳"
set "dizhi[6]=午"
set "dizhi[7]=未"
set "dizhi[8]=申"
set "dizhi[9]=酉"
set "dizhi[10]=戌"
set "dizhi[11]=亥"

::属相
set "shuxiang[0]=鼠"
set "shuxiang[1]=牛"
set "shuxiang[3]=虎"
set "shuxiang[4]=兔"
set "shuxiang[5]=龙"
set "shuxiang[6]=蛇"
set "shuxiang[7]=马"
set "shuxiang[8]=羊"
set "shuxiang[9]=猴"
set "shuxiang[10]=鸡"
set "shuxiang[11]=狗"
set "shuxiang[12]=猪"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::主体部分
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::init 初始化变量
set "year=%1"
set "month=%2"
set "day=%3"

set "blank=    "
set "lu_blank=　"
set /a "blank_len=6"
set /a "lu_blank_len=3"
set /a "blank_lens=%blank_len%*7"
set /a "lu_blank_lens=%lu_blank_len%*7"

set "title_dot_line=*****************************************"
set "title=周日%lu_blank%周一%lu_blank%周二%lu_blank%周三%lu_blank%周四%lu_blank%周五%lu_blank%周六"
set "monthname=January February March April May June July August September October November December"
set "monthname1=           *   January  *                                *   February  *"
set "monthname2=           *   March    *                                *   April     *"
set "monthname3=           *    May     *                                *    June     *"
set "monthname4=           *   July     *                                *   August    *"
set "monthname5=           *  September *                                *   October   *"
set "monthname6=           *  November  *                                *  December   *"
set    "dotline=           **************                                ***************"

::main progress 过程处理
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


::function showNowCal
::显示本日的日历
:showNowCal
setlocal enabledelayedexpansion
set "year=%date:~0,4%"
set "month_h=%date:~5,1%"
set "month_h=%month_h:0=%"
set "month=%month_h%%date:~6,1%"
set "day_h=%date:~8,1%"
set "day_h=%date_h:0=%"
set "day=%day_h%%date:~9,1%"
call :showMonthCal %year% %month% %day%
endlocal & goto :EOF
::end function



::function showMonthCal
::显示月的日历
:showMonthCal
setlocal enabledelayedexpansion
set "year=%1"
set "month=%2"
if "%3"=="" ( set "day=-1" ) else ( set "day=%3" )
set "monthtitle=     "
for /f "tokens=%month% delims= " %%i in ("%monthname%") do set "monthtitle=!monthtitle!%%i  %year%  "
call :GET_LUNAR %year% %month% 1 ly null null null null
call :GET_LUNAR_YEAR_NAME %ly% lu_year shuxiang

echo *****************************************
echo *%monthtitle%   %lu_year%年  %shuxiang%          *
echo %title_dot_line%
echo %title%
echo %title_dot_line%


call :getDaysList %year% %month% %day% dayslist max w
call :GET_LUNAR_LIST %year% %month%-1 %max% %w% lu_list

for /l %%a in (1 1 6) do (
   set "check="
   for /f "delims= " %%k in ("!dayslist!") do set "check=1"
   if defined check (
   	echo !dayslist:~0,%blank_lens%!
   	echo !lu_list:~0,%lu_blank_lens%!
   	
   	set "dayslist=!dayslist:~%blank_lens%!"
   	set "lu_list=!lu_list:~%lu_blank_lens%!"
   ) else (
   	echo.
   )
)
endlocal & goto :EOF
::end function



::function showYearCal
::显示全年的日历
:showYearCal
setlocal enabledelayedexpansion
set "year=%1"
call :GET_LUNAR_YEAR_NAME %1 lu_year shuxiang
echo.
echo ***************************************************************************************
echo *                              %year% %lu_year%年   %shuxiang%                                       *
echo ***************************************************************************************

for /l %%a in (1 1 6) do (
	set /a "first=(%%a-1)*2+1"
	set /a "last=%%a*2"
	set "index=1"
	for /l %%i in (!first! 1 !last!) do (
		call :getDaysList %year% %%i -1 dayslist!index! max!index! w!index!
		call :GET_LUNAR_LIST %year% %%i-1 %%max!index!%% %%w!index!%% lu_list!index!
		call,set /a lu_blank_lens_first!index!=%%w!index!%%*%blank_len%+%lu_blank_len%*^(7-%%w!index!%%^)
		set /a "index=!index!+1"
	)
	
	echo.
	echo %dotline%
	echo !monthname%%a!
	echo %title_dot_line%     %title_dot_line%
	echo %title%     %title% 
	echo %title_dot_line%     %title_dot_line%
	for /l %%a in (1 1 6) do (
	   set "check="
	   set "dayslist=!dayslist1:~0,%blank_lens%!   !dayslist2:~0,%blank_lens%!"
	   set "dayslist1=!dayslist1:~%blank_lens%!"
	   set "dayslist2=!dayslist2:~%blank_lens%!"
	   
	   set "lu_list=!lu_list1:~0,%lu_blank_lens%!   !lu_list2:~0,%lu_blank_lens%!"
	   set "lu_list1=!lu_list1:~%lu_blank_lens%!"
	   set "lu_list2=!lu_list2:~%lu_blank_lens%!"
	   
	   for /f "delims= " %%k in ("!dayslist!") do set "check=1"
	   if defined check (
	   		echo !dayslist!
				echo !lu_list!
	   ) else (
				echo.
	   )
	)
)
endlocal & goto :EOF
::end function



::function getDaysList
::获取天数列表
:getDaysList
set "y=%1"
set "m=%2"
set "month=%2"
set "day=%3"

set /a "leap=(^!(%y%%%4)&(^!^!(%y%%%100)))|(^!(%y%%%400))+28"
set "months=31 %leap% 31 30 31 30 31 31 30 31 30 31"

if %m% leq 2 (
set /a y=%y%-1
set /a m=%m%+12
)

set "dayslist="
set /a w=(%y%/100/4-%y%/100*2+%y%%%100+%y%%%100/4+13*(%m%+1)/5)%%7
set /a w=(%w%+7)%%7

setlocal enabledelayedexpansion

for /f "tokens=%month% delims= " %%a in ("%months%") do set "maxdays=%%a"
for /l %%a in (1 1 %w%) do set "cell=          " & set "dayslist=!dayslist!!cell:~-%blank_len%!"
for /l %%i in (1 1 %maxdays%) do (
   if %day% EQU %%i (
      set "cell=(%%i)        " 
   ) else (
      set "cell=%%i        " 
   )
set "dayslist=!dayslist!!cell:~0,%blank_len%!"
)
set "dayslist=%dayslist%                                                               "
endlocal & set %4=%dayslist% & set /a %5=%maxdays% & set /a %6=%w% & goto :EOF
::end function

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::农历函数部分
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::function GET_LUNAR
::计算农历
:GET_LUNAR
setlocal enabledelayedexpansion

set /a data=!lu_data[%1]!
set /a ly=%1
set /a yy=%1
set /a lm=0
set /a mm=%2
set /a dd=%3
set /a leap_month=%data% ^>^> 20
set /a zm=((%data%^>^>5)^&0x3)-1
set /a zd=%data%^&0x1f
set /a day=0

call :SUB_OF_YEAR %ly% %zm% %zd% %mm% %dd% day

if %day% EQU -1 (
	set /a ly-=1
	call, set /a data=%%lu_data[!ly!]%%
	set /a leap_month=!data!^>^>20
	set /a zm=^(^(!data!^>^>5^)^&0x3^)-1
	set /a zd=!data!^&0x1f
	call :SUB_OF_YEAR !ly! !zm! !zd! 11 31 day
	call :SUB_OF_YEAR !yy! 0 1 %mm% %dd% day1
	set /a day=!day!+!day1!
)
set /a ld=%day%
for /l %%i in (1,1,13) do (
	set /a lu_tag=^(!data!^>^>7^)^&^(1^<^<^(13-%%i^)^)
	if !lu_tag! GTR 0  (set /a lmd=30) else (set /a lmd=29)
	if  !ld! GTR !lmd! (
		set /a ld-=!lmd!
		set /a lm+=1
	) else (
		set /a max=!lmd!
		goto :END_FOR
	)
)
:END_FOR

if %leap_month% GTR 0 (
	if %lm% GTR %leap_month% (
		set /a lm-=1
	)
)


::echo lu: %ly%  %lm% %ld% %max%

 endlocal & set /a %4=%ly%  & set /a %5=%lm% & set /a %6=%ld% & set /a %7=%max% &  goto :EOF
::end function


::function SUB_OF_YEAR 
::计算时间差
:SUB_OF_YEAR
set /a y=%1
set /a m1=%2
set /a d1=%3
set /a m2=%4
set /a d2=%5
if %m1% GTR %m2% (
	set /a %6=-1
	goto :EOF
)
if %m1% EQU %m2% (
	if %d1% GTR %d2% (
		set /a %6=-1
		goto :EOF
	)
)

setlocal enabledelayedexpansion
set /a "leap=(^!(%y%%%4)&(^!^!(%y%%%100)))|(^!(%y%%%400))+28"

set /a months[0]=31
set /a months[1]=%leap%
set /a months[2]=31
set /a months[3]=30
set /a months[4]=31
set /a months[5]=30
set /a months[6]=31
set /a months[7]=31
set /a months[8]=30
set /a months[9]=31
set /a months[10]=30
set /a months[11]=31

set /a mm1=%m1%
set /a mm2=%m2%-1
set /a dd=0
for /l %%a in (%mm1%, 1, %mm2%) do (
	set /a dd+=!months[%%a]!
)

set /a dd+=%d2%-%d1%+1

endlocal & set /a %6=%dd% & goto :EOF
::end function


::function GET_LUNAR_LIST
::获取农历列表
:GET_LUNAR_LIST
set /a gll_y=%1
set /a gll_m=%2
set /a gll_d=1
set /a gll_max=%3
set /a gll_w=%4
set "lunar_list="

setlocal enabledelayedexpansion
for /l %%a in (1 1 %gll_w%) do set "cell=%lu_blank%%lu_blank%%lu_blank%" & set "lunar_list=!lunar_list!!cell:~-%lu_blank_len%!"
:LOOP
call :GET_LUNAR %gll_y% %gll_m% %gll_d%  gll_ly  gll_lm  gll_ld  gll_lmax
set "lud_name[1]=!lum_name[%gll_lm%]!月"

set /a gll_lsub=gll_lmax-gll_ld+1
if %gll_lsub% LSS %gll_max% (
	for /l %%i in (%gll_ld%,1, %gll_lmax%) do (
		call, set "lunar_list=!lunar_list!%%lud_name[%%i]%%%lu_blank%"
	)
	set /a gll_max-=%gll_lsub%
	set /a gll_d+=%gll_lsub%
	if gll_max GTR 0 goto :LOOP
) else (
	for /l %%i in (%gll_ld%,1, %gll_max%) do (
		call, set "lunar_list=!lunar_list!%%lud_name[%%i]%%%lu_blank%"
	)
)
set "lunar_list=%lunar_list%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%%lu_blank%"
endlocal & set %5=%lunar_list%  & goto :EOF
::end function


::function GET_LUNAR_YEAR_NAME
:GET_LUNAR_YEAR_NAME
set /a lu_y=%1
set /a jiazi=(%lu_y%-4)%%60
set /a tiangan=jiazi%%10
set /a dizhi=jiazi%%12
call, set "%2=%%tiangan[%tiangan%]%%%%dizhi[%dizhi%]%%" & call, set "%3=%%shuxiang[%dizhi%]%%"
::end function


