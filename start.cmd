@echo off
cd /d %~dp0
title ColourfulWinSSH - Windows Command Prompt


REM Edit this to your chosen architecture. 
REM Choices: x64 / x86
REM Default: x64
set arch=x64
	

:confirmScript
cls
echo Welcome to ColourfulWinSSH (via Putty)!
echo A way to connect to your SSH Terminal via Windows Command Prompt!
echo.
echo Please enter your Hostname (or IP address)
set /p args=" >"
if "%args%"=="" ( 
    echo.
    echo You must enter a Hostname ^(or IP address^)!
    pause
    goto confirmScript
) else (
    start /B "" ""./bin/ansicon/%arch%/ansicon.exe plink -ssh %args%""
)
goto :EOF