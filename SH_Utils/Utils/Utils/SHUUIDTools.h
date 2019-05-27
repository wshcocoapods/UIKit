//
//  SHUUIDTools.h
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHUUIDTools : NSObject
+(void)saveUUID:(NSString *)UUID;
+(NSString *)readUUID;
+(void)deleteUUID;
@end

@interface KeyChainData : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
@end

NS_ASSUME_NONNULL_END
