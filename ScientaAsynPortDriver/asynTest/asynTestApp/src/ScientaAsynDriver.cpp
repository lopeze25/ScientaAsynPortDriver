#include "ScientaAsynDriver.h"
#include <epicsExport.h>
#include <stdio.h>
#include <iostream>

// Declare the Scienta DLL function
extern "C" __declspec(dllimport) unsigned int GDS_ZeroSupplies(void);

//  parameter string
#define ZeroSuppliesString "SCIENTA_ZERO_SUPPLIES"

// Constructor
testAsynDriver::testAsynDriver(const char* portName)
    : asynPortDriver(portName,
                     1,  /* maxAddr */
                     1,  /* number of parameters */
                     asynInt32Mask, /* Interface mask */
                     asynInt32Mask, /* Interrupt mask */
                     ASYN_CANBLOCK,
                     1, 0, 0)
{
    createParam(ZeroSuppliesString, asynParamInt32, &ZeroSupplies);
}

//  handler for ZeroSupplies
asynStatus testAsynDriver::writeInt32(asynUser* pasynUser, epicsInt32 value)
{
    int function = pasynUser->reason;
    if (function == ZeroSupplies)
    {
        std::cout << "Called GDS_ZeroSupplies()\n";
        return asynSuccess;
    }
    return asynError;
}

// ScientaAsynDriverConfigure in st.cmd 
extern "C" {
    int ScientaAsynDriverConfigure(const char* portName) {
		printf("Debug 2");
        new testAsynDriver(portName);
        return 0;
	}
}

extern "C" {
	epicsExportRegistrar(ScientaAsynDriverConfigure);
}