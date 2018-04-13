//
//  NetRequestClass.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/9.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequestClass : NSObject


#pragma 监测网络的可用情况

+(BOOL)newWorkReachablilityWithURLString:(NSString *)strUrl;

#pragma post请求
+(void)POSTNetRequestWithRequestURL:(NSString *)requestURLString
                      Parameter:(NSDictionary *)parameter
               WithReturnValeuBlock:(ReturnValueBlock) block
                   WithFailureBlock:(FailureBlock) failureBlock;

+(void)GetNetRequestWithRequestURL:(NSString *)requestURLString
                               WithParameter:(NSDictionary *) parameter
                        WithReturnValeuBlock:(ReturnValueBlock) block
                            WithFailureBlock:(FailureBlock) failureBlock;

@end
