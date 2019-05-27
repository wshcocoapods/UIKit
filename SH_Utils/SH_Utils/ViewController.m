//
//  ViewController.m
//  SH_Utils
//
//  Created by weish on 2019/5/24.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Sh_Init.h"
#import "SH_GlobalManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lb = [[UILabel alloc]initWithSuperView:self.view];
    lb.sh_font([UIFont systemFontOfSize:30]).sh_text(@"this is good");
    
    lb.frame = CGRectMake(0, 0, 100, 100);
    
    NSLog(@"%.2f,%.2f",[UIScreen mainScreen].bounds.size.width,
          [UIScreen mainScreen].bounds.size.height);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [[SH_GlobalManager shareInstance] showMsgWith:@"d今天天气不过啊 小伙计"];
}

@end
