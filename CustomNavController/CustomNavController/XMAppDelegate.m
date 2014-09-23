//
//  XMAppDelegate.m
//  CustomNavController
//
//  自定义Navgation Controller学习
//  主要有：导航栏的背景色 导航栏上按钮的间隔区 导航栏的标题
//  参考链接：
//  http://beyondvincent.com/blog/2013/11/03/120-customize-navigation-status-bar-ios-7/
//  http://blog.csdn.net/developer_zhang/article/details/8841919
//  http://blog.csdn.net/numbbuaa/article/details/8594638
//
//  Created by jack on 14-8-7.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMAppDelegate.h"
#import "XMViewController.h"
#import "XMCustomNavController.h"
#import "MTCustomNavController.h"

@implementation XMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    XMViewController * vc = [[XMViewController alloc] initWithNibName:nil bundle:nil];
    MTCustomNavController * nvc = [[MTCustomNavController alloc] initWithRootViewController:vc];
    //UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nvc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
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

@end
