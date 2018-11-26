//
//  VideoViewController.m
//  ObjectiveC
//
//  Created by hello on 2018/11/23.
//  Copyright © 2018 William. All rights reserved.
//

#import "MyVideoViewController.h"
#import <AVFoundation/AVFoundation.h> //需要导入框架

#define EYScreenWidth [[UIScreen mainScreen] bounds].size.width
#define EYScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface MyVideoViewController ()

@end

@implementation MyVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self test];
    [self test2];
}

- (void)test2 {
    //1.从mainBundle获取test.mp4的具体路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"m3u8" ofType:@"m3u"];
    NSLog(@"%@", path);
    //2.文件的url
    NSURL *url = [NSURL fileURLWithPath:path];
}

// 播放mp4
- (void)test {
    //1.从mainBundle获取test.mp4的具体路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
    NSLog(@"%@", path);
    //2.文件的url
    NSURL *url = [NSURL fileURLWithPath:path];
    
    //3.根据url创建播放器(player本身不能显示视频)
    AVPlayer *player = [AVPlayer playerWithURL:url];
    
    //4.根据播放器创建一个视图播放的图层
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    //5.设置图层的大小
    layer.frame = CGRectMake(0, 0, EYScreenWidth, EYScreenHeight);
    
    //6.添加到控制器的view的图层上面
    [self.view.layer addSublayer:layer];
    
    //7.开始播放
    [player play];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
