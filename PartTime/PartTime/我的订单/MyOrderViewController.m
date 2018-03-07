//
//  MyOrderViewController.m
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderViewCell.h"
#import "UIView+LYAdd.h"
#import "MyOrderModel.h"
#import "MyOrderHeaderView.h"

@interface MyOrderViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *models;
@end

@implementation MyOrderViewController

- (NSMutableArray *)models {
    if (_models == nil) {
        _models = [NSMutableArray new];
    }
    return _models;
}

- (void)makeData {
    for (int i = 0; i < 10; i ++) {
        MyOrderModel *model = [MyOrderModel new];
        model.test0 = @"车贷";
        model.test1 = @"12568";
        model.test2 = @"2017-12-12";
        model.test3 = @"未完成";
        [self.models addObject:model];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeData];
    [self _initTabelView];
}

- (void)_initTabelView {
    self.tableView = [self.view standardTableView];
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 45;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyOrderViewCell class]
           forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *titles = @[@"类型", @"金额", @"时间", @"状态"];
    MyOrderHeaderView *headerView = [[MyOrderHeaderView alloc] initWithTitles:titles];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyOrderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MyOrderModel *model = self.models[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
