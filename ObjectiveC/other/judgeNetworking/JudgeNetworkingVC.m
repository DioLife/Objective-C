//
//  judgeNetworkingVC.m
//  ObjectiveC
//
//  Created by hello on 2019/3/25.
//  Copyright © 2019 William. All rights reserved.
//

#import "JudgeNetworkingVC.h"
#import <AFNetworking.h>

@interface JudgeNetworkingVC ()

@end

@implementation JudgeNetworkingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)judgeAF:(UIButton *)sender {
    //1.创建网络监听管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    //2.监听网络状态的改变
    /*
     AFNetworkReachabilityStatusUnknown             = 未知
     AFNetworkReachabilityStatusNotReachable        = 没有网络
     AFNetworkReachabilityStatusReachableViaWWAN    = 3G/4G
     AFNetworkReachabilityStatusReachableViaWiFi    = WIFI
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态发生改变的时候调用这个block
        switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
                case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G/4G");
                break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
            default:
                break;
        }
    }];
    
    //3.开始监听
    [manager startMonitoring];
    BOOL isConnecting = [manager isReachable];
    if (isConnecting) {
        NSLog(@"网络通畅");
    }else{
        NSLog(@"网络不通畅");
    }
    NSLog(@"the last line! ==== go here!");
}

@end
