//
//  XMThreeViewController.m
//  ChildViewController_Learn
//
//  Created by jack on 14-7-3.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMThreeViewController.h"
#import "XMFirstViewController.h"
#import "XMViewController.h"

@interface XMThreeViewController ()

@end

@implementation XMThreeViewController

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

    [self.view setBackgroundColor:[UIColor greenColor]];

    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 30)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    XMViewController * vc = (XMViewController *)self.parentViewController;
    [self transitionFromViewController:vc.tVC toViewController:vc.fVC duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    } completion:^(BOOL finished){
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
