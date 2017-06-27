//
//  RequestManager.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/26.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

+ (void)requestForLogs:(NSDictionary *)pamas{
    NSLog(@"调用了日志上传%@",pamas);
}

@end
