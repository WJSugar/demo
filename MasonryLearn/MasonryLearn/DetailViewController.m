//
//  DetailViewController.m
//  MasonryLearn
//
//  Created by jinghua on 2017/11/7.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)loadView {
    Class class = NSClassFromString(self.className);
    UIView *inView = [class new];
    self.view = inView;
}
#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
