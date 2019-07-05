//
//  ClassRecordController.m
//  StudentUI
//
//  Created by weish on 2019/6/25.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "ClassRecordController.h"
#import "CLassSubBottomController.h"
@interface ClassRecordController ()
@property (nonatomic,strong) CLassSubBottomController *bottomVC;
@end

@implementation ClassRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configUI {
    self.bottomVC = [[CLassSubBottomController alloc]init];
    [self.view addSubview:self.bottomVC.view];
    
    [self.bottomVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(k_items_w);
    }];
}

- (void)configData {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
