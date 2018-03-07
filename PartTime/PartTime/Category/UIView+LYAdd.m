//
//  UIView+LYAdd.m
//  LYRefresh
//
//  Created by jinghua on 2017/9/29.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "UIView+LYAdd.h"
#import "UIColor+LYAdd.h"

@implementation UIView (LYAdd)

- (void)setLy_left:(CGFloat)ly_left {
    CGRect frame = self.frame;
    frame.origin.x = ly_left;
    self.frame = frame;
}

- (CGFloat)ly_left {
    return self.frame.origin.x;
}

//top
-(void)setLy_top:(CGFloat)ly_top {
    CGRect frame = self.frame;
    frame.origin.y = ly_top;
    self.frame = frame;
}
-(CGFloat)ly_top {
    return self.frame.origin.y;
}

//right
-(void)setLy_right:(CGFloat)ly_right {
    CGRect frame = self.frame;
    frame.origin.x = ly_right - self.frame.size.width;
    self.frame = frame;
}
-(CGFloat)ly_right {
    return self.frame.origin.x + self.frame.size.width;
}

//bottom
-(void)setLy_bottom:(CGFloat)ly_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ly_bottom - frame.size.height;
    self.frame = frame;
}
-(CGFloat)ly_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

//width
-(void)setLy_width:(CGFloat)ly_width {
    CGRect frame = self.frame;
    frame.size.width = ly_width;
    self.frame = frame;
}
-(CGFloat)ly_width {
    return self.frame.size.width;
}

//height
-(void)setLy_height:(CGFloat)ly_height {
    CGRect frame = self.frame;
    frame.size.height = ly_height;
    self.frame = frame;
}
-(CGFloat)ly_height {
    return self.frame.size.height;
}

//centerX
-(void)setLy_centerX:(CGFloat)ly_centerX {
    self.center = CGPointMake(ly_centerX, self.center.y);
}
-(CGFloat)ly_centerX {
    return self.center.x;
}

//centerY
-(void)setLy_centerY:(CGFloat)ly_centerY {
    self.center = CGPointMake(self.center.x, ly_centerY);
}
-(CGFloat)ly_centerY {
    return self.center.y;
}

//size
-(void)setLy_size:(CGSize)ly_size {
    CGRect frame = self.frame;
    frame.size = ly_size;
    self.frame = frame;
}
-(CGSize)ly_size {
    return self.frame.size;
}

//origin
-(void)setLy_origin:(CGPoint)ly_origin {
    CGRect frame = self.frame;
    frame.origin = ly_origin;
    self.frame = frame;
}
-(CGPoint)ly_origin {
    return self.frame.origin;
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIButton *)standardButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.ly_left = 20;
    button.ly_width = kScreenWidth - 2 * 20;
    button.ly_height = 30;
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    button.backgroundColor = kFA5457Color;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return button;
}

- (UIScrollView *)standardScrollView {
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.ly_top = 0;
    scrollView.ly_left = 0;
    scrollView.ly_width = kScreenWidth;
    scrollView.ly_height = kScreenHeight;
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = kF2F2F2Color;
    return scrollView;
}

- (UITableView *)standardTableView {
    UITableView *tableView = [UITableView new];
    tableView.ly_top = 0;
    tableView.ly_left = 0;
    tableView.ly_width = kScreenWidth;
    tableView.ly_height = kScreenHeight;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    return tableView;
}

- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType {
    
    if (borderType == UIBorderSideTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = color.CGColor;
        return self;
    }
    
    
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth]];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    return self;
}

- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    return shapeLayer;
}

@end
