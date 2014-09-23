//
//  XMViewController.m
//  ChildViewController_Learn
//
//  Created by jack on 14-7-3.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frame = self.view.frame;
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    _fVC = [[XMFirstViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:_fVC];
    [_fVC.view setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    _sVC = [[XMSecondViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:_sVC];
    [_sVC.view setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    _tVC = [[XMThreeViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:_tVC];
    [_tVC.view setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    
//    NSLog(@"vc %lf %lf %lf %lf", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
//
//    frame = tvc.view.frame;
//    NSLog(@"tvc %lf %lf %lf %lf", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    
    [self.view addSubview:_tVC.view];
    [_tVC didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
