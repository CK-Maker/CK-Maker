//
//  AppDelegate.m
//  WorldNews
//
//  Created by lanou3g on 16/2/26.
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
    
    self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
#pragma mark 新闻
    
    MainViewController *mvc = [[MainViewController alloc] init];
    
    UINavigationController *nmvc = [[UINavigationController alloc] initWithRootViewController:mvc];
    
    nmvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[UIImage imageNamed:@"back_news"] tag:110];
    
    // 注意：添加tabbarItem图片时候要设置其渲染模式才能显示
    nmvc.tabBarItem.image = [[UIImage imageNamed:@"back_news"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
#pragma mark 阅读
    
    ReadViewController *rvc = [[ReadViewController alloc] init];
    
    UINavigationController *nrvc = [[UINavigationController alloc] initWithRootViewController:rvc];
    
    nrvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"阅读" image:[UIImage imageNamed:@"back_yuedu"] tag:110];
    
    nrvc.tabBarItem.image = [[UIImage imageNamed:@"back_yuedu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
#pragma mark 视听
    
    SHViewController *shvc = [[SHViewController alloc] init];
    
    UINavigationController *nshvc = [[UINavigationController alloc] initWithRootViewController:shvc];
    
    nshvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"视听" image:[UIImage imageNamed:@"back_shipin"] tag:110];
    
    nshvc.tabBarItem.image = [[UIImage imageNamed:@"back_shipin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    

#pragma mark 话题
    
    TopicViewController *tvc = [[TopicViewController alloc] init];
    
    UINavigationController *ntvc = [[UINavigationController alloc] initWithRootViewController:tvc];
    
    ntvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"话题" image:[UIImage imageNamed:@"back_huati"] tag:110];
    
    ntvc.tabBarItem.image = [[UIImage imageNamed:@"back_huati"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    
#pragma mark 我
    
    SelfViewController *svc = [[SelfViewController alloc] init];
    
    UINavigationController *nsvc = [[UINavigationController alloc] initWithRootViewController:svc];
    
    nsvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"back_wo"] tag:110];
    
    nsvc.tabBarItem.image = [[UIImage imageNamed:@"back_wo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    


#pragma mark tabbar视图控制器 
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    
    tabController.viewControllers = @[nmvc, nrvc, nshvc, ntvc, nsvc];
    
    tabController.selectedIndex = 0;
    
    tabController.tabBar.tintColor = [UIColor redColor];
    
    tabController.tabBar.barTintColor = [UIColor whiteColor];
    
    
    self.window.rootViewController = tabController;
    
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "LO.WorldNews" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"WorldNews" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"WorldNews.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
