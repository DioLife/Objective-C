//
//  RequestManager.m
//  ObjectiveC
//
//  Created by hello on 2019/3/24.
//  Copyright © 2019 William. All rights reserved.
//

#import "RequestManager.h"
#import <AFNetworking.h>

static RequestManager *staticInstance = nil;

@implementation RequestManager

#pragma mark - 设置请求的配置
- (void)setRequestWithManager:(AFHTTPSessionManager *)manager {
    //30s超时
    manager.requestSerializer.timeoutInterval = 30;
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    AFJSONResponseSerializer *response=[AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues=YES;
    manager.responseSerializer=response;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",nil];
    //设置请求头
    [manager.requestSerializer setValue:@"utf-8" forHTTPHeaderField:@"Content-Type"];
}
#pragma mark - get请求
- (void)getRequest:(NSString *)url parameters:(id)parameters success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [self setRequestWithManager:manager];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        success(responseObject);
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString;
        if (!jsonData) {
            NSLog(@"%@",error);
        }else{
            jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
//        NSLog(@"type of jsonString:%@", [jsonString class]);
//        NSLog(@"\n%@", jsonString);
        success(jsonString);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
#pragma mark - post请求
- (void)postRequest:(NSString *)url parameters:(id)parameters success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [self setRequestWithManager:manager];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        success(responseObject);
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString;
        if (!jsonData) {
            NSLog(@"%@",error);
        }else{
            jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
//        NSLog(@"type of jsonString:%@", [jsonString class]);
//        NSLog(@"\n%@", jsonString);
        success(jsonString);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
#pragma mark - 图片上传
- (void)uploadImages:(NSString *)url images:(NSArray *)images parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))progress success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [self setRequestWithManager:manager];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UIImage *image in images) {
            //压缩图片
            NSData *data = UIImageJPEGRepresentation(image, 0.4);
            //多张图片是需要在name中加“[]”，单张上传时不用
            [formData appendPartWithFileData:data name:@"file[]" fileName:[NSString stringWithFormat:@"%@.jpg",[NSDate date]] mimeType:@"image/jpeg"];
            
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticInstance = [[super allocWithZone:NULL] init]; // 与下面两个方匹配
    });
    return staticInstance;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [RequestManager sharedManager];
}

-(id)copyWithZone:(struct _NSZone *)zone{
    return [RequestManager sharedManager];
}

@end
