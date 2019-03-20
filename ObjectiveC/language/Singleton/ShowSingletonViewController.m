//
//  ShowSingletonViewController.m
//  ObjectiveC
//
//  Created by hello on 2018/12/2.
//  Copyright © 2018 William. All rights reserved.
//

#import "ShowSingletonViewController.h"
#import "MyManager.h"

@interface ShowSingletonViewController ()

@end

@implementation ShowSingletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在控制台看到输出结果为同一个对象
    MyManager *obj1 = [MyManager sharedManager];
    NSLog(@"obj1 = %@",obj1);
    
    MyManager *obj2 = [MyManager sharedManager];
    NSLog(@"obj2 = %@",obj2);
    
    MyManager *obj3 = [MyManager sharedManager];
    NSLog(@"obj3 = %@",obj3);
    
    MyManager *obj4 = [[MyManager alloc] init];
    NSLog(@"obj4 = %@",obj4);
    
    MyManager *obj5 = [[MyManager alloc] init];
    NSLog(@"obj5 = %@",obj5);
}

@end
