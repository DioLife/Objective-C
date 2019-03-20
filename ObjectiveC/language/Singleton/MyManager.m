//
//  MyManager.m
//  ObjectiveC
//
//  Created by hello on 2018/12/2.
//  Copyright © 2018 William. All rights reserved.
//

#import "MyManager.h"

static MyManager *staticInstance = nil;

@implementation MyManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        staticInstance = [[self alloc] init];
        staticInstance = [[super allocWithZone:NULL] init]; // 与下面两个方匹配
    });
    return staticInstance;
    
    /***上面代码是用GCD实现,下面的代码不用***/
//    if (staticInstance == nil) {
//        staticInstance = [[self alloc] init];
//    }
//    return staticInstance;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [MyManager sharedManager];
}

-(id)copyWithZone:(struct _NSZone *)zone{
    return [MyManager sharedManager];
}

@end
