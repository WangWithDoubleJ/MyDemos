//
//  NSString+implement.m
//  MyDemos
//
//  Created by 平安科技 on 2017/7/3.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "NSString+implement.h"

@implementation NSString (implement)

+ (instancetype)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc{
    NSString *obj = nil;
    obj = [self allocWithZone:NSDefaultMallocZone()];
    obj = [obj initWithCString:cString encoding:enc];
    return AUTORELEASE(obj);
    
}
@end
