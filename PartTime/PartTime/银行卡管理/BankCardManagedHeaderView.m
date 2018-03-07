//
//  BankCardManagedHeaderView.m
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "BankCardManagedHeaderView.h"
#import "UIView+LYAdd.h"

@implementation BankCardManagedHeaderView {
    UIButton *_addButton;
}

- (instancetype)initWithTitles:(NSArray *)titles {
    self = [super init];
    if (!self) return nil;
    [self setupViewWithTitles:titles];
    self.backgroundColor = kF2F2F2Color;
    return self;
}

- (void)setupViewWithTitles:(NSArray *)titles {
    CGFloat w = kScreenWidth / 4.0;
    for (NSInteger i = 0; i < titles.count; i++) {
        UILabel *label = [UILabel new];
        label.ly_top = 0;
        label.ly_left = i * w;
        label.ly_width = w;
        label.ly_height = 45;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = k333333Color;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label.text = titles[i];
    }
    
    _addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    _addButton.ly_top = 0;
    _addButton.ly_left = kScreenWidth - 15 - 45;
    _addButton.ly_size = CGSizeMake(45, 45);
    [self addSubview:_addButton];
    [_addButton addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addButtonAction:(UIButton *)button {
    if (_block) {
        _block(button);
    }
}


@end
