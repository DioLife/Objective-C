//
//  WKWebViewVC.m
//  ObjC_UI
//
//  Created by William on 2018/9/28.
//  Copyright © 2018年 William. All rights reserved.
//

#import "WKWebViewVC.h"
#import <WebKit/WebKit.h>
#import <SDAutoLayout.h>

@interface WKWebViewVC ()<WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *webview;
@property (strong, nonatomic) WKWebView *myweb;

@end

@implementation WKWebViewVC

-(WKWebView *)myweb{
    if (!_myweb) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
        self.myweb = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) configuration:configuration];
        self.myweb.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:self.myweb];
        self.myweb.sd_layout
        .leftSpaceToView(self.view, 20)
        .rightSpaceToView(self.view, 20)
        .bottomSpaceToView(self.view, 5)
        .heightRatioToView(self.view, 0.35);
    }
    return _myweb;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self makeWKWebViewInCode];
}

//创建一个WKWebView控件的大致方法
- (void)makeWKWebViewInCode {
    NSString *urlString = @"https://www.baidu.com";
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //    wkwebview属性的集合
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
    //    webview一些首选项的配置
    WKPreferences *preferences = [[WKPreferences alloc]init];
    //    在没有用户交互的情况下，是否允许js打开窗口，macOS默认是yes，iOS默认是no
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    //    webview的最小字体大小
    //    preferences.minimumFontSize = 40.0;
    configuration.preferences = preferences;
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    webView.backgroundColor = [UIColor redColor];
    [self.view addSubview:webView];
    webView.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .bottomSpaceToView(self.view, 5)
    .heightRatioToView(self.view, 0.2);
    
    [webView loadRequest:request];
}

//加载string格式的html代码
- (IBAction)start:(UIButton *)sender {
    NSString *webString = @"<button onclick=\"window.open(&#39;https://5719c.com/index/loginInterface.do&#39;)\" target=\"_blank\" rel=\"external\" style=\"width: 100%;height: 100%;border: #fff;background: #fff;\"><img src=\"https://yb6.me/img/FSJZ/O9BVmU67H.jpg\" width=\"280\" height=\"200\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\" style=\"width: 280px; height: 200px;\"/></button>";
    
    NSURL *url = [NSURL URLWithString:@"https://skyb064.yb876.com"];
//    self.webview.navigationDelegate = self;
    [self.webview loadHTMLString:webString baseURL:url];
}

// 加载本地 web page
- (IBAction)start01:(UIButton *)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"show" ofType:@"html"];
    self.myweb.navigationDelegate = self;
    [self.myweb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}


/************************** delegate方法 *********************************/
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //设置JS (获取show.html 中input标签中的值)
    NSString *inputValueJS = @"document.getElementsByName('input')[0].attributes['value'].value";
    //执行JS
    [webView evaluateJavaScript:inputValueJS completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"value: %@ error: %@", response, error);
    }];
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
