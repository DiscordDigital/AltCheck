@echo off
:: Get the latest version here https://github.com/DiscordDigital/AltCheck/
cd "%~dp0"
set appleServiceName=Apple Mobile Device Service
set altServerPath=C:\Program Files (x86)\AltServer\AltServer.exe
set imobiledevicefolder=imobiledevice
set monitorAltserverInterval=30
set monitoriDevice=60
title AltCheck.bat
if "%1"=="MonitorAltserver" goto monitorAltserver
if "%1"=="MonitorImobiledevice" goto monitorImobiledevice
goto :eof

:: void monitorImobiledevice();
:monitorImobiledevice
set counter=0
for /f "delims=" %%B in ('%imobiledevicefolder%\idevice_id.exe -n') do if not "%%B"=="" set /a counter=%counter%+1
if %counter% GTR 0 echo [INFO] %counter% Device(s) found, no action needed.
if %counter% EQU 0 echo [WARN] No devices found. Restarting Apple Mobile Device Service.
if %counter% EQU 0 call :restartAppleMobileService
echo [INFO] Waiting %monitoriDevice% seconds..
timeout /t %monitoriDevice% > nul
goto monitorImobiledevice

:: void monitorAltserver();
:monitorAltserver
call :checkAltserver
if "%elevel%"=="0" echo [INFO] AltServer is running
if not "%elevel%"=="0" (
echo [INFO] AltServer isn't running.. Calling startAltserver
call :startAltserver
)
echo [OK] Cycle completed, waiting %monitorAltserverInterval% seconds before checking again.
timeout /t %monitorAltserverInterval% > nul
goto monitorAltserver

:: bool checkAltserver();
:checkAltserver
tasklist | findstr "AltServer" > nul
set elevel=%errorlevel%
exit /b

:: void startAltserver();
:startAltserver
echo [ACTION] Started AltServer
start "" "%altServerPath%"
exit /b

:: void restartAppleMobileService();
:restartAppleMobileService
echo [INFO] Restarting Apple Mobile Device Service
sc stop "%appleServiceName%" > nul
sc start "%appleServiceName%" > nul
echo [OK] Action completed
echo [INFO] To give %appleServiceName% time to detect your iPhone, waiting now for 60 seconds..
timeout /t 60 > nul
exit /b
