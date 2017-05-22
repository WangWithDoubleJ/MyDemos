//
//  RSAEncryptor.h
//  MyDemos
//
//  Created by 平安科技 on 17/4/20.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//
/**
 加密解密资料： http://blog.csdn.net/qq_30513483/article/details/51242338
 https://my.oschina.net/ioslighter/blog/359207
 http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html
 */


#import <Foundation/Foundation.h>

@interface RSAEncryptor : NSObject
/**
 *  加密方法
 *
 *  @param str   需要加密的字符串
 *  @param path  '.der'格式的公钥文件路径
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;

/**
 *  解密方法
 *
 *  @param str       需要解密的字符串
 *  @param path      '.p12'格式的私钥文件路径
 *  @param password  私钥文件密码
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;

/**
 *  加密方法
 *
 *  @param str    需要加密的字符串
 *  @param pubKey 公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 *  解密方法
 *
 *  @param str     需要解密的字符串
 *  @param privKey 私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

@end
