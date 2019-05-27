//
//  SH_FontManger.m
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "SH_FontManger.h"
#import "Device.h"
#import "CommonUI.h"


#define iPhoneAdjustFont            0.0
#define iPhone6AdjustFont           0.5
#define iPhone6PlusAdjustFont       1
@implementation SH_FontManger

+(UIFont *)adapterFontSize:(CGFloat)size{
    UIFont *font = [self adapterFontName:@"Helvetica" size:size];
    return font;
}

+ (UIFont *)adapterFont:(UIFont *)font{
    UIFont *newFont = [self adapterFontName:font.fontName size:font.pointSize];
    return newFont;
}
+ (UIFont *)adapterBodyFont:(CGFloat)fontSize{
    UIFont *newFont=nil;
    if (SH_414x736) {
        newFont = [UIFont boldSystemFontOfSize:fontSize+iPhone6PlusAdjustFont];
    }else if (SH_375x667){
        newFont = [UIFont boldSystemFontOfSize:fontSize+iPhone6AdjustFont];
    }else{
        newFont = [UIFont boldSystemFontOfSize:fontSize+iPhoneAdjustFont];
    }
    return newFont;
}
+ (UIFont *)adapterFontName:(NSString *)fontName size:(CGFloat)fontSize{
    UIFont *newFont=nil;
    if (SH_414x736) {
        newFont = [UIFont fontWithName:fontName size:fontSize+iPhone6PlusAdjustFont];
    }else if (SH_375x667){
        newFont = [UIFont fontWithName:fontName size:fontSize+iPhone6AdjustFont];
    }else{
        newFont = [UIFont fontWithName:fontName size:fontSize+iPhoneAdjustFont];
    }
    return newFont;
}
@end
