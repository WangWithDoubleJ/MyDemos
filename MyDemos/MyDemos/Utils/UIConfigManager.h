//
//  UIConfigManager.h
//  SIAPP
//  主要通过设置基准和相关的换算统一为app提供统可以适配不同屏幕，机型的UI控件的宽和高和字体
//  Created by nie on 16/8/5.
//  Copyright © 2016年 localadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

// 根据UI1080P分辩率 ******************************

//适配宽和高
#define UIConfigManagerScale(woh)                   [[UIConfigManager shareInstance] px1:woh]
//适配字体大小
#define UIConfigManagerFontSize(pixel)              [[UIConfigManager shareInstance] pt1:pixel]

// 根据UI750P分辨率 ********************************

//适配宽和高
#define ConfigManagerScale(woh)                     [[UIConfigManager shareInstance] px:woh]
//适配字体大小
#define ConfigManagerFontSize(pixel)                [[UIConfigManager shareInstance] pt:pixel]


// 根据UI375P分辨率 ********************************

//适配宽和高
#define CMScale(woh)                                [[UIConfigManager shareInstance] px375:woh]
//适配字体大小
#define CMFontSize(pixel)                           [[UIConfigManager shareInstance] pt375:pixel]


@interface UIConfigManager : NSObject

/**
 *  初始化单实例
 *
 *  @return 单例对象
 */
+ (id)shareInstance;

/**
 *  根据UI设计图稿上的宽和高获得显示在屏幕上的宽和高                   (750p)
 *
 *  @param pixel UI设计图稿上的像素值
 *
 *  @return 获取计算后获得的iOS设备上使用的像素大小
 */
- (CGFloat) px:(CGFloat)pixel;

/**
 *  根据UI设计图稿上的字体的像素大小获得显示在屏幕上的字体大小           (750p)
 *
 *  @param pixel UI设计图稿上的像素值
 *
 *  @return 显示在设备上显示的字体大小
 */
- (CGFloat) pt:(CGFloat)pixel;

/**
 *  根据UI设计图稿上的宽和高获得显示在屏幕上的宽和高                   (1080p)
 *
 *  @param pixel UI设计图稿上的像素值
 *
 *  @return 获取计算后获得的iOS设备上使用的像素大小
 */
- (CGFloat) px1:(CGFloat)pixel;

/**
 *  根据UI设计图稿上的字体的像素大小获得显示在屏幕上的字体大小           (1080p)
 *
 *  @param pixel UI设计图稿上的像素值
 *
 *  @return 显示在设备上显示的字体大小
 */
- (CGFloat) pt1:(CGFloat)pixel;


/**
 *  根据UI设计图稿上的宽和高获得显示在屏幕上的宽和高                   (1080p)
 *
 *  @param pixel UI设计图稿上的像素值
 *
 *  @return 获取计算后获得的iOS设备上使用的像素大小
 */
- (CGFloat) px375:(CGFloat)pixel;

/**
 *  根据UI设计图稿上的字体的像素大小获得显示在屏幕上的字体大小           (1080p)
 *
 *  @param pixel UI设计图稿上的像素值
 *
 *  @return 显示在设备上显示的字体大小
 */
- (CGFloat) pt375:(CGFloat)pixel;

@end
