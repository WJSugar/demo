//
//  BankCardManagedController.m
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "BankCardManagedController.h"
#import "BankCardManagedCell.h"
#import "UIView+LYAdd.h"
#import "BankCardManagedModel.h"
#import "BankCardManagedHeaderView.h"

@interface BankCardManagedController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *models;
@end

@implementation BankCardManagedController

- (NSMutableArray *)models {
    if (_models == nil) {
        _models = [NSMutableArray new];
    }
    return _models;
}

- (void)makeData {
    for (int i = 0; i < 10; i ++) {
        BankCardManagedModel *model = [BankCardManagedModel new];
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
    [self.tableView registerClass:[BankCardManagedCell class]
           forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *titles = @[@"户名", @"开户行", @"卡号"];
    BankCardManagedHeaderView *headerView = [[BankCardManagedHeaderView alloc] initWithTitles:titles];
    headerView.block = ^(UIButton *button) {
        NSLog(@"button");
    };
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BankCardManagedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    BankCardManagedModel *model = self.models[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
