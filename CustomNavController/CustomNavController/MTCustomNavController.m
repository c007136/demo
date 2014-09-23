//
//  MTCustomNavController.m
//  miltoday
//
//  Created by jack on 14-8-7.
//  Copyright (c) 2014年 com.yuzhuangbao.miltoday. All rights reserved.
//

#import "MTCustomNavController.h"
#import "macro.h"

@interface MTCustomNavController () <UIGestureRecognizerDelegate>
{
    BOOL                  _isMoving;
    BOOL                  _needBackDelegate;
    CGPoint               _startTouch;
    NSMutableArray        * _screenShotsList;
    
    UIView                * _backgroundView;
    UIView                * _blackMask;
    UIImageView           * _lastScreenShot;
}

@end

@implementation MTCustomNavController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _canDragBack = YES;
        _isMoving = NO;
        _needBackDelegate = NO;
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
    
    if ( IOS7 ) {
        [self.navigationBar setBarTintColor:COLOR(204, 49, 49, 1)];
        self.navigationBar.translucent = NO;
    } else {
        [self.navigationBar setTintColor:COLOR(204, 49, 49, 1)];
    }
    
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

#pragma mark - back button
- (NSArray *)custumBackButton
{
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 30, 21);
    [backButton setImage:[UIImage imageNamed:@"navbar-back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem * leftBarSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftBarSpacer.width = (IOS7) ? -10 : 0;
    return [NSArray arrayWithObjects:leftBarSpacer, backButtonItem, nil];
}

- (void)backButtonClick
{
    [self popViewControllerAnimated:YES];
    
    if ( _backDelegate != nil && _needBackDelegate ) {
        [_backDelegate backButtonClick];
        _backDelegate = nil;
    }
}

#pragma mark - push and pop view controller
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIImage * captureImage = [self capture];
    if ( captureImage != nil ) {
        [_screenShotsList addObject:captureImage];
    }
    
    [super pushViewController:viewController animated:animated];
    
    // 自定义返回按钮
    if ( nil == viewController.navigationItem.leftBarButtonItems && self.viewControllers.count > 1 ) {
        viewController.navigationItem.leftBarButtonItems = [self custumBackButton];
    }
    
//    // 防止pan手势冲突 todo xiaomi  这样处理不对
//    if ( self.viewControllers.count > 1 ) {
//        [XMSideViewController share].canDrag = NO;
//    }
    
    // todo xiaomi 这样处理不好
    if ( self.viewControllers.count > 2 ) {
        _needBackDelegate = NO;
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [_screenShotsList removeLastObject];
    
    UIViewController * vc = [super popViewControllerAnimated:animated];
    
//    // 防止pan手势冲突 todo xiaomi  这样处理不对
//    if ( self.viewControllers.count == 1 ) {
//        [XMSideViewController share].canDrag = YES;
//    }
    
    // todo xiaomi 这样处理不好
    if ( self.viewControllers.count < 2 ) {
        _needBackDelegate = YES;
    }
    
    return vc;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated delegate:(id)delegate
{
    _backDelegate = delegate;
    [self pushViewController:viewController animated:animated];
}

// 截屏
- (UIImage *)capture
{
    UIView * view = [[UIApplication sharedApplication] keyWindow];
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
                
                // 代理
                if ( _backDelegate != nil && _needBackDelegate ) {
                    [_backDelegate panGetstureRecognizerEnded];
                    _backDelegate = nil;
                }
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
    
    CGFloat alpha = 0.2 - (x/800);
    _blackMask.alpha = alpha;
}

@end
