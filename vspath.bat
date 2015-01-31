@echo off

set cap= A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
set op=%1
for %%i in (%cap%) do call set op=%%op:%%i=%%i%%

if "%HAS_SET_VCPATH%"=="yes" goto end
	
set "HAS_SET_VCPATH=yes"

"d:\program files\vs2010\vc\bin\vcvars32.bat"

::if "%op%"=="-VC" "C:\Program Files\Microsoft Visual Studio\VC98\Bin\VCVARS32.BAT"
::if "%op%"=="-VS" "d:\program files\vs2010\vc\bin\vcvars32.bat"
::set path=C:\Program Files\Microsoft Visual Studio\COMMON\MSDev98\Bin;C:\Program Files\Microsoft Visual Studio\VC98\Bin;%path%

:end


