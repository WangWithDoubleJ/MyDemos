//
//  NSURLProtocolVC.m
//  MyDemos
//
//  Created by 平安科技 on 17/5/4.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "NSURLProtocolVC.h"

@interface NSURLProtocolVC ()

@end

@implementation NSURLProtocolVC

- (void)viewDidLoad {
    [super viewDidLoad];

    //配置UI
    [self UIConfig];
    
}


/**
 配置UI
 */
- (void)UIConfig{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *get_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    get_btn.translatesAutoresizingMaskIntoConstraints = NO;;
    [get_btn setTitle:@"GET请求" forState:UIControlStateNormal];
    [get_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    get_btn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:get_btn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:get_btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:get_btn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:get_btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:get_btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0]];
    [get_btn addTarget:self action:@selector(resumeRequest_GET) forControlEvents:UIControlEventTouchUpInside];
    

    UIButton *post_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    post_btn.translatesAutoresizingMaskIntoConstraints = NO;;
    post_btn.backgroundColor = [UIColor lightGrayColor];
    [post_btn setTitle:@"POST请求" forState:UIControlStateNormal];
    [post_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:post_btn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:post_btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:get_btn attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:post_btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:get_btn attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:post_btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:post_btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0]];
    [post_btn addTarget:self action:@selector(resumeRequest_POST) forControlEvents:UIControlEventTouchUpInside];
    
    
}

/**
 GET请求
 */
- (void)resumeRequest_GET{

    NSString *urlStr = [NSString stringWithFormat:@"https://test-mhis-siapp.pingan.com.cn:57443/static/city/citymain/si/common/getRegionsByType?type=siOnline"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
    [task resume];
    
}


/**
 POST请求
 */
- (void)resumeRequest_POST{
    

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
