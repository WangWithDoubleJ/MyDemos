//
//  LWSwizzleTool.h
//  MyDemos
//
//  Created by 平安科技 on 2017/6/22.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWSwizzleTool : NSObject

+ (void)lw_swizzleWithClass:(Class)prosessedClass originalSelector:(SEL)originalSelector swizzleSelector:(SEL)swizzleSelector;

@end
