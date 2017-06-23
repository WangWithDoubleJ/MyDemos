//
//  LWSwizzleTool.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/22.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "LWSwizzleTool.h"
#import <objc/runtime.h>

@implementation LWSwizzleTool

+ (void)lw_swizzleWithClass:(Class)prosessedClass originalSelector:(SEL)originalSelector swizzleSelector:(SEL)swizzleSelector{
    
    Method originalMethod = class_getClassMethod(prosessedClass, originalSelector);
    Method swizzleMethod = class_getClassMethod(prosessedClass, swizzleSelector);
    
    BOOL isAddMethod = class_addMethod(prosessedClass, originalSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (isAddMethod) {
        class_replaceMethod(prosessedClass, swizzleSelector, method_getImplementation(originalMethod), method_getTypeEncoding(swizzleMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }

}



@end
