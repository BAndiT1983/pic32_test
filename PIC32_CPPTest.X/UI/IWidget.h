/* 
 * File:   IWidget.h
 * Author: dev
 *
 * Created on 03 August 2019, 23:44
 */

#ifndef IWIDGET_H
#define	IWIDGET_H

class IWidget
{
public:

    virtual void Draw(Painter* painter)
    {
        // Default empty implementation to prevent overhead
    }
};

#endif	/* IWIDGET_H */

