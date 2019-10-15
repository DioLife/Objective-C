//
//  ChangeIconViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/10/14.
//  Copyright © 2019 William. All rights reserved.
//

#import "ChangeIconViewController.h"
#import <objc/runtime.h>

@interface ChangeIconViewController ()

@end

@implementation ChangeIconViewController

//在设置icon的时候，会有个系统弹框，这样有时候会不太友好，我们可以使用Runtime，对UIViewController进行扩展来隐藏这个弹框：
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(lq_presentViewController:animated:completion:));
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}
- (void)lq_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
//        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
//        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);
        
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }
    }
    [self lq_presentViewController:viewControllerToPresent animated:flag completion:completion];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)changeAction:(UIButton *)sender {
    UIAlertController *refreshAlert = [UIAlertController alertControllerWithTitle:@"切换App图标" message:@"选择你喜欢的图标~" preferredStyle:UIAlertControllerStyleAlert];
    
    // icon1
    UIImage *image1 = [UIImage imageNamed:@"AppIcon-default"];
    UIAlertAction *defaultIcon = [UIAlertAction actionWithTitle:@"默认图标" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self changeAppIconWithName:nil];
        return;
    }];
    [defaultIcon setValue:[image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forKey:@"image"];
    [refreshAlert addAction:defaultIcon];
    // icon2
    NSString *name2 = @"iWiBi-orange-icon-light";
    UIImage *image2 = [UIImage imageNamed:name2];
    UIAlertAction *newIcon1 = [UIAlertAction actionWithTitle:@"橙色图标-轻亮" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self changeAppIconWithName:name2];
        return;
    }];
    [newIcon1 setValue:[image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forKey:@"image"];
    [refreshAlert addAction:newIcon1];
    // icon3
    NSString *name3 = @"iWiBi-orange-icon";
    UIImage *image3 = [UIImage imageNamed:name3];
    UIAlertAction *newIcon3 = [UIAlertAction actionWithTitle:@"橙色图标-墨深" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self changeAppIconWithName:name3];
    }];
    [newIcon3 setValue:[image3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forKey:@"image"];
    [refreshAlert addAction:newIcon3];
    // icon4
    NSString *name4 = @"iWiBi-orange-two";
    UIImage *image4 = [UIImage imageNamed:name4];
    UIAlertAction *newIcon4 = [UIAlertAction actionWithTitle:@"橙色图标-全彩" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self changeAppIconWithName:name4];
    }];
    [newIcon4 setValue:[image4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forKey:@"image"];
    [refreshAlert addAction:newIcon4];
    // icon5
    NSString *name5 = @"iWiBi-orange-blank";
    UIImage *image5 = [UIImage imageNamed:name5];
    UIAlertAction *newIcon5 = [UIAlertAction actionWithTitle:@"橙色图标-留白" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self changeAppIconWithName:name5];
    }];
    [newIcon5 setValue:[image5 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forKey:@"image"];
    [refreshAlert addAction:newIcon5];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [refreshAlert addAction:cancel];
    [self presentViewController:refreshAlert animated:YES completion:nil];
}

//改变App icon的方法
-(void)changeAppIconWithName:(NSString *)iconName{
    if (@available(iOS 10.3, *)) {
        [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (error != nil) {
                NSLog(@"error:%@", error);
            }
        }];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"更换图标需要 iOS10.3 以上系统才能使用~" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"知道啦" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancelAction];
        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alert animated:YES completion:nil];
    }
}

@end
