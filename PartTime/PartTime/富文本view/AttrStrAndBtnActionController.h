//
//  AttrStrAndBtnActionController.h
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AttrStrAndBtnActionBlock)(UITextView *textView, UIButton *button);

@interface AttrStrAndBtnActionController : UIViewController
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, strong) AttrStrAndBtnActionBlock block;
@end
