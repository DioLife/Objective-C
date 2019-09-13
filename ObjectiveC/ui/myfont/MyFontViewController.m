//
//  MyFontViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/9/6.
//  Copyright © 2019 William. All rights reserved.
//

#import "MyFontViewController.h"

@interface MyFontViewController ()

@end

@implementation MyFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (NSString *fontfamilyname in [UIFont familyNames]) {
        NSLog(@"fontfamilyname:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName: fontfamilyname]) {
            NSLog(@"font:'%@'",fontName);
        }
        NSLog(@"-------------------- done ---------------------");
    }
    
    UIFont *myfont = [UIFont fontWithName:@"MyanmarSangamMN-Bold" size:20];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 300, 60)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"字体测试 这是一段文字";
    label.font = myfont;
    [self.view addSubview:label];
}

@end
