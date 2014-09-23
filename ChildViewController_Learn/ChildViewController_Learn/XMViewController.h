//
//  XMViewController.h
//  ChildViewController_Learn
//
//  Created by jack on 14-7-3.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMFirstViewController.h"
#import "XMSecondViewController.h"
#import "XMThreeViewController.h"

@interface XMViewController : UIViewController
{
}

@property(nonatomic, strong) XMFirstViewController     * fVC;
@property(nonatomic, strong) XMSecondViewController    * sVC;
@property(nonatomic, strong) XMThreeViewController     * tVC;

@end
