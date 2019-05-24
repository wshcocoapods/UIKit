//
//  ViewController.m
//  SH_Utils
//
//  Created by weish on 2019/5/24.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Sh_Init.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lb = [[UILabel alloc]initWithSuperView:self.view];
    lb.sh_font([UIFont systemFontOfSize:30]).sh_text(@"this is good");
    
    lb.frame = CGRectMake(0, 0, 100, 100);
}


@end
