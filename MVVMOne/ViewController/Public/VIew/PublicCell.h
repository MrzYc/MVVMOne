//
//  PublicCell.h
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicCellViewModel.h"

@interface PublicCell : UITableViewCell

- (void)bindCellViewModel:(PublicCellViewModel *)cellViewModel;

@end
