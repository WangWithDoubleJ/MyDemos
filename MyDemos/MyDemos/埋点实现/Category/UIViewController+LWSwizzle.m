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
    
    
    
    
    
}

@end
