//
//  CryptoUtil.m
//  ObjectiveC
//
//  Created by lzd_free on 2020/12/23.
//  Copyright © 2020 William. All rights reserved.
//

#import "CryptoUtil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation CryptoUtil

//对string进行base64编码
+(NSString *)base64EncodeString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

//对string进行md5加密
+(NSString *)md5:(NSString *)string {
    const char *cStr = [string UTF8String];
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

@end
