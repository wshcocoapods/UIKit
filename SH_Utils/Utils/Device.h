
//
//  Device.h
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#ifndef Device_h
#define Device_h

#define SH_APP_NAME  \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define SH_APP_ID  \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define SH_APP_VERSION  \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define SH_APP_SHORTVERSION  \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define SH_APP_BUNDLEVERSION \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define SH_APP_BUILDTIME  \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"buildTime"]

#define SH_StatusH ((SH_375x812 || SH_414x896)?44:20)
#define SH_NaviH ((SH_375x812 || SH_414x896)?88:64)
#define SH_TabbarH ((SH_375x812 || SH_414x896)?83:49)

// 版本
#define iOS11       [[[UIDevice currentDevice]systemVersion]floatValue] >= 11
#define iOS10       [[[UIDevice currentDevice]systemVersion]floatValue] >= 10
#define iOS9        [[[UIDevice currentDevice]systemVersion]floatValue] >= 9
#define iOS8        [[[UIDevice currentDevice]systemVersion]floatValue] >= 8
#define iOS7        [[[UIDevice currentDevice]systemVersion]floatValue] >= 7

// 320*480 
#define SH_320x480 \
((double)[[UIScreen mainScreen] bounds].size.height < (double)568)
//5
#define SH_320x568 \
(([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)
//6
#define SH_375x667  \
(667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)
//6sp
#define SH_414x736 \
(736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)
//x
#define SH_375x812 \
(812 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)
//xr 414,896 //xmax 414,896 尺寸一致
#define SH_414x896 \
(896 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)


#endif /* Device_h */
