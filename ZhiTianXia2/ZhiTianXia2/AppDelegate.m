//
//  AppDelegate.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ReadViewController.h"
#import "SHViewController.h"
#import "TopicViewController.h"
#import "SelfViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    // 头条
    MainViewController *mvc = [[MainViewController alloc] init];
    
    // 导航栏定义就是root与tabar一样数组， 只不过看把谁装进来
    
    UINavigationController *nmvc = [[UINavigationController alloc] initWithRootViewController:mvc];
    
    nmvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[UIImage imageNamed:@"back_news"] tag:101];
    
    // 添加tablebar图片需要设置渲染模式
    nmvc.tabBarItem.image = [[UIImage imageNamed:@"back_news"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    

    
    // 阅读
    ReadViewController *rvc = [[ReadViewController alloc] init];
    
    UINavigationController *nrvc = [[UINavigationController alloc] initWithRootViewController:rvc];
    
//    nrvc.tabBarItem = [[UITabBarItem  alloc] initWithTitle:@"阅读" image:[UIImage imageNamed:@"back_read"] tag:110];
    
    nrvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"阅读" image:[UIImage imageNamed:@"back_read"] tag:101];
    
    nrvc.tabBarItem.image = [[UIImage imageNamed:@"back_read"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 视听
    SHViewController *shvc = [[SHViewController alloc] init];
    
    UINavigationController *nshvc = [[UINavigationController alloc] initWithRootViewController:shvc];
    
    nshvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"视听" image:[UIImage imageNamed:@"back_sh"] tag:110];
    
    nshvc.tabBarItem.image = [[UIImage imageNamed:@"back_sh"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 话题
    TopicViewController *tvc = [[TopicViewController alloc] init];
    
    UINavigationController *ntvc = [[UINavigationController alloc] initWithRootViewController:tvc];
    
    ntvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"话题" image:[UIImage imageNamed:@"back_topic"] tag:110];
    
    ntvc.tabBarItem.image = [[UIImage imageNamed:@"back_topic"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 我
    SelfViewController *svc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"selfView"];
    
    
#pragma mark - 从nib或者storyBoard中拿到视图
    
       
    
    

    svc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"back_self"] tag:101];
    
    
    // 底部视图控制器
    UITabBarController *tbc = [[UITabBarController alloc] init];
    
    tbc.viewControllers = @[nmvc, nrvc, nshvc, ntvc, svc];
    
    tbc.selectedIndex = 0;
    
    
    
    
    // 设置颜色
    // 选中标签颜色
    tbc.tabBar.tintColor = [UIColor redColor];
    // 背景色
    tbc.tabBar.barTintColor = [UIColor yellowColor];
    
    // 底部导航控制器bac选作跟视图
    self.window.rootViewController = tbc;
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}                   

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
