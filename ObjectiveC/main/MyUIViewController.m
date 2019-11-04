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
#import "PickimageViewController.h"
#import "BrowerViewController.h"
#import "MyFontViewController.h"

@interface MyUIViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation MyUIViewController

-(void)loadData{//添加controller
    self.dataArray = [NSMutableArray array];
    
    MyFontViewController *fontVC = [MyFontViewController new];
    fontVC.title = @"自定义字体";
    [self.dataArray addObject:fontVC];
    
    BrowerViewController *browerVC = [BrowerViewController new];
    browerVC.title = @"跳转到浏览器";
    [self.dataArray addObject:browerVC];
    
    PickimageViewController *pickImageVC = [PickimageViewController new];
    pickImageVC.title = @"选取图片";
    [self.dataArray addObject:pickImageVC];
    
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


@end