//
//  SH_CustomerStatusBar.h
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SH_CustomerStatusBar : UIWindow
- (void)showStatusBaMessage:(NSString *)msg bgColor:(UIColor *)bgColor delay:(NSTimeInterval)delay;
@end

NS_ASSUME_NONNULL_END
