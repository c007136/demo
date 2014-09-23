//
//  XMViewController.m
//  UIScrollView_Learn
//
//  Created by jack on 14-8-30.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController () <UIScrollViewDelegate>
{
    UIScrollView           * _scrollView;
    NSInteger              _currentPage;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _currentPage = 0;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 100)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    NSArray * colorArray = @[
                             [UIColor redColor],
                             [UIColor blueColor],
                             [UIColor orangeColor],
                             [UIColor brownColor],
                             ];
    
    for ( int i = 0; i < colorArray.count; ++i) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(i*320, 0, 320, 100)];
        view.backgroundColor = [colorArray objectAtIndex:i];
        [_scrollView addSubview:view];
        
    }
    [_scrollView setContentSize:CGSizeMake(320*colorArray.count, 100)];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 30)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    
    _currentPage++;
    if ( _currentPage > 4 ) {
        _currentPage = 0;
    }
    
    CGRect rect = CGRectMake(320*_currentPage, 0, 320, 100);
    [_scrollView scrollRectToVisible:rect animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"scrollview offset x %lf.......", _scrollView.contentOffset.x);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"scrollview offset x %lf.......", _scrollView.contentOffset.x);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
