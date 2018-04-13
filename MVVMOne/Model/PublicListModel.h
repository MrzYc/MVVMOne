//
//  PublicListModel.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/9.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "SuperModelClass.h"
#import "PublicModel.h"

@interface PublicListModel : SuperModelClass

@property (nonatomic, copy) NSArray<PublicModel *> *publicList;

- (void)fetchPublicWeiBo;

@end
