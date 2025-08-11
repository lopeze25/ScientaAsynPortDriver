#!../../bin/win32-x86/asynTest

## You may have to change asynTest to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("C:/epics/asynTest/dbd/asynTest.dbd")

asynTest_registerRecordDeviceDriver(pdbbase) 
# Scienta driver
ScientaAsynDriverConfigure("SCIENTA", "C:/Ses-1.2.2-r1/dll/SESInstrument.dll"}
## Load record instances
##dbLoadRecords("C:/epics/asynTest/db/asynTest.db","user=29id")
dbLoadRecords("C:/epics/asynTest/db/Scienta.db". "P=SCIENTA:,R=,PORT=SCIENTA,ADDR=0,IOC=SCIENTA")
##dbLoadRecords("C:/epics/asynTest/asynTestApp/Db/Scienta.db". "P=SCIENTA:,R=,PORT=SCIENTA,ADDR=0,IOC=SCIENTA")
iocInit()
## Start any sequence programs
#seq sncasynTest,"user=29id"
