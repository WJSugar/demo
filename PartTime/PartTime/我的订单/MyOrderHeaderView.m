//
//  MyOrderHeaderView.m
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "MyOrderHeaderView.h"
#import "UIView+LYAdd.h"

@implementation MyOrderHeaderView

- (instancetype)initWithTitles:(NSArray *)titles {
    self = [super init];
    if (!self) return nil;
    [self setupViewWithTitles:titles];
    self.backgroundColor = kF2F2F2Color;
    return self;
}

- (void)setupViewWithTitles:(NSArray *)titles {
    CGFloat w = kScreenWidth / (CGFloat)titles.count;
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
}

@end
