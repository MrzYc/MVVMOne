//
//  PublicDetailViewController.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "PublicCellViewModel.h"

@interface PublicDetailViewController : UIViewController

@property (strong, nonatomic) PublicCellViewModel *cellViewModel;

@end
