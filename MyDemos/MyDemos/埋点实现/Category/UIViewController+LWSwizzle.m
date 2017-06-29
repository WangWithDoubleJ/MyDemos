//
//  UIViewController+LWSwizzle.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/27.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "UIViewController+LWSwizzle.h"
#import "LWSwizzleTool.h"
@implementation UIViewController (LWSwizzle)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(viewDidAppear:);
        SEL swizzleSelector = @selector(lw_viewDidAppear:);
        [LWSwizzleTool lw_swizzleWithClass:[self class] originalSelector:originalSelector swizzleSelector:swizzleSelector];
    });
}

- (void)lw_viewDidAppear:(BOOL)animated{
    [self lw_viewDidAppear:animated];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LWLogInfo" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *classStr = NSStringFromClass([self class]);
    NSDictionary *classMethodDic = dic[classStr];
    if (!classMethodDic)return;
    NSArray *methodKeys = classMethodDic.allKeys;
    for (NSString *methodStr in methodKeys) {
       SEL originalSelector = NSSelectorFromString(methodStr);
       NSRange range = [methodStr rangeOfString:@"ControlAction"];
       BOOL isControlAction = range.length?YES:NO;
       BOOL isResponds = [self respondsToSelector:originalSelector];
       if (isControlAction || !isResponds) return;//如果是Control事件或者无法响应方法则不上传Log
        
        //遍历该类中的所有需要进行埋点统计的方法，通过aspact进行种专交换并将相关信息传递给服务器
        [[self class] aspect_hookSelector:originalSelector withOptions:AspectPositionAfter usingBlock:^(id <AspectInfo>info){
            
           NSArray *paramArr = [classMethodDic objectForKey:methodStr];
           
            
            
            
            
            
        } error:nil];
            
        
        
        
        
        
    }
}

@end
