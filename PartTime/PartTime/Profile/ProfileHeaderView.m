//
//  ProfileHeaderView.m
//  PartTime
//
//  Created by jinghua on 2017/10/16.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ProfileHeaderView.h"
#import "UIView+LYAdd.h"


#define kHeaderTopPadding 20
#define kHeaderSize CGSizeMake(80, 80)

#define kNameLabelTopPadding 5
#define kNameLabelHeight 20
#define kNameLabelFontSize 15

#define kMobileButtonPadding 2
#define kMobileButtonWidth 200
#define kMobileButtonHeight 20
#define kMobileButtonFontSize 12


@implementation ProfileHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    _headerView = [UIImageView new];
    _headerView.ly_size = kHeaderSize;
    _headerView.layer.borderWidth = 1;
    _headerView.layer.borderColor = kFA5457Color.CGColor;
    _headerView.layer.cornerRadius = kHeaderSize.width / 2;
    _headerView.userInteractionEnabled = YES;
    [self addSubview:_headerView];
    
    _nameLabel = [UILabel new];
    _nameLabel.ly_left = 0;
    _nameLabel.ly_width = kScreenWidth;
    _nameLabel.ly_height = kNameLabelHeight;
    _nameLabel.font = [UIFont systemFontOfSize:kNameLabelFontSize];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = @"刘晓燕";
    [self addSubview:_nameLabel];
    
    _mobileButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _mobileButton.ly_left = (kScreenWidth - kMobileButtonWidth) / 2;
    _mobileButton.ly_size = CGSizeMake(kMobileButtonWidth,
                                       kMobileButtonHeight);
    _mobileButton.titleLabel.font = [UIFont systemFontOfSize:12];
    UIImage *mobileIcon = [[UIImage imageNamed:@"电话"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_mobileButton setImage:mobileIcon forState:UIControlStateNormal];
    [_mobileButton setTitle:@"18265195489" forState:UIControlStateNormal];
    [_mobileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_mobileButton];
    
    [_mobileButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _headerView.ly_top = kHeaderTopPadding;
    _headerView.ly_centerX = self.ly_centerX;
    
    _nameLabel.ly_top = _headerView.ly_bottom + kNameLabelTopPadding;

    _mobileButton.ly_top = _nameLabel.ly_bottom + kMobileButtonPadding;
}

@end
