//
//  NetworkViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/5/15.
//  Copyright © 2019 William. All rights reserved.
//

#import "NetworkViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface NetworkViewController ()

@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)getAction:(UIButton *)sender {
    //1.确定请求路径
    NSString *urlStr = @"";
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
            //说明：（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
            //6.1 把JSON转换成NSDictionary
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"%@", resultDict);
            //6.2 把JSON转换成NSString
            NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", resultString);
        }
    }];
    //5.执行任务
    [dataTask resume];
}

- (IBAction)postAction:(UIButton *)sender {
    //1.根据会话对象创建task
    NSString *urlStr = @"";
    NSURL *url=[NSURL URLWithString:urlStr];
    //2.创建可变的请求对象
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //3.修改请求方法为POST
    request.HTTPMethod=@"POST";
    //4.设置请求体
    NSString *parameter = [NSString stringWithFormat:@"username=%@&pwd=%@", @"Jim", @"123456"];
#pragma 参数以字符串格式传过去,根据需要可以设置成JSON格式
    request.HTTPBody=[parameter dataUsingEncoding:NSUTF8StringEncoding];
    //5.获得会话对象
    NSURLSession *session=[NSURLSession sharedSession];
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
        //8.1 把JSON转换成NSDictionary
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@", resultDict);
        //8.2 把JSON转换成NSString
        NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", resultString);
        
    }];
    //7.执行任务
    [dataTask resume];
}

- (IBAction)postExample:(UIButton *)sender {
    NSString *urlStr = @"http://slavex.3dabuliu.com/app/info";
    NSURL *url=[NSURL URLWithString:urlStr];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //设置超时时间
    request.timeoutInterval = 30;
    //设置请求头(如图header)
    [request setValue:@"com.dio.HideDemoOC" forHTTPHeaderField:@"d"];
    [request setValue:@"1" forHTTPHeaderField:@"c"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];//设置请求的Content-Type
    //3.修改请求方法为POST
    request.HTTPMethod=@"POST";
    //4.设置请求体(如图body)
    NSDictionary *parameters = @{@"a":@"62ffd67ddd9aacddbd5aaa09a5feb4ec", @"b":@"2"};
    NSDictionary *lastParam = [self getNewParameter:parameters];
#pragma 这里参数需要以JSON格式传给后台。把参数放在NSDictionary里,然后把NSDictionary转成NSData
    NSData *data= [NSJSONSerialization dataWithJSONObject:lastParam options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = data;
    
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        //8.解析数据
        //8.1 把JSON转换成NSDictionary
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@", resultDict);
        //8.2 把JSON转换成NSString
        NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", resultString);
        
    }];
    //7.执行任务
    [dataTask resume];
}
//对string进行base64加密
-(NSString *)base64EncodeString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
//对string进行md5加密
- (NSString *)md5:(NSString *)Getmd5string {
    const char *cStr = [Getmd5string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
//对请求参数进行加密
-(NSDictionary *)getNewParameter:(id)parameter {
    NSData *jsonData= [NSJSONSerialization dataWithJSONObject:parameter options:NSJSONWritingPrettyPrinted error:nil];
    NSString *objectStr=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *object = [self base64EncodeString:objectStr];
    NSString *signstr=[object stringByAppendingString:@"123456"];
    NSString *sign=[self md5:signstr];
    NSDictionary *newparameter=@{@"object":object,@"sign":sign};
    return newparameter;
}

@end
