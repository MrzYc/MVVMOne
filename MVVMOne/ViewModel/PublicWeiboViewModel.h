//
//  PublicWeiboViewModel.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicCellViewModel.h"

typedef NS_ENUM(NSInteger, WeboRequsetType) {
    ListRequest,
    Other
};

typedef void (^ReturnValueBlockType) (id returnValue, WeboRequsetType);

@interface PublicWeiboViewModel : NSObject

@property (copy, nonatomic) ReturnValueBlockType returnBlock;
@property (copy, nonatomic) ErrorCodeBlock errorBlock;
@property (copy, nonatomic) FailureBlock failureBlock;



// 传入交互的Block块
-(void)setBlockWithReturnBlock:(ReturnValueBlockType)returnBlock WithErrorBlock:(ErrorCodeBlock)errorBlock WithFailureBlock:(FailureBlock)failureBlock;

//设置微博列表
- (void)fetchPublicWeiBo;

/* 其他数据处理 */
- (void)otherDataFetch;




@end
