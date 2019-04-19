//
//  SerializeViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/4/17.
//  Copyright © 2019 William. All rights reserved.
//

#import "SerializeViewController.h"
#import "Person.h"

@interface SerializeViewController ()

@end

@implementation SerializeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)serialize1:(UIButton *)sender {
    NSArray *array = [NSArray arrayWithObjects:@1,@2,@3, nil];
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"testFile.plist"];
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    NSLog(@"%d",success);
    NSLog(@"%@",filePath);
}
- (IBAction)deserialize:(UIButton *)sender {
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"testFile.plist"];
    id array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",array);
}


- (IBAction)serialize2:(UIButton *)sender {
    Person *person = [[Person alloc]init];
    person.name = @"BigBaby";
    person.age = 16;
    person.gender = @"男";
    
    // 归档，调用归档方法
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"person.plist"];
    BOOL success = [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    NSLog(@"%d",success);
}

- (IBAction)deserialize2:(UIButton *)sender {
    // 反归档，调用反归档方法
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"person.plist"];
    Person *per = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",per);
}

@end
