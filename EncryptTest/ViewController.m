//
//  ViewController.m
//  EncryptTest
//
//  Created by ZP on 2021/4/16.
//

#import "ViewController.h"
#import "HPCryptoTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*
    algorithm 控制AES  DES
    iv控制 ECB CBC
    */
    
    //key
    NSString *key = @"abc";
    //iv
    uint8_t iv[8] = {1,2,3,4,5,6,7,8};
    NSData *ivData = [NSData dataWithBytes:iv length:sizeof(iv)];
    //message
    NSString *message = @"HotpotCat";
    
    
    
    //AES + ECB 加密
    NSString *encAES_ECBResult = [[HPCryptoTools sharedEncryptionTools] encryptString:message keyString:key iv:nil];
    NSLog(@"AES_ECB enc：%@",encAES_ECBResult);

    //AES + ECB 解密
    NSString *decAES_ECBResult = [[HPCryptoTools sharedEncryptionTools] decryptString:encAES_ECBResult keyString:key iv:nil];
    NSLog(@"AES_ECB dec：%@",decAES_ECBResult);

    //AES + CBC 加密
    NSString *encAES_CBCResult = [[HPCryptoTools sharedEncryptionTools] encryptString:message keyString:key iv:ivData];
    NSLog(@"AES_CBC enc：%@",encAES_CBCResult);

    //AES + CBC  解密
    NSString *decAES_CBCResult = [[HPCryptoTools sharedEncryptionTools] decryptString:encAES_CBCResult keyString:key iv:ivData];
    NSLog(@"AES_CBC dec：%@",decAES_CBCResult);
    
    
    //修改加密为DES
    [HPCryptoTools sharedEncryptionTools].algorithm = kCCAlgorithmDES;
    
    //DES + ECB 加密
    NSString *encDES_ECBResult = [[HPCryptoTools sharedEncryptionTools] encryptString:message keyString:key iv:nil];
    NSLog(@"DES_ECB enc：%@",encDES_ECBResult);
    
    //AES + ECB 解密
    NSString *decDES_ECBResult = [[HPCryptoTools sharedEncryptionTools] decryptString:encDES_ECBResult keyString:key iv:nil];
    NSLog(@"DES_ECB dec：%@",decDES_ECBResult);

    //AES + CBC 加密
    NSString *encDES_CBCResult = [[HPCryptoTools sharedEncryptionTools] encryptString:message keyString:key iv:ivData];
    NSLog(@"DES_CBC enc：%@",encDES_CBCResult);
    
    //AES + CBC  解密
    NSString *decDES_CBCResult = [[HPCryptoTools sharedEncryptionTools] decryptString:encDES_CBCResult keyString:key iv:ivData];
    NSLog(@"DES_CBC dec：%@",decDES_CBCResult);

}


@end
