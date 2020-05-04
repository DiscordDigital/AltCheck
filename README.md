# AltCheck
The first AltServer monitor that presses the service restart button for you. Sharing the same backend as AltServer.
## How to get it working (Important!)
To get this working you need to follow these steps:
1. Create a folder named imobiledevice in the same folder where altcheck.bat is
2. Download "Quamotion iMobileDevice for 64-bit" (Link on bottom of this README)
3. Copy the contents of that zip into imobiledevice
4. Enable Wifi Sync on your device from iTunes
5. Make sure AltServer is installed
6. You can close iTunes while this script is running
7. Launch AltCheck_Start.bat to start monitoring. (Right click, Run as Administrator)
8. (optional) Put AltCheck_Start.bat into an AutoStart folder or task scheduler

## Windows Firewall
For best results you may want to disable your Windows Firewall.\
If you make use of the Windows Firewall make sure to create two new rules containing following:

Rules need to be created for: **Incoming connections**\
**TCP** Ports 123, 3689\
**UDP** Ports 123, 5353

## Use in task scheduler (optional)
You can use this script in the task scheduler.\
If you run it in a virtual machine as a server, then you can even configure it to start at boot.\
This will have the effect that it is completely silent and runs independently from your user login.\
I used to have a lot of problems with Windows restarting because of updates and killing my user session that way.\
With the task scheduler the virtual machine reboots and starts the scripts in the background without being logged in.

You need to create two tasks, they differ from the arguments:
- MonitorAltserver
- MonitorImobiledevice

## Required download links:
Quamotion iMobileDevice for 64-bit: http://docs.quamotion.mobi/docs/imobiledevice/download/
