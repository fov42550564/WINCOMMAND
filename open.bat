::author: fangyunjiang
@echo off

SET "SLEEP=ping 127.0.0.1 -n 10 >nul"

set cap= A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
set op=%1
for %%i in (%cap%) do call set op=%%op:%%i=%%i%%
if "%1"=="" ( start /max explorer.exe %cd% 
) else (
if exist %1\ start /max explorer.exe %1\ &&goto :eof
)
if "%op%"=="QQ" start C:/Progra~1/Tencent/QQ/Bin/QQ.exe
if "%op%"=="BD" start /max http://www.baidu.com
if "%op%"=="FX" start C:\Progra~1\"China Mobile"\Fetion\Fetion.exe
if "%op%"=="MS" start C:\Progra~1\KWMUSIC\KwMusic.exe
if "%op%"=="XYJ" start C:\Progra~1\LineKong\xyj\xyjonline.exe
if "%op%"=="PPS" start C:\Progra~1\PPStream\PPStream.exe
if "%op%"=="MV" start /max explorer.exe F:\电影\A片
if "%op%"=="LMS" start /max explorer.exe F:\音乐
if "%op%"=="JB" start /max explorer.exe D:\资料\脚本
if "%op%"=="VC" start /max explorer.exe E:\VC
if "%op%"=="XL" start C:\Progra~1\"Thunder Network"\Thunder\Program\Thunder.exe -StartType:DesktopIcon
if "%op%"=="PS" start C:\"Program Files"\Adobe\"Photoshop 7.0"\Photoshop.exe
if "%op%"=="MJ"	start D:\Progra~1\the9\WOF\launch.exe
if "%op%"=="FL" start D:\Progra~1\"Flash 8"\Flash.exe
if "%op%"=="JS" start D:\"Program Files"\"Plants Vs. Zombies"\"开始游戏.exe"
if "%op%"=="UE" start /max D:\软件\学习\ue编辑器\UE\Uedit32.exe
if "%op%"=="VM" start D:\软件\ubuntu\"VMware Workstation(虚拟机) V7.0.0 绿色汉化精简版"\"VMware Workstation 7.0"\App\vmware.exe
if "%op%"=="HF" start C:\"Program Files"\Holdfast\"platform 5.0"\GameClient.exe
if "%op%"=="CYGWIN" D:\linux\Cygwin.bat
if "%op%"=="PUTTY" start C:\COMMAND\puttycyg\putty.exe -load "cygwin" -cygterm -N "bash --login -c 'cd ~;exec bash --rcfile ~/.bashrc'"
if "%op%"=="COMMAND" start /max explorer.exe C:\command
if "%op%"=="NZ" C:\"Program Files"\mengchang\mengchang.exe
if "%op%"=="WAR" start D:\软件\游戏\WARCRAFT\"Warcraft III"\War3.exe -window
if "%op%"=="JJ" (
D:
cd D:\软件\游戏\kawaks_skycn\"Kawaks 1.45 最终中文典藏版"
start WinKawaks.exe
C:
)
if "%op%"=="WUBI" start D:\软件\学习\五笔\五笔反查工具\WUBIAide.exe
if "%op%"=="DBANK" start D:\"My Documents"\DBank\iSync\DBank_isync.exe
if "%op%"=="--HELP" type C:\COMMAND\open.bat
::pause