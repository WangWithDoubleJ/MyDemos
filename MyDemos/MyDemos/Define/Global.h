//
//  Global.h
//  MyDemos
//
//  Created by 平安科技 on 2017/6/26.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#ifndef Global_h
#define Global_h

//屏幕尺寸
#define kLWScreenW [UIScreen mainScreen].bounds.size.width
#define kLWScreenH [UIScreen mainScreen].bounds.size.height

#define ColorFromRGB(rgbValue)      [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define ColorWithRGBA(r,g,b,a)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//常用颜色值
#define Color4b89dc                 ColorFromRGB(0x4b89dc)
#define Color333333                 ColorFromRGB(0x333333)
#define Color353535                 ColorFromRGB(0x353535)
#define Color959595                 ColorFromRGB(0x959595)
#define Coloraeaeae                 ColorFromRGB(0xaeaeae)
#define Colorff662a                 ColorFromRGB(0xff662a)
#define Color90949e                 ColorFromRGB(0x90949e)
#define Color3c6bf0                 ColorFromRGB(0x3c6bf0)



#endif /* Global_h */
