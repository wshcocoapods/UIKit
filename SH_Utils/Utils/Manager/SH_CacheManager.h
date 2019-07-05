//
//  SH_CacheManager.h
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import <Foundation/Foundation.h>
#define k_domain_cahceKey_formal @"formal"
#define k_domain_cahceKey_experience @"experience"
NS_ASSUME_NONNULL_BEGIN
@class SHUserModel;
@interface SH_CacheManager : NSObject
+(instancetype)shareInstance;
+(void)removeCache;
//-(void)removeFormalCache;
//-(void)removeExperienceCache;
@property (nonatomic,strong) NSString *cacheAppVersion;
@property (nonatomic,strong) SHUserModel *userModel;
@end


@interface SHUserModel : NSObject
@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSArray *communities;
@end
NS_ASSUME_NONNULL_END
