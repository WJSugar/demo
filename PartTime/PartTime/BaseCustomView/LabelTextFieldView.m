//
//  LabelTextView.m
//  PartTime
//
//  Created by jinghua on 2017/10/16.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "LabelTextFieldView.h"
#import "UIView+LYAdd.h"

#define kLabelLeftPadding 30
#define kLabelFontSize 15

@implementation LabelTextFieldView {
    UIView *_catchSelfView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    _label = [UILabel new];
    _label.ly_top = 0;
    _label.ly_left = 0;
    _label.ly_width = kScreenWidth / 3;
    _label.textColor = k333333Color;
    _label.font = [UIFont systemFontOfSize:kLabelFontSize];
    _label.textAlignment = NSTextAlignmentRight;
    [self addSubview:_label];
    
    _textField = [UITextField new];
    _textField.ly_top = 0;
    _textField.ly_left = _label.ly_right + 10;
    _textField.ly_width = (kScreenWidth / 3) * 2 - 30;
    _textField.font = [UIFont systemFontOfSize:kLabelFontSize];
    [self addSubview:_textField];
    
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _label.ly_height = self.ly_height;
    _textField.ly_height = self.ly_height;
    
    if (!_catchSelfView) {
        _catchSelfView = [self borderForColor:k999999Color
                                  borderWidth:0.3
                                   borderType:UIBorderSideTypeBottom];
    }
}

@end
