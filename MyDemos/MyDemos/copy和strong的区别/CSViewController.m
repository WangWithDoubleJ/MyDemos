//
//  CSViewController.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/28.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "CSViewController.h"

@interface CSViewController ()
@property (nonatomic, copy) NSString *strCopy;
@property (nonatomic, strong) NSString *strStrong;
@property (nonatomic, retain) NSString *strRetain;


@end

@implementation CSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSMutableString *mutableStr = [NSMutableString stringWithString:@"zhangsan"];
//    self.strStrong = mutableStr;
//    self.strCopy = mutableStr;
//    
//    [mutableStr setString:@"lisi"];
//    
//    NSLog(@"self.strStrong = %@;self.strCopy = %@",self.strStrong,self.strCopy);
    
    
    /**
     区别：
     使用strong修饰字符串时，字符串的retain计数将增加1，属性与字符串指向同一个内存地址，这意味着任何指向这个内存地址的变量都可改变这个值。
     copy修饰，则为
     
     */
    
    
    NSMutableString *strRetain = [NSMutableString stringWithFormat:@"123"];
    self.strRetain = strRetain;
    self.strCopy = strRetain;
    NSLog(@"\nstrRetain=%p;\nself.strRetain=%p;\nself.strCopy=%p",strRetain,self.strRetain,self.strCopy);
    
    
    
    
    
    
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
