//
//  XMExecute.h
//  JPush_Learn
//
//  Created by jack on 14-8-31.
//  Copyright (c) 2014年 com.mildaily.imobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMMessage;

@interface XMExecute : NSObject

- (void)execute:(XMMessage *)msg viewController:(UIViewController*)vc;

@end
