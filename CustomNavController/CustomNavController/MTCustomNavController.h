//
//  MTCustomNavController.h
//  miltoday
//
//  自定义的Navigation Controller
//
//  Created by jack on 14-8-7.
//  Copyright (c) 2014年 com.yuzhuangbao.miltoday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTNavBackClickDelegate.h"

@interface MTCustomNavController : UINavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated delegate:(id)delegate;

// 是否支持右滑返回功能 default:YES
@property (nonatomic,assign) BOOL canDragBack;
// 返回按钮重写代理
@property (nonatomic, assign) id <MTNavBackClickDelegate> backDelegate;

@end
