//
//  XMBaseViewController.h
//  JPush_Learn
//
//  Created by jack on 14-8-31.
//  Copyright (c) 2014年 com.mildaily.imobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMMessage.h"
#import "XMExecute.h"

@interface XMBaseViewController : UIViewController

@property (nonatomic, strong) XMMessage        * message;
@property (nonatomic, strong) XMExecute        * execute;

@end
