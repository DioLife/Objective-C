//
//  MyUIViewController.m
//  ObjectiveC
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

#import "MyUIViewController.h"
#import "TableViewVC.h"
#import "WKWebViewVC.h"
#import "MyVideoViewController.h"
#import "MyCollectionViewVC.h"
#import "NibCollectionViewVC.h"
#import "ViewController.h"

@interface MyUIViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation MyUIViewController

-(void)loadData{//添加controller
    self.dataArray = [NSMutableArray array];
    
    ViewController *codeViewVC = [ViewController new];
    codeViewVC.title = @"自定义View";
    [self.dataArray addObject:codeViewVC];
    
    NibCollectionViewVC *nibCollVC = [NibCollectionViewVC new];
    nibCollVC.title = @"nib CollectionView";
    [self.dataArray addObject:nibCollVC];
    
    MyCollectionViewVC *collectionVC = [MyCollectionViewVC new];
    collectionVC.title = @"代码CollectionView";
    [self.dataArray addObject:collectionVC];
    
    MyVideoViewController *videoVC = [MyVideoViewController new];
    videoVC.title = @"Video";
    [self.dataArray addObject:videoVC];
    
    WKWebViewVC *wk = [WKWebViewVC new];
    wk.title = @"WKWebView";
    [self.dataArray addObject:wk];
    
    TableViewVC *tbvc = [[TableViewVC alloc]init];
    tbvc.title = @"TableView";
    [self.dataArray addObject:tbvc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"UI";
    [self loadData];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
