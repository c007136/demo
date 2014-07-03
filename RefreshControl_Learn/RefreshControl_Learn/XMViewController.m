//
//  XMViewController.m
//  RefreshControl_Learn
//
//  Created by jack on 14-7-3.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

// refresh control 学习
// http://blog.csdn.net/zyc851224/article/details/8018780

#import "XMViewController.h"

@interface XMViewController ()
{
    NSInteger     _items;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = 0;
    [self addRefreshViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - refresh controller
- (void)addRefreshViewController
{
    // tableView origin y = 20
    // 需要好好研究 iOS7适配
    CGRect frame = self.tableView.frame;
    frame.origin.y = 0;
    self.tableView.frame = frame;
    
    //NSLog(@"table view %lf %lf %lf %lf", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -frame.size.height, frame.size.width, frame.size.height)];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [self.refreshControl addTarget:self action:@selector(refreshViewControlEventValueChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshViewControlEventValueChanged
{
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.0f];
}

- (void)loadData
{
    [self.refreshControl endRefreshing];
    
    _items++;
    [self.tableView reloadData];
}

#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSLog(@"%d", row);
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
    
    cell.textLabel.text = [NSString stringWithFormat:@".....%d.....", indexPath.row];
    
    return cell;
}

@end
