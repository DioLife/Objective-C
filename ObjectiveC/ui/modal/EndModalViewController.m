//
//  EndModalViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/11/16.
//  Copyright © 2019 William. All rights reserved.
//

#import "EndModalViewController.h"

@interface EndModalViewController ()

@end

@implementation EndModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"回跳已执行");
    }];
}


@end
