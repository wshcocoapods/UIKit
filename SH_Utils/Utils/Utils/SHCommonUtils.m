
//
//  SHCommonUtils.m
//  SH_Utils
//
//  Created by weish on 2019/5/27.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "SHCommonUtils.h"

@implementation SHCommonUtils

+(NSString *)returnNonEmptyStr:(id)obj{
    if (obj == nil || obj == [NSNull null] ||
        ([obj isKindOfClass:[NSString class]] && [obj length] == 0))
    {
        return @"";
    }
    else if ([obj isKindOfClass:[NSNumber class]])
    {
        return [obj stringValue];
    }else if([obj isKindOfClass:[NSString class]]){
        if([obj isEqual:@"null"])
        {
            return @"";
        }else
        {
            return obj;
        }
    }
    return obj;
}
@end
