/* 
 * File:   GlobalSettings.h
 * Author: dev
 *
 * Created on 20 August 2019, 09:06
 */

#ifndef GLOBALSETTINGS_H
#define	GLOBALSETTINGS_H

#include <stdint.h>

// Ugly hack to allow access for every module, needs rework, e.g. dependency injection
class GlobalSettings
{
public:
    static uint8_t brightnessPercentage;
};

#endif	/* GLOBALSETTINGS_H */

