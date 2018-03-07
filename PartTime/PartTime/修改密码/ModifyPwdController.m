//
//  ModifyPwdController.m
//  PartTime
//
//  Created by jinghua on 2017/10/16.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ModifyPwdController.h"
#import "LabelTextFieldView.h"
#import "UIView+LYAdd.h"

@interface ModifyPwdController ()

@end

@implementation ModifyPwdController {
    LabelTextFieldView *_oldPwdView;
    LabelTextFieldView *_newPwdView;
    LabelTextFieldView *_confirmPwdView;
    
    UIButton *_submitButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kF2F2F2Color;
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    [self _initViews];
    
    _submitButton = [self.view standardButton];
    _submitButton.ly_top = _confirmPwdView.ly_bottom + 20;
    [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [_submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_submitButton];
}

- (void)submitAction:(UIButton *)button {
    if (   _oldPwdView.textField.text.length == 0
        || _newPwdView.textField.text.length == 0
        || _confirmPwdView.textField.text.length == 0) {
    
        
        return;
    }
    
    
    
    
}

- (void)_initViews {
    NSArray *labels = @[@"输入旧密码", @"输入新密码", @"确定新密码"];
    NSArray *placeholders = @[@"请输入旧密码", @"请输入新密码", @"请确定新密码"];
    for (NSInteger i = 0; i < 3; i++) {
        LabelTextFieldView *ltfView = [LabelTextFieldView new];
        ltfView.ly_top = i * 45 + 64;
        ltfView.ly_left = 0;
        ltfView.ly_width = kScreenWidth;
        ltfView.ly_height = 45;
        ltfView.label.text = labels[i];
        ltfView.textField.placeholder = placeholders[i];
        [self.view addSubview:ltfView];
        
        switch (i) {
            case 0: {
                _oldPwdView = ltfView;
            } break;
                
            case 1: {
                _newPwdView = ltfView;
            } break;

            case 2: {
                _confirmPwdView = ltfView;
            } break;
                
            default:
                break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
