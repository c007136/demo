//
//  XMViewController.m
//  ScrollView_Inset_Learn
//
//  Created by jack on 14-9-4.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()
{
    NSInteger      _items;
    UIScrollView   * scrollView;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, -self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    view.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:view];
    
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    view1.backgroundColor = [UIColor brownColor];
    [scrollView addSubview:view1];
    
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2)];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scrollView addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _items = 0;
}

- (void)buttonClick
{
    if ( _items ) {
        scrollView.contentOffset = CGPointMake(0, 0);
        //scrollView.contentInset = UIEdgeInsetsZero;
    } else {
        scrollView.contentOffset = CGPointMake(0, -60);
        //scrollView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
    }
    _items = !_items;
    NSLog(@"....items: %d....", _items);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@".....%ld.....", (long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    if ( 0 == row % 2 ) {
        tableView.contentInset = UIEdgeInsetsMake(-60.0f, 0.0f, 0.0f, 0.0f);
    } else {
        tableView.contentInset = UIEdgeInsetsZero;
    }
}

@end
