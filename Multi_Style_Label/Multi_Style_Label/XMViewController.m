//
//  XMViewController.m
//  Multi_Style_Label
//
//  Created by jack on 14-7-2.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

// 不同字体不同颜色的UILabel
// http://blog.csdn.net/zhangao0086/article/details/7616385

#import "XMViewController.h"
#import "AttributedLabel.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    AttributedLabel * label = [[AttributedLabel alloc] initWithFrame:CGRectMake(20, 20, 200, 100)];
    
    NSString * text = @"11.5GB";
    NSUInteger len = [text length];
    label.text = text;
    
    [label setColor:[UIColor redColor] fromIndex:0 length:len];
    [label setFont:[UIFont systemFontOfSize:70.0f] fromIndex:0 length:len-2];
    [label setFont:[UIFont systemFontOfSize:30.0f] fromIndex:len-2 length:2];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
