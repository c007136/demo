//
//  XMDetailViewController.m
//  GCD_Learn
//
//  Created by jack on 14-9-8.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMDetailViewController.h"
#import "SDWebImage/SDWebImageManager.h"

@interface XMDetailViewController ()
{
    dispatch_semaphore_t      _semaphore;
    NSThread                  * _thread;
}

@end

@implementation XMDetailViewController

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
    
    UIButton *  button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 30)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *  button1 = [[UIButton alloc] initWithFrame:CGRectMake(180, 100, 100, 30)];
    button1.backgroundColor = [UIColor orangeColor];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    _semaphore = dispatch_semaphore_create(1);
}

-(void)buttonClick
{
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadRun) object:nil];
    [_thread start];
}

- (void)button1Click
{
    [_thread cancel];
}

- (void)threadRun
{
    dispatch_group_t gt = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 5; ++i) {
        
        //NSLog(@"semaphore wait befroe %d", i);
        
        if ( [_thread isCancelled] ) {
            [NSThread exit];
        }
        
        dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(gt, queue, ^{
            
            sleep(2);
            [self downloadImage];
            NSLog(@"%i",i);
            
        });
        
    }
    
    NSLog(@"thread is finished .... 1");
    
    dispatch_group_wait(gt, DISPATCH_TIME_FOREVER);
    
    NSLog(@"thread is finished .... 2");
}

- (void)downloadImage
{
    NSString * url = @"http://static.atm.youku.com/YouKu2014/201407/0718/40268/970-100.jpg";
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        dispatch_semaphore_signal(_semaphore);
        
    }];
}

@end
