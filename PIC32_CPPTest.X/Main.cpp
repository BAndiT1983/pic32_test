/* 
 * File:   Main.cpp
 * Author: dev
 *
 * Created on 23 July 2019, 15:59
 */

// System headers
#include <cstdlib>

// MCU headers
#include <xc.h>

// Firmware headers
#include "Helpers.h"
#include "Configuration/PIC32.h"
#include "Periphery/ILI9341Device.h"
#include "Periphery/I2C.h"
#include "Periphery/USBCDCDevice.h"

// Menus/Pages
#include "UI/MenuSystem.h"
#include "UI/MainMenu.h"
#include "UI/AnalogGainMenu.h"

//#define	OSC_EN_O	LATCbits.LATC15
//#define	OSC_EN_T	TRISCbits.TRISC15

#include "GlobalSettings.h"

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

//void clear_framebuffer(uint16_t color) {
//    uint16_t x;
//    uint8_t y;
//    for (x = 0; x < FRAMEBUFFER_WIDTH; x++) {
//        for (y = 0; y < FRAMEBUFFER_HEIGHT; y++) {
//            framebuffer[x][y] = color;
//        }
//    }
//}

void SetupInterrupts()
{
    INTCONbits.MVEC = 1; // Multi Vector Interrupts
    PRISSbits.SS0 = 0; // Normal Register Set

    PRISSbits.PRI7SS = 7; // Assign Shadow Register Set

    PRECONbits.PREFEN = 0b10; // instruction and data
    PRECONbits.PFMWS = 0b010; // two wait states

    // cacheable, non-coherent, write-back, alloc
    __builtin_mtc0(_CP0_CONFIG, 0, 0b011);
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

void Setup(ILI9341Display& display, USBCDCDevice& cdcDevice)
{
    DisableIRQ();

    InitPBUS();
    PRECONbits.PREFEN = 0b10; // instruction and data
    PRECONbits.PFMWS = 0b010; // two wait states

    // cacheable, non-coherent, write-back, alloc
    __builtin_mtc0(_CP0_CONFIG, 0, 0b011);

    //init_usb();

    SetupInterrupts();

    ConfigGPIO();

    cdcDevice.Initialize();
    //DelayMs(100);

    init_icsp_w();
    init_icsp_e();

    init_i2c_w();
    init_i2c_e();

    //delay_ms(1);
    set_mclr_w(1);
    set_mclr_e(1);
    //delay_ms(1);

    display.Initialize();

    EnableIRQ();

    //clear_framebuffer(ILI9341_CYAN);
}

static uint8_t data[16];
uint16_t knob_position[2] = {0, 0};
int8_t diff = 0;

char debugText[32];

void PollKMW(ILI9341Display* display, USBCDCDevice* cdcDevice)
{
    i2c3_getn(0x10, data, 2);

    int8_t brightness = GlobalSettings::brightnessPercentage;

    if (data[1] != knob_position[1])
    {
        diff = data[1] - knob_position[1];
        if (diff < 0)
        {
            brightness -= 10;
            if (brightness < 10)
            {
                brightness = 10;
            }
        }
        else
        {
            brightness += 10;
            if (brightness > 100)
            {
                brightness = 100;
            }
        }

        sprintf(debugText, "nob/diff: %d\r\n", diff);
        cdcDevice->Send((uint8_t*) debugText, 32);

        knob_position[1] = data[1];
        GlobalSettings::brightnessPercentage = brightness;
        display->SetBacklight(GlobalSettings::brightnessPercentage);
    }
}

Button PollKME()
{
    static uint8_t data_status[16];

    i2c2_getn(0x00, data, 3);
    i2c2_getn(0x04, data_status, 3);

    if (data[0] || data[1] || data[2])
    {
        if (data[1] & 0x08)
        {
            if (data_status[1] & 0x08)
            {

            }
            else
            {
                return Button::BUTTON_1;
            }
        }

        if (data[1] & 0x10)
        {
            if (data_status[1] & 0x10)
            {

            }
            else
            {
                return Button::BUTTON_2;
            }
        }

        if (data[1] & 0x20)
        {
            if (data_status[1] & 0x20)
            {

            }
            else
            {
                return Button::BUTTON_3;
            }
        }

        if (data[2] & 0x80)
        {
            if (data_status[2] & 0x80)
            {

            }
            else
            {
                return Button::BUTTON_4;
            }
        }

        if (data[2] & 0x40)
        {
            if (data_status[2] & 0x40)
            {

            }
            else
            {
                return Button::BUTTON_5;
            }
        }

        if (data[2] & 0x20)
        {
            if (data_status[2] & 0x20)
            {

            }
            else
            {
                return Button::BUTTON_6;
            }
        }
    }

    return Button::BUTTON_NONE;
}

/*
 * 
 */
int main(int argc, char** argv)
{
    int i = 0;
    
    //    OSC_EN_O = 1;
    //    OSC_EN_T = 0;

    /* backlight off */
    LCD_BLT_O = 0;

    ILI9341Display display;
    USBCDCDevice cdcDevice;
    Setup(display, cdcDevice);

    MenuSystem menuSystem;

    display.SetBacklight(GlobalSettings::brightnessPercentage);

    Painter painter(display.GetFramebuffer(), display.GetWidth(), display.GetHeight());
    MainMenu mainMenu(&cdcDevice);

    IMenu* currentMenu = &mainMenu;

    // RGB LED
    static uint8_t rgb[4];
    rgb[0] = 0x00;
    rgb[1] = 0x04;
    rgb[2] = 0x00;
    rgb[3] = 0x01;
    i2c3_setn(0x20, rgb, 4);

    uint16_t counter = 0;
    while (1)
    {
        cdcDevice.Process();

        // Buttons and knobs, PIC16 (west)
        PollKMW(&display, &cdcDevice);

        // Buttons, PIC16 (east)
        currentMenu->Update(PollKME());

        display.ClearFramebuffer(currentMenu->GetBackgroundColor());
        currentMenu->Draw(&painter);

        counter++;
        sprintf(debugText, "%d\r\n", counter);
        painter.DrawText(debugText, 10, 70, RGB565(255, 0, 0), TextAlign::TEXT_ALIGN_LEFT, 10);

        //cdcDevice.Send((uint8_t*)debugText, 10);

        display.DisplayFramebuffer();

        DelayMs(30);
    }

    return 0;
}

