//
//  XMObsever.m
//  Notification_Learn
//
//  Created by jack on 14-8-22.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMObsever.h"

@implementation XMObsever

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callback:) name:@"postmessage" object:nil];
    }
    return self;
}

- (void)callback:(NSNotification *)notification
{
    NSLog(@"notification name is %@", notification.name);
}

@end
