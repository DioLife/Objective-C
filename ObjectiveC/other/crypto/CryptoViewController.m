//
//  EncryptionViewController.m
//  ObjectiveC
//
//  Created by Geek on 2019/12/12.
//  Copyright © 2019 William. All rights reserved.
//

#import "CryptoViewController.h"
#import "CryptoUtil.h"
#import "RSA.h"

@interface CryptoViewController ()

@property(nonatomic, copy)NSString *originString;//待加密字符串
@property(nonatomic, copy)NSString *publickKey;//公钥
@property(nonatomic, copy)NSString *privateKey;//私钥
@property(nonatomic, copy)NSString *result;

@end

@implementation CryptoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     生成公钥和私钥的网站:http://web.chacuo.net/netrsakeypair
     **/
    self.publickKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC2hpqSwl56BbfWzf652a6gZDwVHuqBFkI3zPN4ywlUNdwiLlCFBb3MPi8OdBdXoafSpwdm8zUfQhK71GcBMPvlhGzQnaRbH6JLGV9U8Y7XVoUMdSFXs7SqahdqMUZ+p+3eeD2anH3nTycVyj7ymLc0YUgvln7xuPHPDRrCv0lXhQIDAQAB";
    self.privateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALaGmpLCXnoFt9bN/rnZrqBkPBUe6oEWQjfM83jLCVQ13CIuUIUFvcw+Lw50F1ehp9KnB2bzNR9CErvUZwEw++WEbNCdpFsfoksZX1TxjtdWhQx1IVeztKpqF2oxRn6n7d54PZqcfedPJxXKPvKYtzRhSC+WfvG48c8NGsK/SVeFAgMBAAECgYBAuPRAzCmCLVrmEX+c2WLBvylK9/6BrannbYZ8M8roEH0xpaipssJ9lSNMhb/tNAZ1fQLz75PLtLs93XB1DLCVNbsnikuqufCb58cBsMZ3F19YEjixzkq1uWXvR54OazchRAcEO717caVypwSbo08ybYp3d0NjXMChnOT5pvKB4QJBAOdWge8wAken16ivHdpzU/RJ01SJJcGIVV+Xn7/257sQMinUeMSrt+s/lHnd3+ajz25xZKEYx/kLhG97ZBDj+hkCQQDJ+/REu2OFwGBg2S2sjF+M8krmnr0AKzVYze46N2MXlz4iRxFmHgzPSgSCTPkB3b/dwXGcb42FB8PUYF0QD85NAkEAl0/b+Qjb1OaRhoHT8viQJy7KjXaPPYDg5n+UO8lRVOeJCBczTuBKkhKqGPPo6UCoAsMkYMKGufywiQKaNvoGsQJAIUneAynjCBshhzSj22kzIjaYc5O70HhOjXk7Busz8KJjgiC2VF8le1BWl+b5rv4N7g1AnSihaUhTVQAgtlH0jQJALOHAJe5jlWkBRy7YmYgw98wzDPeHenK3RY5H3jXlrtMGDjCPEiHknRiCjZJjW0I/wJ8vPs7Jlz2CrpYqpIJdFw==";
    
    self.originString = @"Hello Dio Brand";
    NSLog(@"Original string(%d): %@", (int)self.originString.length, self.originString);
}

- (IBAction)RSAencryption:(UIButton *)sender {
    self.result = [RSA encryptString:self.originString publicKey:self.publickKey];
    NSLog(@"Encrypted with public key: %@", self.result);
}

- (IBAction)RSAdecryption:(UIButton *)sender {
    if (self.result == nil) {
        NSLog(@"待解密字符串为空");
        return;
    }
    NSString *decWithPrivKey = [RSA decryptString:self.result privateKey:self.privateKey];
    NSLog(@"Decrypted with private key: %@", decWithPrivKey);
}

- (IBAction)MD5encryption:(UIButton *)sender {
    NSString *result = [CryptoUtil md5:self.originString];
    NSLog(@"MD5: %@", result);
}

- (IBAction)base64encryption:(UIButton *)sender {
    NSString *result = [CryptoUtil base64EncodeString:self.originString];
    NSLog(@"Base64: %@", result);
}


@end
