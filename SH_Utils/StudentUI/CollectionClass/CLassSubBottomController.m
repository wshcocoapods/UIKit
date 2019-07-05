//
//  CLassSubBottomController.m
//  StudentUI
//
//  Created by weish on 2019/6/25.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "CLassSubBottomController.h"

@interface CLassSubBottomController ()

@end

@implementation CLassSubBottomController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(k_items_w, k_items_w);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    [self configCollectionViewWith:layout];
    [self.collectionView registerClass:[ClassSubBottomCell class] forCellWithReuseIdentifier:@"ClassSubBottomCell"];
}

- (void)configData {
    for (int i = 0; i<12; i++) {
        [self.items addObject:[@(i) stringValue]];
    }
//    self.items = @[@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3"];
    [self.collectionView reloadData];
}

#pragma mark --- collection delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ClassSubBottomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClassSubBottomCell" forIndexPath:indexPath];
    cell.titleLB.text = self.items[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}
@end


@implementation ClassSubBottomCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (void)configUI{
    self.titleLB = [[UILabel alloc]init];
    [self addSubview:self.titleLB];
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_offset(0);
    }];
    self.titleLB.layer.borderColor = [UIColor greenColor].CGColor;
    self.titleLB.layer.borderWidth = 1;
    self.titleLB.textAlignment = NSTextAlignmentCenter;
}

@end
