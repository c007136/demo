//
//  XMCustomNavController.m
//  CustomNavController
//
//  Created by jack on 14-8-7.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#define COLOR(r,g,b,a)          [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define COLORF(r,g,b,a)         [UIColor colorWithRed:r green:g blue:b alpha:a]
#define ICONCORNERRADIUS        8

#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define IOS6 [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0


#import "XMCustomNavController.h"

@interface XMCustomNavController ()

@end

@implementation XMCustomNavController

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
    
    if ( IOS7 ) {
        [self.navigationBar setBarTintColor:COLOR(204, 49, 49, 1)];
    } else {
        [self.navigationBar setTintColor:COLOR(204, 49, 49, 1)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
