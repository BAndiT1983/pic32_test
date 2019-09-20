//#include "USBCDCDevice.h"

#include <xc.h>

//
//void USBCDCDevice::Initialize(void)
//{
//    USBCSR0bits.SOFTCONN = 0; // USB D+/D- lines are disabled and tristated
//
//    USBCSR2bits.RESETIE = 1; // ?? When enabled IN packets/Set Address aren't received (unknown reason).
//    USBCSR2bits.RESUMEIE = 0; // ?? When enabled IN packets/Set Address aren't received (unknown reason).
//
//    USBCSR0bits.EP0IF = 0; // clear interrupt
//    USBCSR1bits.EP1RXIF = 0; // clear interrupt
//    USBCSR0bits.EP2TXIF = 0; // clear interrupt
//    USBCSR1bits.EP3RXIF = 0; // clear interrupt
//
//    IPC33bits.USBIP = 7; // USB Interrupt Priority.
//    IPC33bits.USBIS = 1; // USB Interrupt Sub-Priority.
//
//    USBCSR0bits.FUNC = 0; // USB address = 0
//
//    IFS4bits.USBIF = 0; // Clear the USB interrupt flag.
//    IEC4bits.USBIE = 1; // Enable the USB interrupt.
//
//    USBCSR0bits.HSEN = 1; // 1 = Enable High Speed (480Mbps) USB mode.
//    USBCSR0bits.SOFTCONN = 1; // USB D+/D- lines are enabled and active
//}
//
//void USBCDCDevice::Process()
//{
//    if (!ep3tbc)
//    {
//        unsigned cnt = 0;
//
//        while ((loop_ri != loop_wi) && (cnt < 16))
//            ep3data[cnt++] = loop[loop_ri++ & LOOP_MASK] + 1;
//
//        if (cnt)
//        {
//            ep3tbc = cnt;
//            ep3ptr = ep3data;
//            usb_ep3_tx();
//        }
//    }
//}

