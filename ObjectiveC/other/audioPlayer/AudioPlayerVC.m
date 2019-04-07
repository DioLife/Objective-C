//
//  AudioPlayerVC.m
//  ObjectiveC
//
//  Created by hello on 2019/4/5.
//  Copyright © 2019 William. All rights reserved.
//

#import "AudioPlayerVC.h"
#import "AudioPlayer.h"

@interface AudioPlayerVC ()

@end

@implementation AudioPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)play:(UIButton *)sender {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"shot.wav" withExtension:nil];
    [[AudioPlayer sharedManager] play:url];
    
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    dispatch_async(queue, ^{
//        NSLog(@"target is finished!");
//    });
}

- (IBAction)play2:(UIButton *)sender {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"rock_clash.wav" withExtension:nil];
    [[AudioPlayer sharedManager] play:url];
}

@end
