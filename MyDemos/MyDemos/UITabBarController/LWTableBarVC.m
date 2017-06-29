//
//  LWTableBarVC.m
//  MyDemos
//
//  Created by 平安科技 on 2017/6/29.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "LWTableBarVC.h"

@interface LWTableBarVC ()

@end

@implementation LWTableBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self configUI];
}

- (void)configUI{
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.tabBarItem= [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageNamed:@"tabbar_home_sel"]];
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"人社" image:[UIImage imageNamed:@"tabbar_insurance"] selectedImage:[UIImage imageNamed:@"tabbar_insurance_sel"]];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor yellowColor];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"健康" image:[UIImage imageNamed:@"tabbar_health"] selectedImage:[UIImage imageNamed:@"tabbar_health_sel"]];
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor grayColor];
    vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"tabbar_mine"] selectedImage:[UIImage imageNamed:@"tabbar_mine_sel"]];
    
//    self.childViewControllers = @[vc1,vc2,vc3,vc4];
    
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    [self addChildViewController:vc4];
    
    
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"%@",item.title);
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
