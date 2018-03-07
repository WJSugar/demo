//
//  ContactUSController.m
//  PartTime
//
//  Created by jinghua on 2017/10/16.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ContactUSController.h"
#import "LabelTextFieldView.h"
#import "UIView+LYAdd.h"

@interface ContactUSController ()

@end

@implementation ContactUSController {
    LabelTextFieldView *_usrNameView;
    LabelTextFieldView *_titleView;
    LabelTextFieldView *_adviceView;
    
    UITextView *_adviceTextView;
    
    UIButton *_submitButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self _initViews];
    [self _initTextView];
    [self _initButton];
}

- (void)submitAction:(UIButton *)button {
    if (   _usrNameView.textField.text.length == 0
        || _titleView.textField.text.length == 0
        || _adviceView.textField.text.length == 0) {
        
        
        return;
    }
    
    
    
    
}

- (void)_initViews {
    NSArray *labels = @[@"     用户名：", @"     标题：", @"     意见与建议："];
    NSArray *placeholders = @[@"", @"", @""];
    for (NSInteger i = 0; i < 3; i++) {
        LabelTextFieldView *ltfView = [LabelTextFieldView new];
        ltfView.ly_top = i * 45 + 64;
        ltfView.ly_left = 0;
        ltfView.ly_width = kScreenWidth;
        ltfView.ly_height = 45;
        ltfView.label.text = labels[i];
        ltfView.label.textAlignment = NSTextAlignmentLeft;
        ltfView.textField.placeholder = placeholders[i];
        [self.view addSubview:ltfView];
        
        switch (i) {
            case 0: {
                _usrNameView = ltfView;
            } break;
                
            case 1: {
                _titleView = ltfView;
            } break;
                
            case 2: {
                _adviceView = ltfView;
            } break;
                
            default:
                break;
        }
    }
}

- (void)_initTextView {
    _adviceTextView = [UITextView new];
    _adviceTextView.ly_top = _adviceView.ly_bottom + 5;
    _adviceTextView.ly_left = 20;
    _adviceTextView.ly_width = kScreenWidth - 2 * 20;
    _adviceTextView.ly_height = 100;
    _adviceTextView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_adviceTextView];
}

- (void)_initButton {
    _submitButton = [self.view standardButton];
    _submitButton.ly_top = _adviceTextView.ly_bottom + 20;
    [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [_submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_submitButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
