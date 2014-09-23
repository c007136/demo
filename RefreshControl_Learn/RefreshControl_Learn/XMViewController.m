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
#import "EGORefreshTableHeaderView.h"

@interface XMViewController () <EGORefreshTableHeaderDelegate>
{
    NSInteger     _items;
    BOOL          _reloading;
    EGORefreshTableHeaderView * _refreshHeaderView;
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
    // EGO
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    [self.tableView addSubview:_refreshHeaderView];
    
    //  update the last update date
	//[_refreshHeaderView refreshLastUpdatedDate];
    
    return;
    
    CGRect frame = self.tableView.frame;
    frame.origin.y = 0;
    self.tableView.frame = frame;
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -frame.size.height, frame.size.width, frame.size.height)];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [self.refreshControl addTarget:self action:@selector(refreshViewControlEventValueChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshViewControlEventValueChanged
{
    NSLog(@"....&&&&&&&&&&");
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
    
    if ( 0 == row % 2 ) {
        [_refreshHeaderView startLoadingAndExpand:tableView];
        //[self refreshByAnimation];
    } else {
        //[self.refreshControl endRefreshing];
        [_refreshHeaderView finishLoading:tableView];
    }
}

- (void)refreshByAnimation
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    self.tableView.contentOffset = CGPointMake(0.0, -100.0); // 注意位移点的y值为负值
    [UIView commitAnimations];
    
    [self.refreshControl beginRefreshing];
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
    
    cell.textLabel.text = [NSString stringWithFormat:@".....%ld.....", indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark e Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:1.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    
    _items++;
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
    [self.tableView reloadData];
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}

@end
