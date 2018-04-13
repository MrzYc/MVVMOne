//
//  SuperModelClass.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/9.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperModelClass : NSObject

@property (nonatomic, copy) ReturnValueBlock returnBlock;
@property (nonatomic, copy) ErrorCodeBlock errorBlock;
@property (nonatomic, copy) FailureBlock failureBlock;

//传入交互的Block块
- (void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock
                 WithErrorBlock:(ErrorCodeBlock)errorBlock
               WithFailureBlock:(FailureBlock)failureBlock;

@end
