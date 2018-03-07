//
//  AttributedStringTextView.m
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "AttrStrAndBtnActionView.h"
#import "UIView+LYAdd.h"

#define kBGViewLeftPadding 20

#define kTextViewFontSize 13
#define kTextViewTopPadding 10
#define kTextViewLeftPadding 20
#define kTextViewHeight kScreenHeight / 2

#define kButtonTopPadding 20
#define kButtonBottomPadding 10

@implementation AttrStrAndBtnActionView {
    UIScrollView *_scrollView;
    UIView *_bgView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    _scrollView = [self standardScrollView];
    [self addSubview:_scrollView];
    
    _bgView = [UIView new];
    _bgView.ly_top = 30;
    _bgView.ly_left = kBGViewLeftPadding;
    _bgView.ly_width = kScreenWidth - 2 * kBGViewLeftPadding;
    _bgView.ly_height =   kTextViewHeight
                        + kTextViewTopPadding
                        + kButtonTopPadding
                        + kButtonBottomPadding + 30;
    
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.layer.cornerRadius = 5;
    _bgView.layer.shadowColor = k999999Color.CGColor;
    _bgView.layer.shadowOffset = CGSizeMake(0, 2);
    _bgView.layer.shadowOpacity = 0.8;
    _bgView.layer.shadowRadius = 1;
    [_scrollView addSubview:_bgView];
    
    _textView = [UITextView new];
    _textView.ly_top = kTextViewTopPadding;
    _textView.ly_left = kTextViewLeftPadding;
    _textView.ly_width = _bgView.ly_width - 2 * kTextViewLeftPadding;
    _textView.ly_height = kTextViewHeight;
    _textView.editable = NO;
    _textView.textColor = k333333Color;
    _textView.showsVerticalScrollIndicator = NO;
    _textView.font = [UIFont systemFontOfSize:kTextViewFontSize];
    [_bgView addSubview:_textView];
    
    _button = [self standardButton];
    _button.ly_width = _textView.ly_width - 10;
    [_bgView addSubview:_button];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _textView.ly_height = _textView.contentSize.height;
    _button.ly_top = _textView.ly_bottom + kButtonTopPadding;
    _button.ly_centerX = _textView.ly_centerX;
    
    _bgView.ly_height =   _textView.ly_height
                        + kTextViewTopPadding
                        + kButtonTopPadding
                        + kButtonBottomPadding + 30;
    
    _scrollView.contentSize = CGSizeMake(kScreenWidth, _bgView.ly_bottom + 30);
}

@end
