@echo off
cd /d "%~dp0"
title Launching AltCheck..
start altcheck MonitorAltserver
start altcheck MonitorImobiledevice
exit
