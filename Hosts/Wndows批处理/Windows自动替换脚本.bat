@echo off
mode con lines=30 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:main
cls
echo √√    √√  √√√      √√√√  √√√√√    √√√√
echo   √    √  √      √  √      √  √  √  √  √      √
echo   √    √  √      √  √              √      √
echo   √√√√  √      √    √√          √        √√
echo   √    √  √      √        √        √            √
echo   √    √  √      √          √      √              √
echo   √    √  √      √  √      √      √      √      √
echo √√    √√  √√√    √√√√      √√√    √√√√
echo.----------------------------------------------------------- 
echo.如有360、电脑管家等安全软件提醒，请勾选允许和不再提醒！
echo.
echo.警告：执行该命令您的hosts将被自动替换覆盖！
echo.如您原先的hosts有自己修改过的信息，请自行手动修改！
echo.
echo.-----------------------------------------------------------
echo.请选择使用：
echo.
echo. 1.使用穿墙hosts（即在下面输入1）
echo.
echo. 2.恢复初始hosts（即在下面输入2）
echo.-----------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p choice=请输入数字并按回车键确认:

echo.
if %choice%==1 goto host DNS
if %choice%==2 goto CL
cls
"set choice="
echo 您输入有误，请重新选择。
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 12 /n /m "请输入相应数字："
if errorlevel 2 goto CL
if errorlevel 1 goto host DNS
cls
goto main

:host DNS
cls
copy /y "hosts" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
echo.-----------------------------------------------------------
echo.
goto end

:CL
cls
@echo 127.0.0.1 localhost > %SystemRoot%\System32\drivers\etc\hosts
echo 恭喜您，hosts恢复初始成功!
echo.
goto end

:end
echo 请按任意键退出。
@Pause