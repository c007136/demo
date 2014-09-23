//
//  XMExecute.m
//  JPush_Learn
//
//  Created by jack on 14-8-31.
//  Copyright (c) 2014年 com.mildaily.imobile. All rights reserved.
//

#import "XMExecute.h"
#import "XMMessage.h"

@implementation XMExecute

- (void)execute:(XMMessage *)msg viewController:(UIViewController*)vc
{
    [msg execInterface:vc];
}

@end
