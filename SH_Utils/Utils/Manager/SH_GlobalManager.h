//
//  SH_GlobalManager.h
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//


#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SH_GlobalManager : NSObject
@property (nonatomic,strong) NSString *name;
+ (instancetype)shareInstance;
+ (void)destroy;
- (void)showMsgWith:(NSString *)text;
- (void)showMsgWith:(NSString *)text color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
