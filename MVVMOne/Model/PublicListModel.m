//
//  PublicListModel.m
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/9.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "PublicListModel.h"

@implementation PublicListModel

- (void)fetchPublicWeiBo {
    NSDictionary *parameter = @{COUNT: @"100"};
    [NetRequestClass GetNetRequestWithRequestURL:REQUESTPUBLICURL WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        DDLog(@"%@",returnValue);
        [self fetchValueSuccessWithDic:returnValue];
    } WithFailureBlock:^{
        [self netFailure];
        DDLog(@"网络异常");
    }];
}


-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue {
    NSArray *statues = returnValue[STATUSES];
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statues.count];
    
    for (int i = 0; i < statues.count; i++) {
        PublicModel *publicModel = [[PublicModel alloc] init];
        publicModel.date = statues[i][CREATETIME];
        publicModel.userName = statues[i][USER][USERNAME];
        publicModel.text = statues[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statues[i][USER][HEADIMAGEURL]];
        publicModel.userId = statues[i][USER][UID];
        publicModel.weiboId = statues[i][WEIBOID];
        [publicModelArray addObject:publicModel];
    }
    self.publicList = publicModelArray;
    self.returnBlock(self);
}

/* 对errorCode进行处理*/
-(void)errorCodeWithDic: (NSDictionary *) errorDic {
    self.errorBlock(errorDic);
}


/**
 对网路异常进行处理
 */
-(void)netFailure {
    self.failureBlock();
}

- (void)dealloc
{
    DDLog(@"PublicListModel - 释放");
}


















@end
