//
//  SwizzMethodVC.m
//  MyDemos
//
//  Created by 平安科技 on 17/5/19.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "SwizzMethodVC.h"
#import <objc/runtime.h>
@interface SwizzMethodVC ()

@end

@implementation SwizzMethodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)swizzleMethod:(SEL)originSelector withMethod:(SEL)newSelector{
    Class class =  [self class];
    Method originalMethod = class_getInstanceMethod(class, originSelector);
    Method swizzledMethod = class_getInstanceMethod(class, newSelector);
    
    /**
     
     struct objc_class {
        Class isa;
     #if !__OBJC2__
        Class super_class                                        OBJC2_UNAVAILABLE;父类
        const char *name                                         OBJC2_UNAVAILABLE;类名称
        long version                                             OBJC2_UNAVAILABLE;版本信息
        long info                                                OBJC2_UNAVAILABLE;类信息
        long instance_size                                       OBJC2_UNAVAILABLE;实例大小
        struct objc_ivar_list *ivars                             OBJC2_UNAVAILABLE;实例参数链表
        struct objc_method_list **methodLists                    OBJC2_UNAVAILABLE;类方法链表
        struct objc_cache *cache                                 OBJC2_UNAVAILABLE;类方法缓存
        struct objc_protocol_list *protocols                     OBJC2_UNAVAILABLE;协议链表
     #endif
     } OBJC2_UNAVAILABLE;
     
     
     typedef struct objc_method *Method;
     struct objc_method {
        SEL method_name                                          OBJC2_UNAVAILABLE;   标示方法名称
        char *method_types                                       OBJC2_UNAVAILABLE;    方法的参数类型
        IMP method_imp                                           OBJC2_UNAVAILABLE;    指向该方法的具体实现的函数指针
     }
     
     struct objc_method_list {
        struct objc_method_list *obsolete                        OBJC2_UNAVAILABLE;
        int method_count                                         OBJC2_UNAVAILABLE;
        #ifdef __LP64__
        int space                                                OBJC2_UNAVAILABLE;
        #endif
        //variable length structure
        struct objc_method method_list[1]                        OBJC2_UNAVAILABLE;
     }
     
     
     
     
     
     
     */
    
    BOOL isAddMethod = class_addMethod(class,originSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
    if (isAddMethod) {
        class_replaceMethod(class, originSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
    }
    
    
    
    

    
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
