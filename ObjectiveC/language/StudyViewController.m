//
//  StudyViewController.m
//  ObjectiveC
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

#import "StudyViewController.h"
#import "LazyloadViewController.h"
#import "ShowSingletonViewController.h"
#import "Audio/AVPlayerViewController.h"
#import "GCD/GCDViewController.h"
#import "DelegateViewController.h"
#import "device/DeviceViewController.h"
#import "NetworkViewController.h"

@interface StudyViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation StudyViewController

-(void)loadData{//添加controller
    self.dataArray = [NSMutableArray array];
    
    NetworkViewController *networkVC = [NetworkViewController new];
    networkVC.title = @"原生网络请求";
    [self.dataArray addObject:networkVC];
    
    DeviceViewController *devVC = [DeviceViewController new];
    devVC.title = @"设备信息";
    [self.dataArray addObject:devVC];
    
    DelegateViewController *delegateVC = [DelegateViewController new];
    delegateVC.title = @"delegate";
    [self.dataArray addObject:delegateVC];
    
    GCDViewController *GCDVC = [GCDViewController new];
    GCDVC.title = @"GCD";
    [self.dataArray addObject:GCDVC];
    
    AVPlayerViewController *audioVC = [AVPlayerViewController new];
    audioVC.title = @"音频播放";
    [self.dataArray addObject:audioVC];
    
    ShowSingletonViewController *showSingletonVC = [ShowSingletonViewController new];
    showSingletonVC.title = @"单例";
    [self.dataArray addObject:showSingletonVC];
    
    LazyloadViewController *lazy = [LazyloadViewController new];
    lazy.title = @"lazyload";
    [self.dataArray addObject:lazy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"language";
    [self loadData];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
}

//Sections数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//Row数量
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    UIViewController *anyVC = _dataArray[indexPath.row];
    cell.textLabel.text = anyVC.title;
    return cell;
}
//点击cell事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *anyVC = _dataArray[indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:anyVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
