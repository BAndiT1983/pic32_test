/* 
 * File:   Definitions.h
 * Author: dev
 *
 * Created on 31 July 2019, 23:02
 */

#ifndef DEFINITIONS_H
#define	DEFINITIONS_H

#define XTAL_FREQ 24000000  // 24MHz MEMS oscillator
#define CPU_FREQ 192000000 // 192MHz, see DEVCFG2 section for explanations

enum class Button {
    // Display top
    BUTTON_NONE,
    BUTTON_1,
    BUTTON_2,
    BUTTON_3,
    
    // Display Bottom
    BUTTON_4,   
    BUTTON_5,
    BUTTON_6,
    
    // Display left
    BUTTON_7,
    BUTTON_8,    
    BUTTON_9,
    
    // Display right
    BUTTON_10,
    BUTTON_11,
    BUTTON_12
};
#endif	/* DEFINITIONS_H */

