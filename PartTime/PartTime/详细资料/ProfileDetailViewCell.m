//
//  ProfileDetailViewCell.m
//  PartTime
//
//  Created by jinghua on 2017/10/26.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ProfileDetailViewCell.h"
#import "UIView+LYAdd.h"

@implementation ProfileDetailViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    _tipLabel = [UILabel new];
    _tipLabel.ly_top = 5;
    _tipLabel.ly_left = 20;
    _tipLabel.ly_width = 120;
    _tipLabel.ly_height = 20;
    _tipLabel.textColor = k333333Color;
    _tipLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_tipLabel];
    _tipLabel.text = @"test";
    
    
    _contentLabel = [UILabel new];
    _contentLabel.ly_top = _tipLabel.ly_top;
    _contentLabel.ly_left = _tipLabel.ly_right + 10;
    _contentLabel.ly_width = kScreenWidth - _tipLabel.ly_right - 10 - 20;
    _contentLabel.ly_height = _tipLabel.ly_height;
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.textColor = k666666Color;
    [self addSubview:_contentLabel];
    _contentLabel.adjustsFontSizeToFitWidth = YES;
    
    self.selectedBackgroundView = [UIView new];
    return self;
}
@end
