//
//  ViewController.m
//  StudentUI
//
//  Created by weish on 2019/6/21.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "ViewController.h"
#import "ShProcessView.h"
//#import "ShClassRecordController-Swift.h"
#import "StudentUI-Swift.h"
#import "ClassRecordController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ShProcessView *pv2 = [[ShProcessView alloc] initWithFrame:CGRectMake(30, 200, 300, 20)];
    pv2.backgroundColor = [UIColor clearColor];
    pv2.layer.cornerRadius = 10;
    pv2.progressTintColors = @[LRColorWithRGB(0xce2b2c),LRColorWithRGB(0xff734d)];
    pv2.hideStripes = YES;
    pv2.numberOfNodes = 5;
    pv2.hideAnnulus = NO;
    
    [pv2 setProgress:0.0 animated:YES];
    [self.view addSubview:pv2];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [pv2 setProgress:0.5 animated:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [pv2 setProgress:0.7 animated:YES];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [pv2 setProgress:1.0 animated:YES];
            });
        });
    });
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    v.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap  =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action)];
    [v addGestureRecognizer:tap];
    
}

- (void)action{

//    ShClassRecordController *vc = [[ShClassRecordController alloc]init];
    ClassRecordController *vc = [[ClassRecordController alloc]init];
//    vc.index = 1;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
