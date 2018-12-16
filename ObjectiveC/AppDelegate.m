//
//  AppDelegate.m
//  ObjectiveC
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

#import "AppDelegate.h"
#import "MyNavgationController.h"
#import "MyTabBarController.h"
#import "StudyViewController.h"
#import "MyUIViewController.h"
#import "SDKViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createViewControllers];
    return YES;
}

// 创建分栏控制器管理的子视图控制器
- (void)createViewControllers {
    StudyViewController *oneVC = [[StudyViewController alloc] init];
    oneVC.title = @"Objective-C";
    oneVC.tabBarItem.image = [UIImage imageNamed:@"home"];
    oneVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    MyNavgationController *navCtrl1 = [[MyNavgationController alloc] initWithRootViewController:oneVC];
    //    navCtrl1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    
    MyUIViewController *twoVC = [[MyUIViewController alloc] init];
    twoVC.title = @"UI";
    twoVC.tabBarItem.image = [UIImage imageNamed:@"message"];
    twoVC.tabBarItem.selectedImage = [UIImage imageNamed:@"message_selected"];
    UINavigationController *navCtrl2 = [[UINavigationController alloc] initWithRootViewController:twoVC];
    
    SDKViewController *threeVC = [[SDKViewController alloc] init];
    threeVC.title = @"SDK";
    threeVC.tabBarItem.image = [UIImage imageNamed:@"profile"];
    threeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"profile_selected"];
    UINavigationController *navCtrl3 = [[UINavigationController alloc] initWithRootViewController:threeVC];
    
    MyTabBarController *tabBarCtrl = [[MyTabBarController alloc] init];
    tabBarCtrl.view.backgroundColor = [UIColor cyanColor];
    // 分栏控制器管理的视图控制器的tabBarController属性，自动指向分栏控制器。
    // 当分栏控制器管理的视图控制器的个数超过五个时，会自动创建一个more的导航控制器，并且自动将第五个以及以后的视图控制器添加到more导航控制器中。
    tabBarCtrl.viewControllers = @[navCtrl1, navCtrl2, navCtrl3];
    
    // 取到分栏控制器的分栏
    UITabBar *tabBar = tabBarCtrl.tabBar;
    // 设置分栏的风格
    tabBar.barStyle = UIBarStyleBlack;
    // 是否透明
    tabBar.translucent = NO;
    // 设置分栏的前景颜色
    tabBar.barTintColor = [UIColor brownColor];
    // 设置分栏元素项的颜色
    tabBar.tintColor = [UIColor purpleColor];
    //    // 设置分栏按钮的选中指定图片
    //    tabBar.selectionIndicatorImage = [UIImage imageNamed:@"search"];
    
    self.window.rootViewController = tabBarCtrl;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    // 此处url的值就是APP_1 openURL的url
    NSString *paraStr = url.absoluteString;
    NSLog(@"%@", paraStr);
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
