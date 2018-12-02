//
//  MyManager.m
//  ObjectiveC
//
//  Created by hello on 2018/12/2.
//  Copyright © 2018 William. All rights reserved.
//

#import "MyManager.h"

@implementation MyManager

+ (instancetype)sharedManager {
    static MyManager * staticInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        staticInstance = [[self alloc] init];
    });
    return staticInstance;
}

@end
