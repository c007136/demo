//
//  XMViewController.m
//  UIImage_Clip
//
//  Created by jack on 14-8-27.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "UIImage+Common.h"
#import "UIImageView+WebCache.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UIImage * image = [UIImage imageNamed:@"big.jpg"];
    NSURL * url = [NSURL URLWithString:@"http://img3.cache.netease.com/photo/0001/2014-08-27/A4L9SQKU00AP0001.jpg"];
//    UIImage * image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
//    image = [image imageClip:CGRectMake(0, 0, 100, 100)];
    UIImageView * view = [[UIImageView alloc] init];
    view.frame = CGRectMake(50, 50, 100, 100);
    
    [view sd_setImageWithURL:url placeholderImage:nil options:SDWebImageClipSrc];
    //[view sd_setImageWithURL:url placeholderImage:nil, options:SDWebImageClipSrc];
    
    
    [self.view addSubview:view];
}

@end
