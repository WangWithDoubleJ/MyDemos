//
//  MaiDianDataModel.h
//  MyDemos
//
//  Created by 平安科技 on 2017/6/27.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MaiDianDataModel : NSObject
@property (nonatomic, copy) NSString *co;///<cq 操作时间
@property (nonatomic, copy) NSString *sa;///<sa userID
@property (nonatomic, copy) NSString *userName;///<用户姓名
@property (nonatomic, copy) NSString *grabOrderState; ///订单状态
@end
