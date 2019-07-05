
//
//  SH_GlobalManager.m
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "SH_GlobalManager.h"
#import "SH_CustomerStatusBar.h"
#import "Device.h"
#import "CommonUI.h"
@interface SH_GlobalManager ()
@property (nonatomic,strong)SH_CustomerStatusBar *customerStatusBar;
@property (nonatomic,strong) UIView *x;
@end

@implementation SH_GlobalManager
static id obj = nil;
static dispatch_once_t onceToken;
+ (instancetype)shareInstance{
  
    dispatch_once(&onceToken, ^{
        obj = [[SH_GlobalManager alloc]init];
    });
    return obj;
}

-(void)showMsgWith:(NSString *)text{
    [self.customerStatusBar showStatusBaMessage:text bgColor:[UIColor greenColor] delay:1.5];
    
}


-(void)showMsgWith:(NSString *)text color:(UIColor *)color{
    if (!color) return;
    [self.customerStatusBar showStatusBaMessage:text bgColor:color delay:1.5];
}

- (SH_CustomerStatusBar *)customerStatusBar{
        CGFloat top = (SH_375x812 || SH_414x896)?60:25;
        _customerStatusBar = [[SH_CustomerStatusBar alloc]initWithFrame:CGRectMake(0, 0, SH_SCREEN_WIDTH,top)];
    return _customerStatusBar;
}


+ (void)destroy{
    obj = nil;
    onceToken = 0;
}

@end
