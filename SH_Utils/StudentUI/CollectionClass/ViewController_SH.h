//
//  ViewController_SH.h
//  StudentUI
//
//  Created by weish on 2019/6/25.
//  Copyright © 2019 bbw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
NS_ASSUME_NONNULL_BEGIN

@interface ViewController_SH : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *items;
- (void)configUI;
- (void)configData;
- (void)configCollectionViewWith:(UICollectionViewFlowLayout *)layout;
- (void)configTableView;
@end

NS_ASSUME_NONNULL_END
