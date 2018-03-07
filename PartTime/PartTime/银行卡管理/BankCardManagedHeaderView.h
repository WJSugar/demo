//
//  BankCardManagedHeaderView.h
//  PartTime
//
//  Created by jinghua on 2017/10/17.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BankCardManagedHeaderBlock)(UIButton *button);

@interface BankCardManagedHeaderView : UIView
- (instancetype)initWithTitles:(NSArray *)titles;
@property (nonatomic, copy) BankCardManagedHeaderBlock block;
@end
