//
//  XMViewController.m
//  TableView_Learn
//
//  Created by jack on 14-9-9.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMTableViewCell.h"

@interface XMViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView                 * _tableView;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    if ( [_tableView respondsToSelector:@selector(setSeparatorInset:)] ) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    [self.view addSubview:_tableView];
}

#pragma mark - tableview delegate / datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"Cell";
    XMTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if ( nil == cell ) {
        cell = [[XMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString * text = [NSString stringWithFormat:@".....%d.....", indexPath.row];
    [cell setCellText:text];
    
    return cell;
}

@end
