//
//  NetworkViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/5/15.
//  Copyright © 2019 William. All rights reserved.
//

#import "NSURLSessionVC.h"

@interface NSURLSessionVC ()<NSURLSessionDelegate>

@end

@implementation NSURLSessionVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)getAction:(UIButton *)sender {
    //1.确定请求路径
    NSString *urlStr = @"http://103.100.211.187:8848/getTest";
    NSURL *url = [NSURL URLWithString:urlStr];
    //2.创建请求对象
    //请求对象内部默认已经包含了请求头和请求方法（GET）
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    //4.根据会话对象创建一个Task(发送请求）
    /*
     第一个参数：请求对象
     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
     data：响应体信息（期望的数据）
     response：响应头信息，主要是对服务器端的描述
     error：错误信息，如果请求失败，则error有值
     */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            //6.解析服务器返回的数据
            //NSData转成NSString
            NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", resultString);
        }
    }];
    //5.执行任务
    [dataTask resume];
}

- (IBAction)postAction:(UIButton *)sender {
    NSString *urlStr = @"http://www.anant.club:8848/getPost";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置超时时间
    request.timeoutInterval = 30;
    //设置请求头
    [request setValue:@"gzip, deflate, br" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];//设置请求的Content-Type
    //3.修改请求方法为POST
    request.HTTPMethod = @"POST";
    //4.设置请求体(如图body)
    /*
     {"username":"Dio","password":"13131313","argot":"You are geat!","num":11111}
     最终需传到后台的json 字符串。 为了拼接方便就先把所有参数放在 NSMutableDictionary 里，然后再转换成 json字符串的二进制形式
     **/
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"Dio" forKey:@"username"];
    [params setValue:@"13131313" forKey:@"password"];
    [params setValue:@"You are geat!" forKey:@"argot"];
    [params setValue:@11111 forKey:@"num"];
    //NSMutableDictionary 转成 json字符串的二进制形式
    NSData *data= [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    //将json字符串直接转换成二进制数据也可以
    //    NSData *data = [@"{\"username\":\"Dio\",\"password\":\"13131313\",\"argot\":\"You are geat!\",\"num\":11111}" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        //8.解析数据
        //NSData转成NSString
        NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", resultString);
        
    }];
    //7.执行任务
    [dataTask resume];
}

- (IBAction)formdataAction:(UIButton *)sender {
    //1.根据会话对象创建task
    NSString *urlStr = @"http://www.anant.club:8848/testFormdata";
    NSURL *url = [NSURL URLWithString:urlStr];
    //2.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //3.修改请求方法为POST
    request.HTTPMethod = @"POST";
    //4.设置请求体
    NSString *parameter = [NSString stringWithFormat:@"username=%@&area=%@&age=%d&action=%@", @"dio", @"guiyang",18,@"testaction"];
    NSData *data = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    //5.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    //6.根据会话对象创建一个Task(发送请求）
    /*
     第一个参数：请求对象
     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
     data：响应体信息（期望的数据）
     response：响应头信息，主要是对服务器端的描述
     error：错误信息，如果请求失败，则error有值
     */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        //8.解析数据
        //NSData转成NSString
        NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", resultString);
        
    }];
    //7.执行任务
    [dataTask resume];
}

- (IBAction)httpsAction:(UIButton *)sender {
    NSString *urlStr = @"https://www.anant.club:8081/postssl";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置超时时间
    request.timeoutInterval = 30;
    //设置请求头
    [request setValue:@"gzip, deflate, br" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];//设置请求的Content-Type
    //3.修改请求方法为POST
    request.HTTPMethod = @"POST";
    //4.设置请求体(如图body)
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"Dio" forKey:@"username"];
    [params setValue:@"13131313" forKey:@"password"];
    [params setValue:@"You are geat!" forKey:@"argot"];
    [params setValue:@11111 forKey:@"num"];
    //NSMutableDictionary 转成 json字符串的二进制形式
    NSData *data= [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = data;
    
    //程序自动安装证书的方式(会在代理方法中安装本地证书,其他地方与http请求无异)
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc]init]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        //8.解析数据
        //NSData转成NSString
        NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", resultString);
        
    }];
    //7.执行任务
    [dataTask resume];
}

// NSURLSession 自动添加证书的代理方法
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    
    SecTrustRef servertrust = challenge.protectionSpace.serverTrust;
    SecCertificateRef certi= SecTrustGetCertificateAtIndex(servertrust, 0);
    NSData *certidata = CFBridgingRelease(CFBridgingRetain(CFBridgingRelease(SecCertificateCopyData(certi))));
    //证书格式转换 openssl x509 -inform pem -in cert.pem  -outform der -out cert.cer
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cert" ofType:@"cer"];
    NSData *localCertiData = [NSData dataWithContentsOfFile:path];
    if ([certidata isEqualToData:localCertiData]) {
        NSURLCredential *credential = [[NSURLCredential alloc] initWithTrust:servertrust];
        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        NSLog(@"服务端证书认证通过");
    }else {
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
        NSLog(@"服务端认证失败");
    }
}

@end
