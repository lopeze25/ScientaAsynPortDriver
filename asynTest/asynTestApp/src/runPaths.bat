@echo off
REM ===============================
REM Setup environment for asynTestApp IOC
REM ===============================

REM --- EPICS Base ---
set EPICS_BASE=C:\epics\base-3.14.12.5
set PATH=%EPICS_BASE%\bin\win32-x86;%PATH%

REM --- ASYN Module ---
set ASYN=C:\epics\asyn-R4-21
set PATH=%ASYN%\bin\win32-x86;%PATH%

REM --- Scienta DLL Folder (adjust path if needed) ---
set PATH=C:\Ses-1.2.2-r1\dll;%PATH%

REM --- IOC Binary Folder ---
set IOC_BIN=C:\epics\asynTest\bin\win32-x86
set PATH=%IOC_BIN%;%PATH%

REM --- Set EPICS Host Architecture ---
set EPICS_HOST_ARCH=win32-x86
set  PATH=C:\strawberry-perl-5.22.0.1-32bit-portable\perl\bin;%PATH%
echo ==========================================
echo Environment set for asynTestApp (32-bit)
echo EPICS_BASE = %EPICS_BASE%
echo ASYN       = %ASYN%
echo IOC_BIN    = %IOC_BIN%
echo ==========================================

REM --- Change directory to IOC Boot folder ---
cd /d C:\epics\asynTest\iocBoot\iocAsynTestApp

REM --- Start IOC ---
..\..\bin\win32-x86\asynTestApp.exe st.cmd
