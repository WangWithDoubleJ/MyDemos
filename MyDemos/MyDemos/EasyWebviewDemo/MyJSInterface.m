//
//  MyJSInterface.m
//  MyDemos
//
//  Created by 平安科技 on 2017/7/12.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "MyJSInterface.h"

@implementation MyJSInterface
- (void) test{
    NSLog(@"-(void)test");

}
- (void) testWithParam: (NSString*) param{
    NSLog(@"-(void)testWithParam:(NSString*)param");
    
}
- (void) testWithTwoParam: (NSString*) param AndParam2: (NSString*) param2{
    NSLog(@"- (void) testWithTwoParam: (NSString*) param AndParam2: (NSString*) param2");
}


- (NSString*) testWithRet{
    
    
    
    return nil;
}
@end
