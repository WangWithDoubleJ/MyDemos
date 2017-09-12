//
//  PAAddressPicker.h
//  SZYiZhangTong
//
//  Created by 平安科技 on 2017/9/9.
//  Copyright © 2017年 pingan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PAAddressPicker : UIView

@property (nonatomic, copy) void(^selectedBlock)(id content,NSInteger index);       ///<点击确认执行的回调

+ (id)showCityPickerView:(UIView *)view :(NSString *)title :(NSArray *)datas :(void(^)(id content,NSInteger index))completeBlock;
@end
