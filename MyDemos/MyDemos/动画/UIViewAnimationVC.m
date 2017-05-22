//
//  UIViewAnimationVC.m
//  MyDemos
//
//  Created by 平安科技 on 17/5/22.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "UIViewAnimationVC.h"

@interface UIViewAnimationVC ()

@end

@implementation UIViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //
    [self viewAnimationDemo];
    
    
//  [self coreAnimationDemo];

}


/**
 UIView动画
 */
- (void)viewAnimationDemo{
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 100, 100)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    
    
//    testView.transform = CATransform3DIsAffine(<#CATransform3D t#>)
    

}

/**
 核心动画
 */
- (void)coreAnimationDemo{
    
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
