//
//  ViewController.m
//  PathTest
//
//  Created by jinghua on 16/10/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGPathRef oldPath;
@property (nonatomic, assign) CGPathRef newPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _shapeLayer = [CAShapeLayer new];
    _shapeLayer.borderWidth = 0.5f;
    _shapeLayer.frame = CGRectMake(0, 0, 200, 200);
    _shapeLayer.position = self.view.center;
    _shapeLayer.path = [self createPath].CGPath;
    _shapeLayer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.shapeLayer];
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(event) userInfo:nil repeats:YES];
}

- (void)event {
    _oldPath = _shapeLayer.path;
    _newPath = [self createPath].CGPath;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 0.5;
    animation.fromValue = (__bridge id)(_oldPath);
    animation.toValue = (__bridge id)_newPath;
    _shapeLayer.path = _newPath;
    [_shapeLayer addAnimation:animation forKey:@"animationPath"];
}

- (UIBezierPath *)createPath {
    static int count = 0;
    CGFloat controlPoint1_x = 0;
    CGFloat controlPoint1_y = 0;
    CGFloat controlPoint2_x = 0;
    CGFloat controlPoint2_y = 0;
    if (count ++ % 2 == 0) {
        controlPoint1_x = [self randomNum_70_79];
        controlPoint1_y = [self randomNum_70_79];
        controlPoint2_x = [self randomNum_120_129];
        controlPoint2_y = [self randomNum_120_129];
    } else {
        controlPoint1_x = [self randomNum_70_79];
        controlPoint1_y = [self randomNum_120_129];
        controlPoint2_x = [self randomNum_120_129];
        controlPoint2_y = [self randomNum_70_79];
    }
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, 100)];
    [bezierPath addCurveToPoint:CGPointMake(200, 100)
                  controlPoint1:CGPointMake(controlPoint1_x, controlPoint1_y)
                  controlPoint2:CGPointMake(controlPoint2_x, controlPoint2_y)];
    [bezierPath addLineToPoint:CGPointMake(200, 200)];
    [bezierPath addLineToPoint:CGPointMake(0, 200)];
    [bezierPath closePath];
    return bezierPath;
}

- (CGFloat)randomNum_70_79 {
    return (CGFloat)(arc4random() % 10 + 70);
}

- (CGFloat)randomNum_120_129 {
    return (CGFloat)(arc4random() % 10 + 120);
}
@end
