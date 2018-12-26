//
//  MyTabBarController.m
//  TabBarController
//
//  Created by William on 2018/10/19.
//  Copyright © 2018年 William. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyNavgationController.h"
#import "StudyViewController.h"
#import "MyUIViewController.h"
#import "SDKViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    self.view.backgroundColor = [UIColor cyanColor];
    // 分栏控制器管理的视图控制器的tabBarController属性，自动指向分栏控制器。
    // 当分栏控制器管理的视图控制器的个数超过五个时，会自动创建一个more的导航控制器，并且自动将第五个以及以后的视图控制器添加到more导航控制器中。
    self.viewControllers = @[navCtrl1, navCtrl2, navCtrl3];
    
    // 设置分栏的风格
    self.tabBar.barStyle = UIBarStyleBlack;
    // 是否透明
    self.tabBar.translucent = NO;
    // 设置分栏的前景颜色
    self.tabBar.barTintColor = [UIColor brownColor];
    // 设置分栏元素项的颜色
    self.tabBar.tintColor = [UIColor purpleColor];
    //    // 设置分栏按钮的选中指定图片
    //    tabBar.selectionIndicatorImage = [UIImage imageNamed:@"search"];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"item name = %@", item.title);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
