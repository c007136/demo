//
//  XMViewController.m
//  SDWebImage_Learn
//
//  Created by jack on 14-8-19.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton * leftButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    leftButton.backgroundColor = [UIColor orangeColor];
    [leftButton setTitle:@"下载图片" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
    UIButton * rightButton = [[UIButton alloc] initWithFrame:CGRectMake(170, 50, 100, 40)];
    rightButton.backgroundColor = [UIColor orangeColor];
    [rightButton setTitle:@"加载图片" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
    
    UIButton * clearButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 100, 40)];
    clearButton.backgroundColor = [UIColor orangeColor];
    [clearButton setTitle:@"删除缓存" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
}

- (void)leftButtonClick
{
    NSString * url = @"http://img3.cache.netease.com/96/2014/8/1/20140801145816684ac.jpg";
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0
    progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        NSLog(@"download image compeled.");
        NSLog(@"download image count %ld", [[SDImageCache sharedImageCache] getDiskCount]);
        NSLog(@"download image size %ld", [[SDImageCache sharedImageCache] getSize]);
    }];
}

- (void)rightButtonClick
{
    NSString * url = @"http://img3.cache.netease.com/96/2014/8/1/20140801145816684ac.jpg";
    
    UIImage * image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:url];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, 150, 300, 100);
    [self.view addSubview:imageView];
}

- (void)clearbuttonClick
{
    NSString * url = @"http://img3.cache.netease.com/96/2014/8/1/20140801145816684ac.jpg";
    
    [[SDImageCache sharedImageCache] removeImageForKey:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
