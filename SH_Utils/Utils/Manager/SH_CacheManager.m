//
//  SH_CacheManager.m
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "SH_CacheManager.h"
#import "SHCommonUtils.h"

#import <MJExtension.h>
#define VarName(var) [NSString stringWithFormat:@"%s", #var]

typedef NS_ENUM(NSUInteger, ShCacheLevel) {
    Default,// 不清除
    User,
    Community,
    Date
};

@implementation SH_CacheManager

+(instancetype)shareInstance{
    static id obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[SH_CacheManager alloc]init];
    });
    return obj;
}

- (void)removeFormalCache{
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:k_domain_cahceKey_formal];
}

-(void)removeExperienceCache{
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:k_domain_cahceKey_experience];
}
- (void)setUserModel:(SHUserModel *)userModel{
    [self setCacheValue:[NSKeyedArchiver archivedDataWithRootObject:userModel] key:VarName(userModel) level:User];
}

- (SHUserModel *)userModel{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[self cacheKey:VarName(userModel) level:User]];
}

#pragma mark ---- TODO: 默认正式环境

- (void)setCacheValue:(NSObject *)value
                  key:(NSString *)key
                level:(ShCacheLevel)level {
    NSString *cacheKey = [self cacheKey:key level:level];
    if (level == Default) {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:cacheKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    NSDictionary *domain = [[NSUserDefaults standardUserDefaults] persistentDomainForName:k_domain_cahceKey_formal];
    NSMutableDictionary *dic;
    if(domain){
        dic = [[NSMutableDictionary alloc] initWithDictionary:domain];
    }else{
        dic = @{}.mutableCopy;
    }
    [dic setValue:value forKey:cacheKey];
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:dic forName:k_domain_cahceKey_formal];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)cacheValue:(NSString *)key level:(ShCacheLevel)level {
    NSString *cacheKey = [self cacheKey:key level:level];
    if(level == Default){
        
        return [[NSUserDefaults standardUserDefaults] objectForKey:cacheKey];
    }
    NSMutableDictionary *dic = (NSMutableDictionary *)
    [[NSUserDefaults standardUserDefaults] persistentDomainForName:k_domain_cahceKey_formal];
    return [dic objectForKey:cacheKey];
}

// 缓存key拼接
- (id)cacheKey:(NSString *)key level:(ShCacheLevel)level {
    switch (level) {
        case Default:
            return [NSString stringWithFormat:@"%@",key];
            break;
        case User:
            return [NSString stringWithFormat:@"%@_%@",@"user",key];
            break;
        case Community:
            return [NSString stringWithFormat:@"%@_%@_%@",self.personID,self.communityID,key];
            break;
        case Date:
            return [NSString stringWithFormat:@"%@_%@_%@_%@",self.personID,self.communityID,[self nowDate],key];
            break;
        default:
            break;
    }
}

- (NSString *)personID{
    return @"";
}

- (NSString *)communityID{
    return @"";
}

- (NSString *)nowDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:[NSDate date]];
}

@end

//UserModel

@implementation SHUserModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"userId":@"id",
             @"communities":@"userComList"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"communities":@"ComModel"};
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    return [SHCommonUtils returnNonEmptyStr:oldValue];
    
}
MJCodingImplementation
@end
