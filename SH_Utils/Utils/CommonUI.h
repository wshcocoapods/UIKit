//
//  Theme.h
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#ifndef CommonUI_h
#define CommonUI_h

#define SH_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SH_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height



#define SH_Main_Color UIColorFromRGB(0x33b2b0)

//Font
#define SH_font(size) [SH_FontManger adapterFontSize:size];

//Color (0x00000)
#define UIColorFromRGB(rgbValue)                                       \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:1.0]

#endif /* CommonUI_h */
