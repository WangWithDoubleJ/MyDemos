//
//  UIControl+LWSwizzle.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/23.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "UIControl+LWSwizzle.h"
#import "LWSwizzleTool.h"
#import "MaiDianDataModel.h"

@implementation UIControl (LWSwizzle)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzleSelector = @selector(lw_sendAction:to:forEvent:);
        [LWSwizzleTool lw_swizzleWithClass:[self class] originalSelector:originalSelector swizzleSelector:swizzleSelector];
    });
}

- (void)lw_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    //这里实际调用的是系统方法
    [self lw_sendAction:action to:target forEvent:event];
    
    NSString *selName =  NSStringFromSelector(action);
    NSString *clsName = NSStringFromClass([target class]);
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"LWLogInfo" ofType:@"plist"];
    NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:pathString];
    NSDictionary *controllerDict = [plistDict objectForKey:clsName];
    
    //如果该类不在埋点配置表内则无需请求网络上传Log
    if (!controllerDict) return;
    
    //获取对应字段名的值，并作为参数上传服务器
    NSArray *pamas = [controllerDict objectForKey:selName];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    MaiDianDataModel *model = [[MaiDianDataModel alloc] init];
    for (NSString *pama in pamas) {
        SEL dataSelector = NSSelectorFromString(pama);
        id value = [model performSelector:dataSelector withObject:nil];//调用model的get方法获取对应参数的值
        if(value){
          [dic setObject:value forKey:pama];
        }
    }
    [RequestManager requestForLogs:dic];
    
}

@end
