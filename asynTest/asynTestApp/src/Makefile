TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = asynTest
# asynTest.dbd will be created and installed
DBD += asynTest.dbd
# asynTest.dbd will be made up from these files:
asynTest_DBD += base.dbd
asynTest_DBD += asyn.dbd
asynTest_DBD += asynTestInclude.dbd
asynTest_DBD += drvAsynSerialPort.dbd
asynTest_DBD += ScientaRegister.dbd
#$(DBD_NAME)_DBD += arrayFxns.dbd
# Include dbd files from all support applications:
#asynTest_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#asynTest_LIBS += xxx

# asynTest_registerRecordDeviceDriver.cpp derives from asynTest.dbd
asynTest_SRCS += asynTest_registerRecordDeviceDriver.cpp
asynTest_SRCS += ScientaAsynDriver.cpp
# Build the main IOC entry point on workstation OSs.
asynTest_SRCS_DEFAULT += asynTestMain.cpp
asynTest_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#asynTest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
asynTest_LIBS += asyn
asynTest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

