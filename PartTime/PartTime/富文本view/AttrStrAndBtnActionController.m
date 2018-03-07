//
//  AttrStrAndBtnActionController.m
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "AttrStrAndBtnActionController.h"
#import "AttrStrAndBtnActionView.h"

@interface AttrStrAndBtnActionController ()
@property (nonatomic, strong) AttrStrAndBtnActionView *asbaView;
@end

@implementation AttrStrAndBtnActionController

- (AttrStrAndBtnActionView *)asbaView {
    if (_asbaView == nil) {
        _asbaView = [AttrStrAndBtnActionView new];
        _asbaView.frame = self.view.bounds;
        [_asbaView.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _asbaView;
}

- (void)setContent:(NSString *)content {
    _content = content;
    self.asbaView.textView.text = content;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self.asbaView.button setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.asbaView];
}

- (void)buttonAction:(UIButton *)button {
    if (_block) {
        UITextView *textView = _asbaView.textView;
        UIButton *button = _asbaView.button;
        _block(textView, button);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
