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
    
    NSArray *arr0 = @[@1,@2,@3,@4];
    NSArray *arr1 = [NSArray arrayWithObjects:@4,@5, nil];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF in %@",arr0];
    NSString *arrR1 = [arr1 filteredArrayUsingPredicate:predicate];
    
    
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
