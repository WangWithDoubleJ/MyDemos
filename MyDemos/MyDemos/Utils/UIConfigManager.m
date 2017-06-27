//
//  UIConfigManager.m
//  SIAPP
//  主要通过设置基准和相关的换算统一为app提供统可以适配不同屏幕，机型的UI控件的宽和高和字体
//  Created by nie on 16/8/5.
//  Copyright © 2016年 localadmin. All rights reserved.
//
#define JK_IOS10_OR_LATER               (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_0)

#import "UIConfigManager.h"
#import <Foundation/Foundation.h>
@interface UIConfigManager()

@end
@implementation UIConfigManager

static const int UIDesignWidth = 1080;    ///< UI设计稿中给出的屏幕分辨率的宽度
static const int DesignWidth = 750;
static const int DesignWidth375 = 375;


static UIConfigManager *manager =nil;

+ (id)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[UIConfigManager alloc] init];
    
    });
    
    return manager;
}

// 750.0f ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

// 获取计算后获得的iOS设备上使用的像素大小
- (CGFloat) px:(CGFloat)pixel {
    return [self getDevicePxiel:DesignWidth uiValue:pixel];
}

//获取计算后得到的设备上显示的字体大小
- (CGFloat) pt:(CGFloat)pixel {
    return [self getDevicefontSize:DesignWidth uiValue:pixel];
}

// 1080.0f ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

// 获取计算后获得的iOS设备上使用的像素大小
- (CGFloat) px1:(CGFloat)pixel {
    
    return [self getDevicePxiel:UIDesignWidth uiValue:pixel];
}

//获取计算后得到的设备上显示的字体大小
- (CGFloat) pt1:(CGFloat)pixel {
    
    return [self getDevicefontSize:UIDesignWidth uiValue:pixel];
}


// 375.0f ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

// 获取计算后获得的iOS设备上使用的像素大小
- (CGFloat) px375:(CGFloat)pixel {
    
    return [self getDevicePxiel:DesignWidth375 uiValue:pixel];
}

//获取计算后得到的设备上显示的字体大小
- (CGFloat) pt375:(CGFloat)pixel {
    
    return [self getDevicefontSize:DesignWidth375 uiValue:pixel];
}




- (CGFloat) getDevicePxiel:(CGFloat)uiPxiel uiValue:(CGFloat)uiValue {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat ratio = uiPxiel / width;
    return uiValue / ratio;
}

- (CGFloat) getDevicefontSize:(float)uiPxiel uiValue:(float)uiValue {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat ratio = uiPxiel / width;
    CGFloat result = 0;
    if (JK_IOS10_OR_LATER) {
        
        result = (uiValue / ratio);
        result = 0.95 * result;
        
    }else{
        
        result = uiValue / ratio;
        
    }
    result = uiValue / ratio;
    return result;
}

@end
