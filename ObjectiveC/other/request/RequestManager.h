//
//  RequestManager.h
//  ObjectiveC
//
//  Created by hello on 2019/3/24.
//  Copyright © 2019 William. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RequestManager : NSObject

+ (instancetype)sharedManager;

/**get请求*/
- (void)getRequest:(NSString *)url
        parameters:(id)parameters
           success:(void(^)(id responseObject))success
           failure:(void(^)(NSError *error))failure;
/**post请求*/
- (void)postRequest:(NSString *)url
         parameters:(id)parameters
            success:(void(^)(id responseObject))success
            failure:(void(^)(NSError *error))failure;
/**图片上传*/
- (void)uploadImages:(NSString *)url
              images:(NSArray *)images
          parameters:(id)parameters
            progress:(void(^)(NSProgress *progress))progress
             success:(void(^)(id responseObject))success
             failure:(void(^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
