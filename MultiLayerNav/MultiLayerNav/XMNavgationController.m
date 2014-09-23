//
//  XMNavgationController.m
//  MultiLayerNav
//
//  Created by jack on 14-8-12.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMNavgationController.h"

@interface XMNavgationController () <UIGestureRecognizerDelegate>
{
    BOOL                  _isMoving;
    CGPoint               _startTouch;
    NSMutableArray        * _screenShotsList;
    
    UIView                * _backgroundView;
    UIView                * _blackMask;
    UIImageView           * _lastScreenShot;
}

@end

@implementation XMNavgationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _canDragBack = YES;
        _isMoving = NO;
        _startTouch = CGPointZero;
        _screenShotsList = [[NSMutableArray alloc] init];
        
        _backgroundView = nil;
        _blackMask = nil;
        _lastScreenShot = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPanGestureRecognizer * recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
}

- (void)viewDidAppear:(BOOL)animated
{
    // 截最初始的屏幕
    if ( 0 == _screenShotsList.count ) {
        UIImage * captureImage = [self capture];
        if ( captureImage != nil ) {
            [_screenShotsList addObject:captureImage];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - push and pop view controller
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIImage * captureImage = [self capture];
    if ( captureImage != nil ) {
        [_screenShotsList addObject:captureImage];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [_screenShotsList removeLastObject];
    
    return [super popViewControllerAnimated:animated];
}

// 截屏
- (UIImage *)capture
{
    UIView * view = [[UIApplication sharedApplication] keyWindow].rootViewController.view;
    if ( nil == view ) {
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

#pragma mark - pan getsture recognizer
- (void)pan:(UIPanGestureRecognizer *)recoginzer
{
    if (self.viewControllers.count < 2 || !_canDragBack) {
        return;
    }
    
    UIView * view = [[UIApplication sharedApplication] keyWindow].rootViewController.view;
    if ( nil == view ) {
        return;
    }
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    CGPoint touchPoint = [recoginzer locationInView:window];
    CGFloat offset = touchPoint.x - _startTouch.x;
    
    if ( UIGestureRecognizerStateBegan == recoginzer.state ) {
        _isMoving = YES;
        _startTouch = touchPoint;
        
        if ( nil == _backgroundView ) {
            CGRect frame = view.frame;
            
            _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            [view.superview insertSubview:_backgroundView belowSubview:view];  // todo xiaomi why superview
            
            _blackMask = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _blackMask.backgroundColor = [UIColor blackColor];
            [_backgroundView addSubview:_blackMask];
        }
        
        _backgroundView.hidden = NO;
        if ( _lastScreenShot != nil ) {
            [_lastScreenShot removeFromSuperview];
        }
        
        UIImage * lastScreenShot = [_screenShotsList lastObject];
        _lastScreenShot = [[UIImageView alloc] initWithImage:lastScreenShot];
        [_backgroundView insertSubview:_lastScreenShot belowSubview:_blackMask];
    } else if ( UIGestureRecognizerStateEnded == recoginzer.state ) {
        
        if ( offset > 50 ) {
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:view.frame.size.width];
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                
                CGRect frame = view.frame;
                frame.origin.x = 0;
                view.frame = frame;
                
                _isMoving = NO;
                _backgroundView.hidden = YES;
            }];
            
        } else {
            
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:0];
            } completion:^(BOOL finished) {
                _isMoving = NO;
                _backgroundView.hidden = YES;
            }];
            
        }
        
    } else if ( UIGestureRecognizerStateCancelled == recoginzer.state ) {
        
        [UIView animateWithDuration:0.3 animations:^{
            [self moveViewWithX:0];
        } completion:^(BOOL finished) {
            _isMoving = NO;
            _backgroundView.hidden = YES;
        }];
        
    } else if ( UIGestureRecognizerStateChanged == recoginzer.state ) {
        
        if (_isMoving) {
            [self moveViewWithX:offset];
        }
        
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (self.viewControllers.count < 2 || !_canDragBack) {
        return NO;
    }
    
    return YES;
}

- (void)moveViewWithX:(CGFloat)x
{
    UIView * view = [[UIApplication sharedApplication] keyWindow].rootViewController.view;
    if ( nil == view ) {
        return;
    }
    
    CGRect frame = view.frame;
    CGFloat width = frame.size.width;
    x = x > width ? width : x;
    x = x < 0 ? 0 : x;
    
    frame.origin.x = x;
    view.frame = frame;
    
    CGFloat alpha = 0.4 - (x/800);
    _blackMask.alpha = alpha;
}

@end
