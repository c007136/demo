//
//  XMViewController.m
//  UIViewAnimation_Learn
//
//  Created by jack on 14-7-2.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

// UIView Animation学习

#import "XMViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage * image = [UIImage imageNamed:@"image.png"];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = CGPointMake(160, 480);
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:2.0f animations:^{
        imageView.center = CGPointMake(160, 100);
    } completion:^(BOOL finished){
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
