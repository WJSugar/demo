//
//  UIView+LYAdd.h
//  LYRefresh
//
//  Created by jinghua on 2017/9/29.
//  Copyright © 2017年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+LYAdd.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define k333333Color [UIColor colorWithHex:@"333333"]
#define k666666Color [UIColor colorWithHex:@"666666"]
#define k999999Color [UIColor colorWithHex:@"999999"]
#define kFA5457Color [UIColor colorWithHex:@"FA5457"]
#define kCCCCCCColor [UIColor colorWithHex:@"CCCCCC"]
#define kF2F2F2Color [UIColor colorWithHex:@"F2F2F2"]


typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};

@interface UIView (LYAdd)
/**
 *  Shortcut for frame.origin.x
 */
@property (nonatomic) CGFloat ly_left;
/**
 *  Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat ly_top;

/**
 *  Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat ly_right;

/**
 *  Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat ly_bottom;

/**
 *  Shortcut for frame.size.width
 */
@property (nonatomic) CGFloat ly_width;

/**
 *  Shortcut for frame.size.height
 */
@property (nonatomic) CGFloat ly_height;

/**
 *  Shortcut for frame.center.x
 *  ⚠️Warming : set frame.size before set this property
 */
@property (nonatomic) CGFloat ly_centerX;

/**
 *  Shortcut for frame.center.y
 *  ⚠️Warming : set frame.size before set this property
 */
@property (nonatomic) CGFloat ly_centerY;

/**
 *  Shortcut for frame.size
 */
@property (nonatomic) CGSize ly_size;

/**
 *  Shortcut for frame.origin
 */
@property (nonatomic) CGPoint ly_origin;

/**
 *  parentViewController
 */
- (UIViewController *)viewController;

- (UIButton *)standardButton;

- (UIScrollView *)standardScrollView;

- (UITableView *)standardTableView;

- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
@end
