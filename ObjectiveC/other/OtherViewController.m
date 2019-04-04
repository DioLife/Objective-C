//
//  OtherViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/3/17.
//  Copyright © 2019 William. All rights reserved.
//

#import "OtherViewController.h"
#import "ClearCacheViewController.h"
#import "RequestViewController.h"
#import "JudgeNetworkingVC.h"
#import "LocalizableViewController.h"
#import "OrientationVC.h"
#import "SpeechViewController.h"
#import "MessageViewController.h"

@interface OtherViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation OtherViewController

-(void)loadData{//添加controller
    self.dataArray = [NSMutableArray array];
    
    MessageViewController *messageVC = [MessageViewController new];
    messageVC.title = @"发信息";
    [self.dataArray addObject:messageVC];
    
    SpeechViewController *speechVC = [SpeechViewController new];
    speechVC.title = @"语音处理";
    [self.dataArray addObject:speechVC];
    
    OrientationVC *orientationVC = [OrientationVC new];
    orientationVC.title = @"屏幕方向变化";
    [self.dataArray addObject:orientationVC];
    
    LocalizableViewController *localizableVC= [LocalizableViewController new];
    localizableVC.title = @"本地化";
    [self.dataArray addObject:localizableVC];
    
    JudgeNetworkingVC *judgeVC = [JudgeNetworkingVC new];
    judgeVC.title = @"网络判断";
    [self.dataArray addObject:judgeVC];
    
    RequestViewController *requestVC = [RequestViewController new];
    requestVC.title = @"封装的网络请求";
    [self.dataArray addObject:requestVC];
    
    ClearCacheViewController *clearCacheVC = [ClearCacheViewController new];
    clearCacheVC.title = @"清理缓存";
    [self.dataArray addObject:clearCacheVC];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Other";
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
