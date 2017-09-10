//
//  UIPickerView+malPicker.m
//  MyDemos
//
//  Created by 平安科技 on 2017/9/9.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "UIPickerView+malPicker.h"

@implementation UIPickerView (malPicker)
- (void)clearSpearatorLine{

    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.size.height < 1){
            [obj setBackgroundColor:[UIColor clearColor]];
        }
    }];
}


@end
