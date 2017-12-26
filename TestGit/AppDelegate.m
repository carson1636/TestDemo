//
//  AppDelegate.m
//  TestGit
//
//  Created by zhu on 2017/12/20.
//  Copyright © 2017年 na. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%@", NSStringFromCGSize([[UIScreen mainScreen] currentMode].size));
    
    if (is_iPhone5) {
        NSLog(@"-----iPhone5-----");
    } else if (is_iPhone6) {
        NSLog(@"-----iPhone6-----");
    } else if (is_iPhone6P) {
        NSLog(@"-----iPhone6P-----");
    } else if (is_iPhoneX) {
        NSLog(@"-----iPhoneX-----");
    }
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.tabBarItem.title = @"首页";
    
    UIViewController *vc2= [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor redColor];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.tabBarItem.title = @"分类";
    
    ViewController *vc3 = [[ViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    nav3.tabBarItem.title = @"购物车";
    
    UIViewController *vc4= [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor redColor];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    nav4.tabBarItem.title = @"我的";
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = @[nav1, nav2, nav3, nav4];
    
    self.window.rootViewController = tabbar;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
