#pragma once
#include <asynPortDriver.h>

class testAsynDriver : public asynPortDriver {
public:
    testAsynDriver(const char* portName);
    asynStatus writeInt32(asynUser* pasynUser, epicsInt32 value) override;

protected:
    int ZeroSupplies; // Parameter handle for SCIENTA_ZERO_SUPPLIES
};
