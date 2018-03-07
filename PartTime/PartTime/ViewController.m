//
//  ViewController.m
//  PartTime
//
//  Created by jinghua on 2017/10/16.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LYAdd.h"
#import "ProfileHeaderView.h"
#import "ProfileMenuCell.h"
#import "ProfileMenuModel.h"

#import "ProfileDetailViewController.h"
#import "BankCardManagedController.h"
#import "MyOrderViewController.h"
#import "AttrStrAndBtnActionController.h"
#import "ContactUSController.h"
#import "ModifyPwdController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *menuTabelView;
@property (nonatomic, strong) NSMutableArray *models;
@end

@implementation ViewController {
    UIScrollView *_scrollView;
    ProfileHeaderView *_headerView;
    UIButton *_logoutButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self _initScrollView];
    [self _initHeaderView];
    [self _initTabelView];
    [self _initLogoutButton];
}

- (void)_initScrollView {
    _scrollView = [self.view standardScrollView];
    _scrollView.ly_top = 64;
    _scrollView.ly_left = 0;
    _scrollView.ly_width = kScreenWidth;
    _scrollView.ly_height = kScreenHeight - 44 - 44 - 20;
    _scrollView.alwaysBounceVertical = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.backgroundColor = kF2F2F2Color;
    [self.view addSubview:_scrollView];
}

- (void)_initHeaderView {
    _headerView = [ProfileHeaderView new];
    _headerView.ly_top = 0;
    _headerView.ly_left = 0;
    _headerView.ly_width = kScreenWidth;
    _headerView.ly_height = 160;
    _headerView.backgroundColor = kF2F2F2Color;
    [_scrollView addSubview:_headerView];
    _headerView.headerView.image = [UIImage imageNamed:@"椭圆-2"];
}

- (void)_initTabelView {
    _menuTabelView = [self.view standardTableView];
    _menuTabelView.ly_top = _headerView.ly_bottom;
    _menuTabelView.ly_left = 0;
    _menuTabelView.ly_width = kScreenWidth;
    _menuTabelView.ly_height = 7 * 45;
    _menuTabelView.dataSource = self;
    _menuTabelView.delegate = self;
    _menuTabelView.rowHeight = 45;
    _menuTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_menuTabelView registerClass:[ProfileMenuCell class] forCellReuseIdentifier:@"cell"];
    [_scrollView addSubview:_menuTabelView];
    _scrollView.contentSize = CGSizeMake(kScreenWidth, _menuTabelView.ly_bottom + 20);
}

- (NSMutableArray *)makeModels {
    NSArray *imageNames = @[@"资料", @"银行卡-(1)", @"订单", @"邀请码", @"消息-(4)", @"联系", @"密码-(1)"];
    NSArray *texts = @[@"详细资料", @"银行卡管理", @"我的订单",
                        @"使用帮助", @"我的推荐码", @"联系我们", @"修改密码"];
    NSMutableArray *models = [NSMutableArray new];
    for (NSInteger i = 0; i < imageNames.count; i++) {
        ProfileMenuModel *model = [ProfileMenuModel new];
        model.image = imageNames[i];
        model.text = texts[i];
        [models addObject:model];
    }
    return models;
}

- (NSMutableArray *)models {
    if (_models == nil) {
        _models = [NSMutableArray new];
        _models = [self makeModels];
    }
    return _models;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProfileMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ProfileMenuModel *model = self.models[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
            
        case 0: {
            ProfileDetailViewController *vc = [ProfileDetailViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
            
        case 1: {
            BankCardManagedController *vc = [BankCardManagedController new];
            [self.navigationController pushViewController:vc animated:YES];
        } break;

        case 2: {
            MyOrderViewController *vc = [MyOrderViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        } break;

        case 3: {
            AttrStrAndBtnActionController *vc = [AttrStrAndBtnActionController new];
            vc.buttonTitle = @"生成邀请码";
            vc.content = @"在通";
            vc.block = ^(UITextView *textView, UIButton *button) {
                NSLog(@"%@---%@", textView, button);
            };
            [self.navigationController pushViewController:vc animated:YES];
        } break;

        case 4: {
            AttrStrAndBtnActionController *vc = [AttrStrAndBtnActionController new];
            vc.buttonTitle = @"生成邀请码";
            vc.content = @"在通";
            vc.block = ^(UITextView *textView, UIButton *button) {
                NSLog(@"%@---%@", textView, button);
            };
            [self.navigationController pushViewController:vc animated:YES];
        } break;

        case 5: {
            ContactUSController *vc = [ContactUSController new];
            [self.navigationController pushViewController:vc animated:YES];

        } break;

        case 6: {
            ModifyPwdController *vc = [ModifyPwdController new];
            [self.navigationController pushViewController:vc animated:YES];
        } break;

        default:
            break;
    }
}

- (void)_initLogoutButton {
    _logoutButton = [self.view standardButton];
    _logoutButton.ly_top = _menuTabelView.ly_bottom + 20;
    [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [_scrollView addSubview:_logoutButton];
    _scrollView.contentSize = CGSizeMake(kScreenWidth, _logoutButton.ly_bottom + 30);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
