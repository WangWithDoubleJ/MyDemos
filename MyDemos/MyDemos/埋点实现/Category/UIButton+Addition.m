//
//  UIButton+Addition.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/29.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "UIButton+Addition.h"
#import <objc/runtime.h>

@implementation UIButton (Addition)

static void *key = @"LWBtnTitle";

- (void)setLWBtnTitle:(NSString *)LWBtnTitle{
    objc_setAssociatedObject(self, key, LWBtnTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)LWBtnTitle{
    return objc_getAssociatedObject(self, key);
}
@end
