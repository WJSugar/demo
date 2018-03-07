//
//  ProfileDetailViewHeaderView.m
//  PartTime
//
//  Created by jinghua on 2017/10/26.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ProfileDetailViewHeaderView.h"
#import "UIView+LYAdd.h"

#define kPaddingTop 20
#define kPaddingLeft 15

@implementation ProfileDetailViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    self.backgroundColor = kF2F2F2Color;
    
    _imageView = [UIImageView new];
    _imageView.ly_top = kPaddingTop;
    _imageView.ly_left = kPaddingLeft;
    _imageView.ly_size = CGSizeMake(80, 80);
    [self addSubview:_imageView];
    
    _imageView.layer.cornerRadius = _imageView.ly_size.width / 2;
    _imageView.layer.borderWidth = 0.5;
    _imageView.layer.backgroundColor = kF2F2F2Color.CGColor;
    _imageView.image = [UIImage imageNamed:@"椭圆-2"];
    
    UILabel *nameTipLabel = [UILabel new];
    nameTipLabel.text = @"真实姓名";
    nameTipLabel.ly_top = _imageView.ly_top;
    nameTipLabel.ly_left = _imageView.ly_right + 15;
    nameTipLabel.ly_width = 80;
    nameTipLabel.ly_height = 20;
    nameTipLabel.font = [UIFont systemFontOfSize:15];
    nameTipLabel.textColor = k333333Color;
    [self addSubview:nameTipLabel];
    
    _nameLabel = [UILabel new];
    _nameLabel.ly_top = nameTipLabel.ly_top;
    _nameLabel.ly_left = nameTipLabel.ly_right + 10;
    _nameLabel.ly_width = kScreenWidth - nameTipLabel.ly_right;
    _nameLabel.ly_height = 20;
    _nameLabel.text = @"张小凡";
    _nameLabel.textColor = k666666Color;
    _nameLabel.font = [UIFont systemFontOfSize:13];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_nameLabel];
    
    UILabel *mobileTipLabel = [UILabel new];
    mobileTipLabel.text = @"电话号码";
    mobileTipLabel.ly_left = _imageView.ly_right + 15;
    mobileTipLabel.ly_width = 80;
    mobileTipLabel.ly_height = 20;
    mobileTipLabel.ly_centerY = _imageView.ly_centerY;
    mobileTipLabel.font = [UIFont systemFontOfSize:15];
    mobileTipLabel.textColor = k333333Color;
    [self addSubview:mobileTipLabel];

    _mobileLabel = [UILabel new];
    _mobileLabel.ly_top = mobileTipLabel.ly_top;
    _mobileLabel.ly_left = nameTipLabel.ly_right + 10;
    _mobileLabel.ly_width = kScreenWidth - nameTipLabel.ly_right;
    _mobileLabel.ly_height = 20;
    _mobileLabel.text = @"18265195489";
    _mobileLabel.textColor = k666666Color;
    _mobileLabel.font = [UIFont systemFontOfSize:13];
    _mobileLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_mobileLabel];

    UILabel *idcardTipLabel = [UILabel new];
    idcardTipLabel.text = @"身份证号码";
    idcardTipLabel.ly_left = _imageView.ly_right + 15;
    idcardTipLabel.ly_width = 80;
    idcardTipLabel.ly_height = 20;
    idcardTipLabel.ly_bottom = _imageView.ly_bottom;
    idcardTipLabel.font = [UIFont systemFontOfSize:15];
    idcardTipLabel.textColor = k333333Color;
    [self addSubview:idcardTipLabel];
    
    _idcardLabel = [UILabel new];
    _idcardLabel.ly_top = idcardTipLabel.ly_top;
    _idcardLabel.ly_left = idcardTipLabel.ly_right + 10;
    _idcardLabel.ly_width = kScreenWidth - idcardTipLabel.ly_right;
    _idcardLabel.ly_height = 20;
    _idcardLabel.text = @"37131219******474X";
    _idcardLabel.textColor = k666666Color;
    _idcardLabel.font = [UIFont systemFontOfSize:13];
    _idcardLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_idcardLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLabel.ly_top = _imageView.ly_top;
}

@end
