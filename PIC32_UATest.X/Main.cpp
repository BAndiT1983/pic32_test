/* 
 * File:   Main.cpp
 * Author: dev
 *
 * Created on 23 July 2019, 15:59
 */

// System headers
#include <cstdlib>

// MCU headers
//#include <xc.h>

// Firmware headers
#include "Helpers.h"
#include "Periphery/I2C.h"

void ConfigGPIO()
{
    // Enable pull-up resistor for E9 to prevent UANT RX interferences
    CNPUEbits.CNPUE9 = 1;
}

void InitPBUS(void)
{
    UnlockPIC32();
    PB2DIVbits.PBDIV = 0b000001; // divide by 2
    PB2DIVbits.ON = 1;

    PB7DIVbits.PBDIV = 0b000000; // divide by 1
    PB7DIVbits.ON = 1;

    CFGCONbits.OCACLK = 1;
    TRISDbits.TRISD10 = 0;
    RPD10R = 0b1100;
    
    LockPIC32();
}

void init_icsp_w(void)
{
    ICSP_W_MCLR_T = 0; // MCLR out
    ICSP_W_MCLR_O = 0; // MCLR low
}

void init_icsp_e(void)
{
    ICSP_E_MCLR_T = 0; // MCLR out
    ICSP_E_MCLR_O = 0; // MCLR low
}

static inline
void set_mclr_w(unsigned val)
{
    ICSP_W_MCLR_O = (val & 1) ? 1 : 0;
}

static inline
void set_mclr_e(unsigned val)
{
    ICSP_E_MCLR_O = (val & 1) ? 1 : 0;
}

void Setup()
{
    DisableIRQ();

    InitPBUS();
    PRECONbits.PREFEN = 0b10; // instruction and data
    PRECONbits.PFMWS = 0b010; // two wait states

    // cacheable, non-coherent, write-back, alloc
    __builtin_mtc0(_CP0_CONFIG, 0, 0b011);

    ConfigGPIO();

    init_icsp_w();
    init_icsp_e();
    DelayMs(1);

    init_i2c_w();
    init_i2c_e();
    DelayMs(1);
    
    set_mclr_w(1);
    set_mclr_e(1);
    DelayMs(1);

    EnableIRQ();
}

/*
 * 
 */
int main(int argc, char** argv)
{
    Setup();
    
    // RGB LED
    static uint8_t rgb[4];
    rgb[0] = 0x04;
    rgb[1] = 0x04;
    rgb[2] = 0x00;
    rgb[3] = 0x01;
    i2c3_setn(0x20, rgb, 4);

    while (1)
    {
        DelayMs(30);
    }

    return 0;
}

