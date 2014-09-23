//
//  XMMessage.h
//  JPush_Learn
//
//  Created by jack on 14-8-31.
//  Copyright (c) 2014年 com.mildaily.imobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMMessage : NSObject
{
    NSDictionary      * _pushDict;
}

+ (XMMessage *)createMessage:(NSDictionary *)dict;

//根据传入的推送通知内容构造Message对象
- (id)initWithDict:(NSDictionary *)dict;
- (void)execInterface:(UIViewController*)vc;

@end
