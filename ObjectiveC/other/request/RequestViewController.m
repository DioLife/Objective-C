//
//  RequestViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/3/24.
//  Copyright © 2019 William. All rights reserved.
//

#import "RequestViewController.h"
#import "RequestManager.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = @"http://httpbin.org";
    NSDictionary *parameters = @{@"a":@"1", @"b":@"2"};
    [[RequestManager sharedManager] postRequest:url parameters:parameters success:^(id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
