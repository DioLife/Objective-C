//
//  DeviceViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/4/25.
//  Copyright © 2019 William. All rights reserved.
//

#import "DeviceViewController.h"
#import <sys/utsname.h>

/*
 iPhone机型相关信息
 https://www.theiphonewiki.com/wiki/Models
 **/
@interface DeviceViewController ()

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)judgeDevice:(UIButton *)sender {
    NSString *phoneType = [self getDeviceInfo];
    NSLog(@"%@", phoneType);
}
-(NSString *)getDeviceInfo {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *phoneType = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    NSLog(@"deviceInfo:\t%@", phoneType);
    if([phoneType  isEqualToString:@"iPhone1,1"]){
        return@"iPhone 2G";
    }else if([phoneType  isEqualToString:@"iPhone1,2"]) {
        return@"iPhone 3G";
    }else if([phoneType  isEqualToString:@"iPhone2,1"]) {
        return@"iPhone 3GS";
    }else if([phoneType  isEqualToString:@"iPhone3,1"]){
        return@"iPhone 4";
    }else if([phoneType  isEqualToString:@"iPhone3,2"]) {
        return@"iPhone 4";
    }else if([phoneType  isEqualToString:@"iPhone3,3"]) {
        return@"iPhone 4";
    }else if([phoneType  isEqualToString:@"iPhone4,1"]) {
        return@"iPhone 4S";
    }else if([phoneType  isEqualToString:@"iPhone5,1"]) {
        return@"iPhone 5";
    }else if([phoneType  isEqualToString:@"iPhone5,2"]){
        return@"iPhone 5";
    }else if([phoneType  isEqualToString:@"iPhone5,3"]) {
        return@"iPhone 5c";
    }else if([phoneType  isEqualToString:@"iPhone5,4"]) {
        return@"iPhone 5c";
    }else if([phoneType  isEqualToString:@"iPhone6,1"]){
        return@"iPhone 5s";
    }else if([phoneType  isEqualToString:@"iPhone6,2"]) {
        return@"iPhone 5s";
    }else if([phoneType  isEqualToString:@"iPhone7,1"]) {
        return@"iPhone 6 Plus";
    }else if([phoneType  isEqualToString:@"iPhone7,2"]) {
        return@"iPhone 6";
    }else if([phoneType  isEqualToString:@"iPhone8,1"]) {
        return@"iPhone 6s";
    }else if([phoneType  isEqualToString:@"iPhone8,2"]) {
        return@"iPhone 6s Plus";
    }else if([phoneType  isEqualToString:@"iPhone8,4"]) {
        return@"iPhone SE";
    }else if([phoneType  isEqualToString:@"iPhone9,1"]) {
        return@"iPhone 7";
    }else if([phoneType  isEqualToString:@"iPhone9,2"]) {
        return@"iPhone 7 Plus";
    }else if([phoneType  isEqualToString:@"iPhone10,1"]) {
        return@"iPhone 8";
    }else if([phoneType  isEqualToString:@"iPhone10,4"]) {
        return@"iPhone 8";
    }else if([phoneType  isEqualToString:@"iPhone10,2"]) {
        return@"iPhone 8 Plus";
    }else if([phoneType  isEqualToString:@"iPhone10,5"]) {
        return@"iPhone 8 Plus";
    }else if([phoneType  isEqualToString:@"iPhone10,3"]) {
        return@"iPhone X";
    }else if([phoneType  isEqualToString:@"iPhone10,6"]) {
        return@"iPhone X";
    }else if([phoneType  isEqualToString:@"iPhone11,8"]) {
        return@"iPhone XR";
    }else if([phoneType  isEqualToString:@"iPhone11,2"]) {
        return@"iPhone XS";
    }else if([phoneType  isEqualToString:@"iPhone11,4"]) {
        return@"iPhone XS Max";
    }else if([phoneType  isEqualToString:@"iPhone11,6"]) {
        return @"iPhone XS Max";
    }else {
        return @"unknow";
    }
}

- (IBAction)systemVersion:(UIButton *)sender {
    
}

@end
