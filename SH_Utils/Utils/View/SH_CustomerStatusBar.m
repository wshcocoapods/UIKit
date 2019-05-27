//
//  SH_CustomerStatusBar.m
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "SH_CustomerStatusBar.h"
#import "SHSerialAnimationQueue.h"
#import "CommonUI.h"
#import "SH_FontManger.h"
@interface SH_CustomerStatusBar ()
@property(nonatomic, strong) SHSerialAnimationQueue *queue;
@property (nonatomic,strong) UILabel *statusLabel;
@end

@implementation SH_CustomerStatusBar

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.windowLevel = UIWindowLevelStatusBar + 1.0f;
        
        _statusLabel = [[UILabel alloc]
                        initWithFrame:(CGRect){.origin.x = 0,
                            .origin.y = 0.0f,
                            .size.width = frame.size.width,
                            .size.height = frame.size.height}];
        _statusLabel.backgroundColor = SH_Main_Color;
        [_statusLabel setTextAlignment:NSTextAlignmentCenter];
        _statusLabel.textColor = [UIColor whiteColor];
        _statusLabel.font = SH_font(12);
        [self addSubview:_statusLabel];
        
        _queue = [[SHSerialAnimationQueue alloc] init];
        [self setUserInteractionEnabled:NO];
    }
    return self;
}

- (void)showStatusBaMessage:(NSString *)msg
                    bgColor:(UIColor *)bgColor
                      delay:(NSTimeInterval)delay {
    if (!msg) return;
    _statusLabel.text = msg;
    _statusLabel.backgroundColor = bgColor;
    self.hidden = NO;
    [self showMessage:delay];
}

- (void)showMessage:(NSTimeInterval)delay {
    __weak SH_CustomerStatusBar *_self = self;
    void (^updateLabelOriginY)(CGFloat) = ^(CGFloat originY) {
        if (!_self) return;
        CGRect frame = _self.frame;
        frame.origin.y = originY;
        _self.frame = frame;
    };
    
    updateLabelOriginY(-CGRectGetHeight(self.frame));
    
    [self.queue animateWithDuration:0.5
                         animations:^{
                             updateLabelOriginY(0);
                         }];
    
    [self.queue animateWithDuration:0.5
                              delay:delay
                            options:0
                         animations:^{
                             if (!_self) return;
                             updateLabelOriginY(-CGRectGetHeight(_self.frame));
                         }
                         completion:^(BOOL finished) {
                             if (!_self) return;
                             _self.hidden = YES;
                                     [_self removeFromSuperview];
                         }];
}

@end
