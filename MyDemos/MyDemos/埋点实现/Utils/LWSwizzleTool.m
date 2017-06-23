//
//  LWSwizzleTool.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/22.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "LWSwizzleTool.h"
#import <objc/runtime.h>

/**
 说明：
 1.class_getClassMethod()获取的是类方法,class_getInstanceMethod()才是获取的实例方法
 2.在下面使用class_addMethod()添加判断：如果添加成功说明需要替换的是不同名方法，需要通过 class_replaceMethod()函数替换方法实现，如果是同名方法，则直接交换方法指针指向即可。
 
 
 
 
 3.交换方法的用途:
 
 */

@implementation LWSwizzleTool

+ (void)lw_swizzleWithClass:(Class)prosessedClass originalSelector:(SEL)originalSelector swizzleSelector:(SEL)swizzleSelector{
    
    
    Method originalMethod = class_getInstanceMethod(prosessedClass, originalSelector);
    Method swizzleMethod = class_getInstanceMethod(prosessedClass, swizzleSelector);
    
    //统一各类里面不能含有同名的类方法,如果同名返回NO,交换方法的实现机会
    BOOL isAddMethod = class_addMethod(prosessedClass, originalSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (isAddMethod) {
        class_replaceMethod(prosessedClass, swizzleSelector, method_getImplementation(originalMethod), method_getTypeEncoding(swizzleMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }

}



@end
