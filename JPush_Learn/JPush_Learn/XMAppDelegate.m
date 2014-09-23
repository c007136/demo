//
//  XMAppDelegate.m
//  JPush_Learn
//
//  主要学习接收推送消息自动跳转功能
//
//  Created by jack on 14-8-31.
//  Copyright (c) 2014年 com.mildaily.imobile. All rights reserved.
//

#import "XMAppDelegate.h"
#import "XMViewController.h"
#import "APService.h"
#import "XMMessage.h"
#import "XMNavigationViewController.h"

@interface XMAppDelegate ()
{
    XMViewController       * _vc;
}

@end

@implementation XMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    _vc = [[XMViewController alloc] init];
    XMNavigationViewController * nvc = [[XMNavigationViewController alloc] initWithRootViewController:_vc];
    self.window.rootViewController = nvc;
    
    // JPush
    [self JPush:launchOptions];
    
    NSDictionary* userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    [self pushToJump:userInfo withFirstStart:YES];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // JPush
    [APService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // JPush
    [APService handleRemoteNotification:userInfo];
    
    NSLog(@"userinfo remote notification : %@", userInfo);
}

#ifdef __IPHONE_7_0
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    //[self alertMessage:userInfo];
    //[MTGlobalDefine share].alertMessage = [MTAlertMessage createMessage:userInfo];
    
    [self pushToJump:userInfo withFirstStart:YES];
    
    // JPush
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNoData);
}
#endif

- (void)JPush:(NSDictionary *)launchOptions
{
    [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                   UIRemoteNotificationTypeSound |
                                                   UIRemoteNotificationTypeAlert)];
    [APService setupWithOption:launchOptions];
}

-(void)pushToJump:(NSDictionary*)userInfo withFirstStart:(BOOL)firstStart
{
    XMMessage *msg = [XMMessage createMessage:userInfo];
    _vc.message = msg;
}

@end
