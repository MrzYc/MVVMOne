//
//  PublicTableViewController.m
//  MVVMOne
//
//  Created by 赵永闯 on 2018/4/12.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "PublicTableViewController.h"
#import "PublicWeiboViewModel.h"
#import "PublicCell.h"
#import "PublicDetailViewController.h"


@interface PublicTableViewController ()

@property (nonatomic, copy) NSArray <PublicCellViewModel *> *publicModelArray;
/** 数据模型 */
@property (nonatomic, strong) PublicWeiboViewModel *publicViewModel;

@end

@implementation PublicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createViewModel];
}

- (void)createViewModel {
    self.publicViewModel = [[PublicWeiboViewModel alloc] init];
    __weak typeof (self) weak_self = self;
    [self.publicViewModel setBlockWithReturnBlock:^(id returnValue, WeboRequsetType requestType) {
        [weak_self handelRequestData:returnValue reqeustType:requestType];
    } WithErrorBlock:^(id errorCode) {
        [SVProgressHUD dismiss];
    } WithFailureBlock:^{
        [SVProgressHUD dismiss];
    }];
    
    [self.publicViewModel fetchPublicWeiBo];
    [SVProgressHUD showWithStatus:@"正在获取用户信息……" maskType:SVProgressHUDMaskTypeBlack];
    
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.publicViewModel otherDataFetch];
    });
}

-(void)handelRequestData:(id)returnValue reqeustType:(WeboRequsetType)type {
    [SVProgressHUD dismiss];
    
    switch (type) {
            case ListRequest:
                _publicModelArray = returnValue;
                [self.tableView reloadData];
                break;
            case Other:
                [SVProgressHUD showSuccessWithStatus:returnValue];
                break;
        default:
            break;
    }
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _publicModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublicCell" forIndexPath:indexPath];
    [cell bindCellViewModel:_publicModelArray[indexPath.row]];
    return cell;
}

#pragma mark -- UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicCellViewModel *cellViewModel = _publicModelArray[indexPath.row];
    return cellViewModel.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self weiboDetailWithPublicModel:_publicModelArray[indexPath.row]];
}

/**
 跳转到详情页面，如需网路请求的，可在此方法中添加相应的网络请求
 @param cellViewModel 传到下一个页面的值
*/

- (void)weiboDetailWithPublicModel:(PublicCellViewModel *)cellViewModel {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PublicDetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"PublicDetailViewController"];
    detailController.cellViewModel = cellViewModel;
    [self.navigationController pushViewController:detailController animated:YES];
}

- (void)dealloc {
    DDLog(@"PublicTableViewController - 释放");
}



@end
