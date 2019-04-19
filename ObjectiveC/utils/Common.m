//
//  Commom.m
//  GraphicFill
//
//  Created by hello on 2019/3/1.
//  Copyright © 2019 dio. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (CGFloat)getNavigationBarHeight {
    UINavigationController *nav = [[UINavigationController alloc] init];
    CGFloat navHeight = nav.navigationBar.bounds.size.height;
    return navHeight;
}

+(CGFloat)getTabBarHeight{
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.bounds.size.height;
    return tabBarHeight;
}

+(CGFloat)getTopHeight {
    CGFloat navHeight = [self getNavigationBarHeight];
    CGFloat height = statusBarHeight + navHeight;
    return height;
}

+(NSString*)DataTOjsonString:(id)object {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
