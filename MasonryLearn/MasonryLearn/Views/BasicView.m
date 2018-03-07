//
//  BasicView.m
//  MasonryLearn
//
//  Created by jinghua on 2017/5/27.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "BasicView.h"
#import <Masonry.h>

@implementation BasicView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = [UIColor blackColor].CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];

    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = [UIColor blackColor].CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];

    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = [UIColor blackColor].CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];

    UIView *superView = self;
    CGFloat padding = 10;

    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(superView.mas_top).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(redView.mas_left).offset(-padding);
        make.width.equalTo(redView.mas_width);

        make.height.equalTo(redView.mas_height);
        make.height.equalTo(blueView.mas_height);
    }];

    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_top);
        make.left.equalTo(greenView.mas_right).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(superView.mas_right).offset(-padding);

        make.width.equalTo(greenView.mas_width);
        make.height.equalTo(greenView.mas_height);
        make.height.equalTo(blueView.mas_height);
    }];

    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.bottom.equalTo(superView.mas_bottom).offset(-padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.height.equalTo(greenView.mas_height);
        make.height.equalTo(redView.mas_height);
    }];
    
    
    return self;
}


@end
