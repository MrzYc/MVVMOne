//
//  PublicCell.m
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "PublicCell.h"


@interface PublicCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UITextView *weiboText;

@end

@implementation PublicCell

- (void)bindCellViewModel:(PublicCellViewModel *)cellViewModel {
    _userName.text = cellViewModel.userName;
    _date.text = cellViewModel.date;
    _weiboText.text = cellViewModel.text;
    [_headImageView sd_setImageWithURL:cellViewModel.imageUrl];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
