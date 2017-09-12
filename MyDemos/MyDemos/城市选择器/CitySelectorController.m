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
    
    
    [PAAddressPicker showCityPickerView:self.view :@"叙利亚" :@[@"阿富汗",@"利比亚",@"伊拉克",@"伊朗",@"索马里",@"江汉",@"东村",@"西村",@"南村"] :^(id content, NSInteger index) {
        
        
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
