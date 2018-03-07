//
//  ConstantsView.m
//  MasonryLearn
//
//  Created by jinghua on 2017/11/7.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ConstantsView.h"
#import <Masonry.h>

@implementation ConstantsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) nil;
    
    UIView *purpleView = UIView.new;
    purpleView.backgroundColor = UIColor.purpleColor;
    purpleView.layer.borderColor = UIColor.blackColor.CGColor;
    purpleView.layer.borderWidth = 2;
    [self addSubview:purpleView];
    
    UIView *orangeView = UIView.new;
    orangeView.backgroundColor = UIColor.orangeColor;
    orangeView.layer.borderColor = UIColor.blackColor.CGColor;
    orangeView.layer.borderWidth = 2;
    [self addSubview:orangeView];

    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@(20));
        make.bottom.equalTo(@(-20));
        make.right.equalTo(@(-20));
    }];
    
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(0, 50));
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    
    return self;
}
@end
