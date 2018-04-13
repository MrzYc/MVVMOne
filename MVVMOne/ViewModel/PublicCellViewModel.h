//
//  PublicCellViewModel.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicModel.h"
@interface PublicCellViewModel : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *weiboId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *imageUrl;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) CGFloat cellHeight;

- (instancetype)initWithModel:(PublicModel *)model;


@end
