//
//  W_URLProtocol.m
//  MyDemos
//
//  Created by 平安科技 on 17/5/4.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "W_URLProtocol.h"

@interface W_URLProtocol()
@property (nonatomic, strong) NSURLRequest *mjj_request;///<请求对象
@end

@implementation W_URLProtocol


/**
 这个方法是自定义protocol的入口，如果你需要对自己关注的请求进行处理则返回YES

 @param request 当前发出的request请求
 @return 是否需要对当前发出的请求进行自定义处理（YES表示要自定义处理/NO表示不进行特殊处理）
 */
+ (BOOL)canInitWithRequest:(NSURLRequest *)request{
    
    
    
    
    return YES;
}



+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request{
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    NSString *url = [mutableRequest.URL host];
    
    
    
    return request;
}

- (void)startLoading{
    
}


@end
