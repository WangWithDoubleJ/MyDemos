//
//  CCodeTestVC.m
//  MyDemos
//
//  Created by 平安科技 on 17/5/15.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "CCodeTestVC.h"

#define max(a,b) ((a) >= (b))?(a):(b)

@interface CCodeTestVC ()

@end

@implementation CCodeTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self pointTest];
    [self copyFuncs];
}

//指针
-(void)pointTest{
    
    int array[5] = {1, 2, 3, 4, 5};
    int *p = &array[0];
    int max = MAX(*p++, 1);
    printf("%d %d \n", max, *p);

}

//拷贝函数:strcpy、sprintf、memcpy
-(void)copyFuncs{
    //strcpy
    char str1[10];
    char *str2 = "123";
    strcpy(str2, str1);
    
    //sprintf
    char buf[100];
    sprintf(buf, "The length of the string is more than %d",10);
    printf("%s", buf);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
