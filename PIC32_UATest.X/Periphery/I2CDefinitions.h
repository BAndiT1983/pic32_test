/* 
 * File:   I2CDefinitions.h
 * Author: dev
 *
 * Created on 06 August 2019, 07:27
 */

#ifndef I2CDEFINITIONS_H
#define	I2CDEFINITIONS_H

#include <xc.h>

#define ICSP_W_MCLR_O	LATCbits.LATC13
#define ICSP_W_MCLR_T	TRISCbits.TRISC13

#define	ICSP_W_PCLK_O	LATFbits.LATF8
#define	ICSP_W_PCLK_T	TRISFbits.TRISF8
#define ICSP_W_PCLK_U	CNPUFbits.CNPUF8

#define	ICSP_W_PDAT_O	LATFbits.LATF2
#define ICSP_W_PDAT_I	PORTFbits.RF2
#define ICSP_W_PDAT_T	TRISFbits.TRISF2
#define ICSP_W_PDAT_U	CNPUFbits.CNPUF2


#define ICSP_E_MCLR_O	LATCbits.LATC14
#define ICSP_E_MCLR_T	TRISCbits.TRISC14

#define	ICSP_E_PCLK_O	LATAbits.LATA2
#define	ICSP_E_PCLK_T	TRISAbits.TRISA2
#define	ICSP_E_PCLK_U	CNPUAbits.CNPUA2

#define	ICSP_E_PDAT_O	LATAbits.LATA3
#define ICSP_E_PDAT_I	PORTAbits.RA3
#define ICSP_E_PDAT_T	TRISAbits.TRISA3
#define ICSP_E_PDAT_U	CNPUAbits.CNPUA3

#endif	/* I2CDEFINITIONS_H */

