/* 
 * File:   IMenu.h
 * Author: dev
 *
 * Created on 23 July 2019, 18:49
 */

#ifndef IMENU_H
#define	IMENU_H

#include "../Helpers.h"

class Painter;

class IMenu
{
public:

    virtual uint16_t GetBackgroundColor()
    {
        return RGB565(180, 180, 180);
    }

    virtual void Draw(Painter* painter)
    {

    }

    virtual void Update(Button button)
    {

    }
};

#endif	/* IMENU_H */

