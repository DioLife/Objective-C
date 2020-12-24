//
//  CryptoUtil.h
//  ObjectiveC
//
//  Created by lzd_free on 2020/12/23.
//  Copyright © 2020 William. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CryptoUtil : NSObject

+(NSString *)base64EncodeString:(NSString *)string;
+(NSString *)md5:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
