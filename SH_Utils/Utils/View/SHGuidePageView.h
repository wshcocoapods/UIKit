//
//  SHGuidePageView.h
//  SH_Utils
//
//  Created by weish on 2019/5/28.
//  Copyright © 2019 bbw. All rights reserved.
//


#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SHGuidePageView : UIView
@property(nonatomic,strong)NSArray *imageDatas;
@property(nonatomic,copy)void (^buttonAction)();
- (instancetype)initWithImageDatas:(NSArray *)imageDatas completion:(void(^)(void))buttonAction;
@end

NS_ASSUME_NONNULL_END
