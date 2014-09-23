//
//  XMLaunchViewController.m
//  LaunchAnimation
//
//  Created by jack on 14-9-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMLaunchViewController.h"
#include <sys/sysctl.h>
#import "XMViewController.h"

@interface XMLaunchViewController ()

@end

@implementation XMLaunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //NSString * deviceModel = [self doDeviceModel];
    
    UIImage * image = nil;
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    if ( rect.size.height == 568 ) {
        image = [UIImage imageNamed:@"Default-568h@2x"];
    } else if ( rect.size.height == 240 ) {
        image = [UIImage imageNamed:@"Default"];
    } else {
        image = [UIImage imageNamed:@"Default@2x"];
    }
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:imageView];
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerFireMethod) userInfo:nil repeats:NO];
}

- (void)timerFireMethod
{
    XMViewController * vc = [[XMViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
        NSLog(@"present if finishing.......");
        
    }];
}

@end
