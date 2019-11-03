// MCU header
//#include <xc.h>

// Configuration
#include "Configuration/PIC32.h"

// Firmware headers
#include "Configuration/PIC32.h"
#include "Periphery/I2C.h"
#include "Periphery/ILI9341Device.h"

#include "Helpers.h"

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

void Setup(ILI9341Display& display)
{
    DisableIRQ();

    InitPBUS();
    PRECONbits.PREFEN = 0b10; // instruction and data
    PRECONbits.PFMWS = 0b010; // two wait states

    // cacheable, non-coherent, write-back, alloc
    __builtin_mtc0(_CP0_CONFIG, 0, 0b011);

    //SetupInterrupts();

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

    display.Initialize();

    EnableIRQ();

    //clear_framebuffer(ILI9341_CYAN);
}

#define LCD_BLT_O	LATDbits.LATD10

volatile uint16_t framebuffer[ILI9341_TFTWIDTH * ILI9341_TFTHEIGHT];

ILI9341Display display(framebuffer);

void __attribute__((section(".user_app"))) TestMethod()
{
    static uint8_t rgb[4];
    rgb[0] = 0x14;
    rgb[1] = 0x24;
    rgb[2] = 0x00;
    rgb[3] = 0x01;
    i2c3_setn(0x20, rgb, 4);

    LCD_BLT_O = 1;

    display.ClearFramebuffer(RGB565(127,0,0));
    display.DisplayFramebuffer();

    while(1) 
    {
        DelayMs(1000);        
        LCD_BLT_O = !LCD_BLT_O;
    }
}

int main()
{
    Setup(display);
    
    // RGB LED
    static uint8_t rgb[4];
    rgb[0] = 0x14;
    rgb[1] = 0x00;
    rgb[2] = 0x04;
    rgb[3] = 0x01;
    i2c3_setn(0x20, rgb, 4);
    
    extern uint16_t __USER_APP_ADDRESS;
    void (*fptr)(void);
    fptr = (void (*)(void))&__USER_APP_ADDRESS;
    
    display.DisplayFramebuffer();

    int i = 0;
    
    while (1)
    {
        DelayMs(500);        
        LCD_BLT_O = !LCD_BLT_O;
        
        if(i == 5)
        {
            fptr();
        } 
        
        i++;
    }
    
    return 0;
}
