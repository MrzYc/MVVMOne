//
//  PublicModel.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/9.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "SuperModelClass.h"

@interface PublicModel : SuperModelClass

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *weiboId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSURL *imageUrl;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *text;


@end
