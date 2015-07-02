//
//  UIView+AreaCoordinatesProcess.h
//  Test_ProjectMode
//
//  Created by ym on 15/7/2.
//  Copyright (c) 2015年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  视图内部坐标的变换处理
 */
@interface UIView (AreaCoordinatesProcess)

/**
 *  偏移父视图center的坐标值
 */
@property (nonatomic, readwrite) CGPoint offsetSuperCenterPoint;

@end
