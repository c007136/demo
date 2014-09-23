//
//  XMViewController.m
//  Block_Learn
//
//  Created by jack on 14-8-21.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

typedef void (^printBlock)(NSString * text);

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 不好用的block
    printBlock block = ^(NSString * text)
    {
        NSLog(@"block is me :%@", text);
    };
    [self headerText:@"xiaomi" block:block];
    
    // 靠谱的block
    [self headerText:@"xiaomi" block:^(NSString *text) {
        
        text = @"body 2";
        NSLog(@"block is me: %@", text);
        
    }];
}

- (void)headerText:(NSString *)header block:(printBlock)print
{
    NSLog(@"header is : %@", header);
    
    print(@"body");
}


@end
