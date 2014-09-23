//
//  XMViewController.m
//  ActionSheet_Learn
//
//  Created by jack on 14-8-28.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController () <UIActionSheetDelegate>

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc]
                                   initWithTitle:@"title,nil时不显示"
                                   delegate:self
                                   cancelButtonTitle:@"取消"
                                   destructiveButtonTitle:nil
                                   otherButtonTitles:@"第一项", @"第二项",nil];
    actionSheet.actionSheetStyle = UIBarStyleDefault;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"button index %d", buttonIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
