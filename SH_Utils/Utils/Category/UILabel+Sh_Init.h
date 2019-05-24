//
//  UILabel+UILabel_Sh_Init.h
//  SH_Utils
//
//  Created by weish on 2019/5/24.
//  Copyright © 2019 bbw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Sh_Init)
- (instancetype)initWithSuperView:(UIView *)superView;

- (UILabel * (^)(NSString *))sh_text;
- (UILabel * (^)(UIColor *))sh_bgColor;
- (UILabel * (^)(UIColor *))sh_color;
- (UILabel * (^)(UIFont *))sh_font;
- (UILabel * (^)(NSTextAlignment ))sh_textAlignment;


@end

NS_ASSUME_NONNULL_END
