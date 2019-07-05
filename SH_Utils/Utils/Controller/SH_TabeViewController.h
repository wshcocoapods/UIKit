//
//  SH_TabeViewController.h
//  SH_Utils
//
//  Created by weish on 2019/5/30.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "SH_Controller.h"

NS_ASSUME_NONNULL_BEGIN

@interface SH_TabeViewController : SH_Controller<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic,assign) BOOL isOne;
@end

NS_ASSUME_NONNULL_END
