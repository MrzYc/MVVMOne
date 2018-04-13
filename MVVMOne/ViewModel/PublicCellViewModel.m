//
//  PublicCellViewModel.m
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "PublicCellViewModel.h"

@implementation PublicCellViewModel

- (instancetype)initWithModel:(PublicModel *)model {
    self = [super init];
    if (self) {
        //设置时间
        NSDateFormatter *iosDateFormater = [[NSDateFormatter alloc] init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        iosDateFormater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        NSDate *date = [iosDateFormater dateFromString:model.date];
        
        //目的格式
        NSDateFormatter *resultFormatter = [[NSDateFormatter alloc] init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        self.date = [resultFormatter stringFromDate:date];
        self.userName = model.userName;
        self.text = model.text;
        self.imageUrl = model.imageUrl;
        self.userId = model.userId;
        self.weiboId = model.weiboId;
        self.cellHeight = [Tools countTextHeight:model.text width:80 font:14] + 150;        
    }
    return self;
}

@end
