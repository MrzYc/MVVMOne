//
//  PublicDetailViewController.m
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "PublicDetailViewController.h"

@interface PublicDetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UITextView *textLable;

@end

@implementation PublicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setContent];

}

- (void)setContent {
    _userNameLabel.text = _cellViewModel.userName;
    _timeLabel.text = _cellViewModel.date;
    _textLable.text = _cellViewModel.text;
    [_headImageView sd_setImageWithURL:_cellViewModel.imageUrl];
}


@end
