//
//  NSPredicateTestVC.m
//  MyDemos
//
//  Created by 平安科技 on 2017/7/2.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "NSPredicateTestVC.h"

@interface NSPredicateTestVC ()

@end

@implementation NSPredicateTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *arr0 = @[@1,@2,@3,@4];
//    NSArray *arr1 = [NSArray arrayWithObjects:@4,@5, nil];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF in %@",arr0];
//    NSString *arrR1 = [arr1 filteredArrayUsingPredicate:predicate];
//    NSString *str = nil;
//    int *a = NULL;
    
    //结构体
    struct Test {
        int a;
        BOOL b;
        char *str;
    };
    
    struct Test STR1,*STR2;
    //结构体需要初始化
    STR2 = (struct Test *)malloc(sizeof(struct Test));
    STR1.a = 5;
    STR2->a = 3;
    //获取结构体的所占的字节数
//    int size1 = sizeof(struct Test);
    
    //获取结构体重某个成员所占字节数
//    int size2 = offsetof(struct Test, b);
    
    
    //block
    NSString *(^myBlock)(int) = NULL;
    myBlock = ^(int a){
        return @"";
    };
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
