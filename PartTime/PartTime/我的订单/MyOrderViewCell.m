//
//  MyOrderViewCell.m
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "MyOrderViewCell.h"
#import "MyOrderModel.h"
#import "UIView+LYAdd.h"

@interface MyOrderViewCell()
@property (nonatomic, strong) NSMutableArray *labels;
@end

@implementation MyOrderViewCell {
    UIView *_line;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    [self setupViews];
    _line = [UIView new];
    _line.ly_left = 0;
    _line.ly_width = kScreenWidth;
    _line.ly_height = 0.5;
    _line.backgroundColor = kF2F2F2Color;
    [self.contentView addSubview:_line];
    return self;
}

- (void)setModel:(MyOrderModel *)model {
    _model = model;
    NSArray *array = @[_model.test0, _model.test1, _model.test2, _model.test3];
    for (NSInteger i = 0; i < 4; i++) {
        UILabel *label = self.labels[i];
        label.text = array[i];
    }
}

- (void)setupViews {
    CGFloat w = kScreenWidth / 4.0;
    for (NSInteger i = 0; i < 4; i++) {
        UILabel *label = [UILabel new];
        label.ly_top = 0;
        label.ly_left = i * w;
        label.ly_width = w;
        label.ly_height = 45;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = k333333Color;
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        [self.labels addObject:label];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _line.ly_bottom = self.contentView.ly_bottom;
}

- (NSMutableArray *)labels {
    if (_labels == nil) {
        _labels = [NSMutableArray new];
    }
    return _labels;
}

@end
