//
//  MaiDianViewController.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/21.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//
/**
 埋点相关博客地址:http://www.jianshu.com/p/69859d580354
 埋点demo:https://github.com/MikeFighting/LogByRunTime
 demo相关参数: eid:事件id，sa:用户id, cI:当前时间
 */

#import "MaiDianViewController.h"
#import "LWSwizzleTool.h"

@interface MaiDianViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MaiDianViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    int a[5] = {1, 2, 3, 4, 5};
//    int *ptr = (int *)(&a + 1);
//    printf("%d, %d", *(a + 1), *(ptr + 1));
    
  
    [self btnConfig];
    
    [self tableViewConfig];
    

    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

#pragma mark - btn点击埋点记录

- (void)btnConfig{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titleArr = @[@{@"title":@"leftBtn",@"selector":@"runtimeLeftAction:"},
                          @{@"title":@"middleBtn",@"selector":@"runtimeMiddleAction:"},
                          @{@"title":@"rightBtn",@"selector":@"runtimeRightAction:"}];
    
    NSInteger margin = CMScale(20.0);
    NSInteger btnW = (kLWScreenW - (titleArr.count+1)*margin)/titleArr.count;
    
    for (int i = 0; i<titleArr.count; i++) {
        
        NSDictionary *btnInfo = titleArr[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:btnInfo[@"title"] forState:UIControlStateNormal];
        SEL selector = NSSelectorFromString(btnInfo[@"selector"]);
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(margin+64);
            make.left.mas_equalTo(margin*(i+1)+btnW*i);
            make.width.mas_equalTo(btnW);
            make.height.mas_equalTo(CMScale(40));            
        }];
    }
}

-(void)runtimeLeftAction:(UIButton *)btn{

}
-(void)runtimeMiddleAction:(UIButton *)btn{
    
}
-(void)runtimeRightAction:(UIButton *)btn{
    
}


#pragma mark - cell点击埋点记录

- (void)tableViewConfig{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - 手势点击埋点记录







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
