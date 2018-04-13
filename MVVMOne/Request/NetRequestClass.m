//
//  NetRequestClass.m
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/9.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "NetRequestClass.h"

@implementation NetRequestClass
+(BOOL)newWorkReachablilityWithURLString:(NSString *)strUrl {
    __block BOOL netState = YES;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                case AFNetworkReachabilityStatusNotReachable:
                case AFNetworkReachabilityStatusUnknown:
                netState = NO;
                break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                case AFNetworkReachabilityStatusReachableViaWWAN:
                netState = YES;
                break;
            default:
                break;
        }
        NSLog(@"%@",AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return netState;
}

//get请求
+(void)GetNetRequestWithRequestURL:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock {
    
    NSMutableDictionary *allParameter = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    [allParameter setValue:ACCESSTOKEN forKey:TOKEN];
    [[AFHTTPSessionManager manager] GET:requestURLString parameters:allParameter progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DDLog(@"%@", error.description);
        failureBlock();
    }];
}

//post请求
+(void)POSTNetRequestWithRequestURL:(NSString *)requestURLString Parameter:(NSDictionary *)parameter WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock {
    [[AFHTTPSessionManager manager] POST:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
}









@end
