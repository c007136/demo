//
//  XMViewController.m
//  PanGestureRecognizer
//
//  Created by jack on 14-8-7.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController () <UIGestureRecognizerDelegate>
{
    UIView       * _baseView;
    UIButton     * _button;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _baseView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    [self.view addSubview:_baseView];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    _button.backgroundColor = [UIColor blueColor];
    [self.view insertSubview:_button belowSubview:_baseView];
    
    UIPanGestureRecognizer * panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAnimation:)];
    [_baseView addGestureRecognizer:panGesture];
    panGesture.delegate = self;
    panGesture.enabled = YES;
}

- (void)panAnimation:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation;
    UIView * view = gesture.view;
    
    switch ( gesture.state ) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"gesture recognizer state began.");
            break;
            
        case UIGestureRecognizerStateChanged:
            translation = [gesture translationInView:self.view];
            _button.center = CGPointMake(_button.center.x+translation.x, _button.center.y+translation.y);
            [gesture setTranslation:CGPointMake(0.0, 0.0) inView:self.view];
            break;
            
        case UIGestureRecognizerStateEnded:
            NSLog(@"gesture recognizer state ended");
            break;
            
        case UIGestureRecognizerStatePossible:
            NSLog(@"gesture recognizer state possible");
            break;
            
        case UIGestureRecognizerStateFailed:
            NSLog(@"gesture recognizer state failed");
            break;
            
        case UIGestureRecognizerStateCancelled:
            NSLog(@"gesture recognizer state cancelled");
            
        default:
            break;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
    
    UIPanGestureRecognizer * panGetsture = (UIPanGestureRecognizer *)gestureRecognizer;
    CGPoint pt = [panGetsture translationInView:self.view];
    if ( ABS(pt.x)/ABS(pt.y) > 1 ) {   // 限制：横向移动
        return YES;
    }
    
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
