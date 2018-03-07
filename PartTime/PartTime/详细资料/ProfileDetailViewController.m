//
//  ProfileDetailViewController.m
//  PartTime
//
//  Created by jinghua on 2017/10/23.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ProfileDetailViewController.h"
#import "ProfileDetailViewHeaderView.h"
#import "UIView+LYAdd.h"
#import "ProfileDetailViewCell.h"
#import "ModifyProfileInfoController.h"

@interface ProfileDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, strong) NSMutableArray *tips;
@property (nonatomic, strong) NSMutableArray *contents;
@end

@implementation ProfileDetailViewController {
    ProfileDetailViewHeaderView *_headerView;
    UIButton *_modifyButton;
}

- (NSMutableArray *)tips {
    if (_tips == nil) {
        _tips = [NSMutableArray new];
        [_tips addObject:@"现居住地址"];
        [_tips addObject:@"紧急联系人"];
        [_tips addObject:@"紧急联系人电话"];
        [_tips addObject:@"身份证信息"];
    }
    return _tips;
}

- (NSMutableArray *)contents {
    if (_contents == nil) {
        _contents = [NSMutableArray new];
        [_contents addObject:@"重庆市金开大道52号 D栋25-1"];
        [_contents addObject:@"张小凡"];
        [_contents addObject:@"18265195489"];
        [_contents addObject:@"已上传"];
    }
    return _contents;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.title = @"详细资料";
    [self initHeaderView];
    [self initTabelView];
    [self initLogoutButton];
}

- (void)initHeaderView {
    _headerView = [ProfileDetailViewHeaderView new];
    _headerView.ly_top = 64;
    _headerView.ly_left = 0;
    _headerView.ly_width = kScreenWidth;
    _headerView.ly_height = 120;
    [self.view addSubview:_headerView];
}

- (void)initTabelView {
    _tabelView = [self.view standardTableView];
    _tabelView.ly_top = _headerView.ly_bottom;
    _tabelView.ly_left = 0;
    _tabelView.ly_width = kScreenWidth;
    _tabelView.ly_height = 30 * 4 + 20;
    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    _tabelView.rowHeight = 30;
    _tabelView.scrollEnabled = NO;

    _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tabelView registerClass:[ProfileDetailViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tabelView];
}

- (void)initLogoutButton {
    _modifyButton = [self.view standardButton];
    _modifyButton.ly_top = _tabelView.ly_bottom + 40;
    [_modifyButton setTitle:@"修改资料" forState:UIControlStateNormal];
    [self.view addSubview:_modifyButton];
    
    [_modifyButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)button {
    ModifyProfileInfoController *vc = [ModifyProfileInfoController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProfileDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *content = self.contents[indexPath.row];
    NSString *tip = self.tips[indexPath.row];
    cell.contentLabel.text = content;
    cell.tipLabel.text = tip;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
