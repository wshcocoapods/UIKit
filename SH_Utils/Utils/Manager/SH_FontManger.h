//
//  SH_FontManger.h
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SH_FontManger : NSObject
+ (UIFont *)adapterFontSize:(CGFloat)size;
+ (UIFont *)adapterFont:(UIFont *)font;
+ (UIFont *)adapterBodyFont:(CGFloat)fontSize;
+ (UIFont *)adapterFontName:(NSString *)fontName size:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
