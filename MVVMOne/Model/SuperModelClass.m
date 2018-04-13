//
//  SuperModelClass.m
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/9.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "SuperModelClass.h"

@implementation SuperModelClass

-(void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock WithErrorBlock:(ErrorCodeBlock)errorBlock WithFailureBlock:(FailureBlock)failureBlock {
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

@end
