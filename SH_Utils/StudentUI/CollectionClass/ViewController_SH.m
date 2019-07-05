//
//  ViewController_SH.m
//  StudentUI
//
//  Created by weish on 2019/6/25.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "ViewController_SH.h"

@interface ViewController_SH ()

@end

@implementation ViewController_SH

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configData];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)configUI{
    //Sub Todo
}

- (void)configData{
    //Sub Todo
}

- (void)configTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)configCollectionViewWith:(UICollectionViewFlowLayout *)layout{
    self.items = @[].mutableCopy;
    UICollectionViewFlowLayout *flowLayout = layout;
    if (!flowLayout) {
        flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = self.view.frame.size;
    }
    self.collectionView  = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_offset(0);
    }];
}








@end
