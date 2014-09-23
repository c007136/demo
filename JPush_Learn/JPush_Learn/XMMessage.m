//
//  XMMessage.m
//  JPush_Learn
//
//  Created by jack on 14-8-31.
//  Copyright (c) 2014年 com.mildaily.imobile. All rights reserved.
//

#import "XMMessage.h"
#import "XMDetailViewController.h"

@implementation XMMessage

+ (XMMessage *)createMessage:(NSDictionary *)dict
{
    NSString * message = [[dict objectForKey:@"aps"] objectForKey:@"alert"];
    if ( nil == message || [message isEqualToString:@""] ) {
        return nil;
    }
    
    NSNumber * ID = [dict objectForKey:@"id"];
    if ( nil == ID || 0 == [ID integerValue] ) {
        return nil;
    }
    
    NSNumber * category = [dict objectForKey:@"category"];
    if ( nil == category || 0 == [category integerValue] ) {
        return nil;
    }
    
    XMMessage * alertMessage = [[XMMessage alloc] initWithDict:dict];
    return alertMessage;
}

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _pushDict = dict;
    }
    return self;
}

- (void)execInterface:(UIViewController*)vc
{
    XMDetailViewController * detailVC = [[XMDetailViewController alloc] init];
    detailVC.message = [XMMessage createMessage:_pushDict];
    [vc.navigationController pushViewController:detailVC animated:YES];
}

@end
