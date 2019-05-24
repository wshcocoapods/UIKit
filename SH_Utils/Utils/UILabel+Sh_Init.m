//
//  UILabel+UILabel_Sh_Init.m
//  SH_Utils
//
//  Created by weish on 2019/5/24.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "UILabel+Sh_Init.h"
#import "Marco.h"
@implementation UILabel (UILabel_Sh_Init)

- (instancetype)initWithSuperView:(UIView *)superView{
    self = [super init];
    [superView addSubview:self];
    return self;
}

- (UILabel * _Nonnull (^)(NSString * _Nonnull))sh_text{
    SH_WeakSelf
    return ^UILabel *(NSString *text) {
        weakSelf.text = text;
        return self;
    };
}

-(UILabel * _Nonnull (^)(UIColor * _Nonnull))sh_color{
    SH_WeakSelf
    return ^UILabel *(UIColor *color) {
        weakSelf.textColor = color;
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIColor * _Nonnull))sh_bgColor{
    SH_WeakSelf
    return ^UILabel *(UIColor *color) {
        weakSelf.backgroundColor = color;
        return self;
    };
}

-(UILabel * _Nonnull (^)(UIFont * _Nonnull))sh_font{
    SH_WeakSelf
    return ^UILabel*(UIFont *font){
        weakSelf.font = font;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSTextAlignment))sh_textAlignment{
    SH_WeakSelf
    return ^UILabel *(NSTextAlignment textAlignment){
        weakSelf.textAlignment = textAlignment;
        return self;
    };
}


@end
