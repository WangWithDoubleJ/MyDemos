//
//  CitySelectorController.m
//  MyDemos
//
//  Created by 平安科技 on 2017/9/9.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "CitySelectorController.h"
#import "PAAddressPicker.h"

@interface CitySelectorController ()

@end

@implementation CitySelectorController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [PAAddressPicker showCityPickerView:self.view :@"A城市" :@[@"江岸区",@"圣彼得堡",@"尼古拉斯凯奇",@"阿尔及利亚",@"汉阳",@"江汉",@"东村",@"西村",@"南村"] :^(id content) {
        NSLog(@"%@",content);
    }];
    

}

- (void)dealloc{
    
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
