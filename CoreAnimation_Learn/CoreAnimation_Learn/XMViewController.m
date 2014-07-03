//
//  XMViewController.m
//  CoreAnimation_Learn
//
//  Created by jack on 14-7-2.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

// 动画学习 Core Animation
// http://blog.csdn.net/iosevanhuang/article/details/14488239

#import "XMViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage * image = [UIImage imageNamed:@"image.png"];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = CGPointMake(100, 240);
    [self.view addSubview:imageView];
    
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation1.toValue = [NSNumber numberWithFloat:320.0f];
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //animation2.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2,2,1)];
    animation2.fromValue = [NSNumber numberWithFloat:1.0];
    animation2.toValue = [NSNumber numberWithFloat:2.0];
    animation2.autoreverses = YES;
    animation2.duration = 5.0f;
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.duration = 5.0f;
    //group.repeatCount = 1;
   
    
    //group.removedOnCompletion = NO;
    //group.fillMode = kCAFillModeForwards;
    
    group.animations = [NSArray arrayWithObjects:animation2, nil];
    [imageView.layer addAnimation:group forKey:@"move-rotate-layer"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
