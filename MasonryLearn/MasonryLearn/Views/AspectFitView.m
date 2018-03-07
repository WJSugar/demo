
//
//  AspectFitView.m
//  MasonryLearn
//
//  Created by jinghua on 2017/11/7.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "AspectFitView.h"
#import <Masonry.h>

@interface AspectFitView()
@property UIView *topView;
@property UIView *topInnerView;
@property UIView *bottomView;
@property UIView *bottomInnerView;
@end


@implementation AspectFitView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    // Create views
    self.topView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topInnerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomInnerView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Set background colors
    UIColor *blueColor = [UIColor colorWithRed:0.663 green:0.796 blue:0.996 alpha:1];
    [self.topView setBackgroundColor:blueColor];
    
    UIColor *lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
    [self.topInnerView setBackgroundColor:lightGreenColor];
    
    UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
    [self.bottomView setBackgroundColor:pinkColor];
    
    UIColor *darkGreenColor = [UIColor colorWithRed:0.443 green:0.780 blue:0.337 alpha:1];
    [self.bottomInnerView setBackgroundColor:darkGreenColor];
    
    // Layout top and bottom views to each take up half of the window
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
    }];
    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.topView.mas_bottom);
        make.height.equalTo(self.topView);
    }];
    
    [self.topView addSubview:self.topInnerView];
    [self.topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽度是高度的三倍
        make.width.equalTo(self.topInnerView.mas_height).multipliedBy(3);
        
        make.width.height.lessThanOrEqualTo(self.topView);
        make.width.height.equalTo(self.topView).priorityLow();
        
        make.center.equalTo(self.topView);
    }];
    
    [self.bottomView addSubview:self.bottomInnerView];
    [self.bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.bottomInnerView.mas_width).multipliedBy(3);
        
        make.width.height.lessThanOrEqualTo(self.bottomView);
        make.width.height.equalTo(self.bottomView).priorityLow();
        
        make.center.equalTo(self.bottomView);
    }];

    return self;
}
@end
