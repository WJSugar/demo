//
//  ProfileMenuCell.m
//  PartTime
//
//  Created by jinghua on 2017/10/16.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ProfileMenuCell.h"
#import "UIView+LYAdd.h"
#import "ProfileMenuModel.h"
#import "UIColor+LYAdd.h"

#define kImageViewLeftPadding 30
#define kImageViewSize CGSizeMake(20, 20)

#define kLabelLeftPadding 30
#define kLabelFontSize 13

@implementation ProfileMenuCell {
    UIImageView *_imageView;
    UILabel *_label;
    UIView *_line;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    _imageView = [UIImageView new];
    _imageView.ly_left = kImageViewLeftPadding;
    _imageView.ly_size = kImageViewSize;
    _imageView.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:_imageView];
    
    _label = [UILabel new];
    _label.ly_left = _imageView.ly_right + kLabelLeftPadding;
    _label.ly_width = kScreenWidth - _label.ly_right - 30;
    _label.ly_height = 20;
    _label.textColor = [UIColor colorWithHex:@"666666"];
    _label.font = [UIFont systemFontOfSize:kLabelFontSize];
    [self.contentView addSubview:_label];
    
    _line = [UIView new];
    _line.ly_left = 0;
    _line.ly_size = CGSizeMake(kScreenWidth, 0.5);
    _line.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    [self.contentView addSubview:_line];

    return self;
}

- (void)setModel:(ProfileMenuModel *)model {
    _imageView.image = [UIImage imageNamed:model.image];
    _label.text = model.text;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _imageView.ly_centerY = self.contentView.ly_centerY;
    _label.ly_centerY = self.contentView.ly_centerY;
    _line.ly_bottom = self.contentView.ly_bottom;
}

@end
