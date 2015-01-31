::author: fangyunjiang
@echo off

if not "%path:~-12%"=="D:\linux\bin" (
	set path=%path%;D:\linux\bin
)

set flag=%1

set or=0 & if "%flag%"=="" set /a or+=1
if "%flag%"=="-c" set /a or+=1
if %or% geq 1 (

set r1[0]=¨€¨€¨€
set r2[0]=¨€  ¨€
set r3[0]=¨€  ¨€
set r4[0]=¨€  ¨€
set r5[0]=¨€  ¨€
set r6[0]=¨€  ¨€
set r7[0]=¨€¨€¨€


set r1[1]=  ¨€  
set r2[1]=  ¨€  
set r3[1]=  ¨€  
set r4[1]=  ¨€  
set r5[1]=  ¨€  
set r6[1]=  ¨€  
set r7[1]=  ¨€  


set r1[2]=¨€¨€¨€
set r2[2]=    ¨€
set r3[2]=    ¨€
set r4[2]=¨€¨€¨€
set r5[2]=¨€    
set r6[2]=¨€    
set r7[2]=¨€¨€¨€


set r1[3]=¨€¨€¨€
set r2[3]=    ¨€
set r3[3]=    ¨€
set r4[3]=¨€¨€¨€
set r5[3]=    ¨€
set r6[3]=    ¨€
set r7[3]=¨€¨€¨€


set r1[4]=¨€  ¨€
set r2[4]=¨€  ¨€
set r3[4]=¨€  ¨€
set r4[4]=¨€¨€¨€
set r5[4]=    ¨€
set r6[4]=    ¨€
set r7[4]=    ¨€


set r1[5]=¨€¨€¨€
set r2[5]=¨€    
set r3[5]=¨€    
set r4[5]=¨€¨€¨€
set r5[5]=    ¨€
set r6[5]=    ¨€
set r7[5]=¨€¨€¨€


set r1[6]=¨€¨€¨€
set r2[6]=¨€    
set r3[6]=¨€    
set r4[6]=¨€¨€¨€
set r5[6]=¨€  ¨€
set r6[6]=¨€  ¨€
set r7[6]=¨€¨€¨€


set r1[7]=¨€¨€¨€
set r2[7]=¨€  ¨€
set r3[7]=    ¨€
set r4[7]=    ¨€
set r5[7]=    ¨€
set r6[7]=    ¨€
set r7[7]=    ¨€


set r1[8]=¨€¨€¨€
set r2[8]=¨€  ¨€
set r3[8]=¨€  ¨€
set r4[8]=¨€¨€¨€
set r5[8]=¨€  ¨€
set r6[8]=¨€  ¨€
set r7[8]=¨€¨€¨€


set r1[9]=¨€¨€¨€
set r2[9]=¨€  ¨€
set r3[9]=¨€  ¨€
set r4[9]=¨€¨€¨€
set r5[9]=    ¨€
set r6[9]=    ¨€
set r7[9]=¨€¨€¨€

) else (

set r1[0]=   ¨€¨€   
set r2[0]= ¨€    ¨€ 
set r3[0]= ¨€    ¨€ 
set r4[0]= ¨€    ¨€ 
set r5[0]= ¨€    ¨€ 
set r6[0]= ¨€    ¨€ 
set r7[0]=   ¨€¨€   


set r1[1]=    ¨€    
set r2[1]=  ¨€¨€    
set r3[1]=    ¨€    
set r4[1]=    ¨€    
set r5[1]=    ¨€    
set r6[1]=    ¨€    
set r7[1]= ¨€¨€¨€¨€ 


set r1[2]=   ¨€¨€   
set r2[2]= ¨€    ¨€ 
set r3[2]=       ¨„ 
set r4[2]=      ¨€  
set r5[2]=    ¨€    
set r6[2]=  ¨€      
set r7[2]= ¨€¨€¨€¨€ 


set r1[3]=   ¨€¨€   
set r2[3]= ¨€    ¨€ 
set r3[3]=      ¨€  
set r4[3]=    ¨€    
set r5[3]=      ¨€  
set r6[3]= ¨€    ¨€ 
set r7[3]=   ¨€¨€   

  
set r1[4]=    ¨€¨„  
set r2[4]=   ¨€¨€   
set r3[4]=  ¨€ ¨€   
set r4[4]= ¨€  ¨€   
set r5[4]=¨€¨€¨€¨€¨€
set r6[4]=     ¨€   
set r7[4]=     ¨€   


set r1[5]=    ¨€¨€¨€
set r2[5]=  ¨€      
set r3[5]=  ¨€      
set r4[5]=    ¨€¨€¨„
set r5[5]=        ¨€
set r6[5]=        ¨€
set r7[5]=  ¨€¨€¨€¨„


set r1[6]=     ¨€   
set r2[6]=   ¨€     
set r3[6]=  ¨€      
set r4[6]= ¨€ ¨€¨ƒ  
set r5[6]= ¨„    ¨€ 
set r6[6]= ¨€    ¨€ 
set r7[6]=  ¨€¨€¨€  


set r1[7]= ¨€¨€¨€¨€ 
set r2[7]=        ¨€
set r3[7]=       ¨€ 
set r4[7]=      ¨€  
set r5[7]=     ¨€   
set r6[7]=    ¨€    
set r7[7]=   ¨€     


set r1[8]=   ¨€¨€   
set r2[8]= ¨€    ¨€ 
set r3[8]= ¨€    ¨€ 
set r4[8]=   ¨€¨€   
set r5[8]= ¨€    ¨€ 
set r6[8]= ¨€    ¨€ 
set r7[8]=   ¨€¨€   


set r1[9]=   ¨€¨€   
set r2[9]= ¨€    ¨€ 
set r3[9]= ¨€    ¨€ 
set r4[9]=   ¨€¨€   
set r5[9]=       ¨€ 
set r6[9]=       ¨€ 
set r7[9]= ¨€¨€¨€   

)

set "domt1=  "
set "domt2=  "
set "domt3=¨€"
set "domt4=  "
set "domt5=  "
set "domt6=¨€"
set "domt7=  "

call :SHOWLIVETIME
set path=%path:~0,-13%
goto :EOF


::function SHOWLIVETIME
:SHOWLIVETIME
cls
call :SHOWTIME
::ping -n 2 127.0.0.1>nul
sleep 1
call :SHOWLIVETIME
:goto :EOF
::end function


::function SHOWTIME
:SHOWTIME
setlocal enabledelayedexpansion

set num1=%time:~0,1%
set num2=%time:~1,1%
set num3=%time:~3,1%
set num4=%time:~4,1%
set num5=%time:~6,1%
set num6=%time:~7,1%


set or=0 & if "%flag%"=="-ac" set /a or+=1 
if "%flag%"=="-c" set /a or+=1 
if %or% geq 1 (
printf "\e[32m!r1[%num1%]! !r1[%num2%]!\e[0m !domt1! \e[33m!r1[%num3%]! !r1[%num4%]!\e[0m !domt1! \e[34m!r1[%num5%]! !r1[%num6%]!\e[0m\n\e[32m!r2[%num1%]! !r2[%num2%]!\e[0m !domt2! \e[33m!r2[%num3%]! !r2[%num4%]!\e[0m !domt2! \e[34m!r2[%num5%]! !r2[%num6%]!\e[0m\n\e[32m!r3[%num1%]! !r3[%num2%]!\e[0m !domt3! \e[33m!r3[%num3%]! !r3[%num4%]!\e[0m !domt3! \e[34m!r3[%num5%]! !r3[%num6%]!\e[0m\n\e[32m!r4[%num1%]! !r4[%num2%]!\e[0m !domt4! \e[33m!r4[%num3%]! !r4[%num4%]!\e[0m !domt4! \e[34m!r4[%num5%]! !r4[%num6%]!\e[0m\n\e[32m!r5[%num1%]! !r5[%num2%]!\e[0m !domt5! \e[33m!r5[%num3%]! !r5[%num4%]!\e[0m !domt5! \e[34m!r5[%num5%]! !r5[%num6%]!\e[0m\n\e[32m!r6[%num1%]! !r6[%num2%]!\e[0m !domt6! \e[33m!r6[%num3%]! !r6[%num4%]!\e[0m !domt6! \e[34m!r6[%num5%]! !r6[%num6%]!\e[0m\n\e[32m!r7[%num1%]! !r7[%num2%]!\e[0m !domt7! \e[33m!r7[%num3%]! !r7[%num4%]!\e[0m !domt7! \e[34m!r7[%num5%]! !r7[%num6%]!\e[0m\n"

) else (
echo !r1[%num1%]! !r1[%num2%]! !domt1! !r1[%num3%]! !r1[%num4%]! !domt1! !r1[%num5%]! !r1[%num6%]!
echo !r2[%num1%]! !r2[%num2%]! !domt2! !r2[%num3%]! !r2[%num4%]! !domt2! !r2[%num5%]! !r2[%num6%]!
echo !r3[%num1%]! !r3[%num2%]! !domt3! !r3[%num3%]! !r3[%num4%]! !domt3! !r3[%num5%]! !r3[%num6%]!
echo !r4[%num1%]! !r4[%num2%]! !domt4! !r4[%num3%]! !r4[%num4%]! !domt4! !r4[%num5%]! !r4[%num6%]!
echo !r5[%num1%]! !r5[%num2%]! !domt5! !r5[%num3%]! !r5[%num4%]! !domt5! !r5[%num5%]! !r5[%num6%]!
echo !r6[%num1%]! !r6[%num2%]! !domt6! !r6[%num3%]! !r6[%num4%]! !domt6! !r6[%num5%]! !r6[%num6%]!
echo !r7[%num1%]! !r7[%num2%]! !domt7! !r7[%num3%]! !r7[%num4%]! !domt7! !r7[%num5%]! !r7[%num6%]!
)

endlocal & goto :EOF
::end function
