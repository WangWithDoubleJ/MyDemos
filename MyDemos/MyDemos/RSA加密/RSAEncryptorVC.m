//
//  RSAEncryptorVC.m
//  MyDemos
//
//  Created by 平安科技 on 17/4/20.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "RSAEncryptorVC.h"
#import "RSAEncryptor.h"

@interface RSAEncryptorVC ()

@end

@implementation RSAEncryptorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UILabel *lab = [[UILabel alloc] init];
    lab.translatesAutoresizingMaskIntoConstraints = NO;;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:40 weight:1.0];
    lab.text = @"RSA加密解密";
    [self.view addSubview:lab];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0]];
//    [self decryptWithFiles];
    
    [self decryptWithString];

}

//使用公钥、私钥文件进行加密解密
- (void)decryptWithFiles{
    //获取公钥文件路径
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    
    //获取私钥文件路径
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    
    //需要加密的字符串：
    NSString *originalStr = @"这个是我要进行加密的一串文字";
    
    //公钥加密
   NSString *encryptStr = [RSAEncryptor encryptString:originalStr publicKeyWithContentsOfFile:public_key_path];
    NSString *decryptStr = [RSAEncryptor decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"1234"];
   
    NSLog(@"encryptStr = %@\n;decryptStr = %@\n;originalStr = %@",encryptStr,decryptStr,originalStr);
    
    
}

/**
 使用公钥私钥字符串进行加密解密
 */
- (void)decryptWithString{
    
    NSString *originalStr = @"这个是我要进行加密的一串文字,WOCA";
    
    
    NSString *private_key = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMmlUgL0XsyLjx2Q2BSLnox7efh8ACV+R18stuOI7Ev16VCoMDx1aLGa7klWMaQP9Jh87JD74o15jio+wC/MOaOo9Q78ZuvjZ+jKeyuS/D/YJykwNY3FKVBSnILIpYwAyN2Pjty3QEwyCpFJoQjF9IbrKa7QRK0lEsblskcRGz8NAgMBAAECgYAaHO2k8k6AgKY09vf0mSwcFzVxZ2WBdXv6qEi66JVpNNxVFKLCgZXgQicPmjjtfR94y9y63dO17ILrl5q91d20yBwPWGm7crUDTQuVcnZL0dtMK39OrbP4RUKnqwlHNrhZdO1l7WJmnADf6X+bfcHfVtCXu3/Md+KbwjEXVxUrwQJBAOzIM59rRQtSJSnOS2NZMa89whDGdsshO2y+Yf8vMrVjMPcy8DMCgbWPXNIMXJCM0KJdQ1N+XyDSssB/1Alo1PECQQDaAxD66xDbRLqbXrTemDfPtsHNIfxfNiR8U62w+I7s/2nlCi83GknTVp5r1NTUBoV9In2kqlBRjslnzaA9hhvdAkEApaLC4fEzImE7WAxUllHtvK3SFNQQg7ZikIZ5nP5SVarmtPYwKy7Et9Jq1xEIq6GlzP66uyx6tUZO/vQsysxHsQJBAL9o2cuz/wTE/yHSsPKOqtHQH6+/GxltK/OMdH9ge/xQ8+SIYJP8nLzU3BrIrmPJpgIL+kxMzGAPAX4F556c1HECQACH06eg3y+pgCnY6FAJ3fHgC4upOXPOLr76NaRy9iF8o+ELx3nARTnlWtAzi8JE3nj1Zt9QCbe0lBvve6m8974=";
    NSString *public_key = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDJpVIC9F7Mi48dkNgUi56Me3n4fAAlfkdfLLbjiOxL9elQqDA8dWixmu5JVjGkD/SYfOyQ++KNeY4qPsAvzDmjqPUO/Gbr42foynsrkvw/2CcpMDWNxSlQUpyCyKWMAMjdj47ct0BMMgqRSaEIxfSG6ymu0EStJRLG5bJHERs/DQIDAQAB";
    
    NSString *encryptStr = [RSAEncryptor encryptString:originalStr publicKey:public_key];
    NSString *decryptStr = [RSAEncryptor decryptString:encryptStr privateKey:private_key];
    NSLog(@"encryptStr = %@\n;decryptStr = %@\n;originalStr = %@",encryptStr,decryptStr,originalStr);
    
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
