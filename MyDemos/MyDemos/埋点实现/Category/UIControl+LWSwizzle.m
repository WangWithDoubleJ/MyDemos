//
//  UIControl+LWSwizzle.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/23.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "UIControl+LWSwizzle.h"
#import "LWSwizzleTool.h"

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
    
    NSString *selName =  NSStringFromSelector(action);
    NSString *clsName = NSStringFromClass([target class]);
    
    
    
    
    //这里实际调用的是系统方法
    [self lw_sendAction:action to:target forEvent:event];
}

@end
