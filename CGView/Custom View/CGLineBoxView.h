//
//  CGLineBoxView.h
//  Test_ProjectMode
//
//  Created by ym on 15/7/2.
//  Copyright (c) 2015年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  线框视图
 */
@interface CGLineBoxView : UIView

/**
 *  线框需要设置的周边
 */
@property (assign, nonatomic) UIRectCorner rectCorner;

/**
 *  圆角
 */
@property (assign, nonatomic) CGSize cornerRadii;

/**
 *  绘制的线的颜色
 */
@property (strong, nonatomic) UIColor *lineColor;

/**
 *  线的宽度
 */
@property (assign, nonatomic) CGFloat lineWidth;

/**
 *  是否使用绘制
 */
@property (assign, nonatomic) BOOL isDrawLine;

/**
 *  使用图片显示线框
 */
@property (strong, nonatomic) UIImage *lineHorizontalImage;
@property (strong, nonatomic) UIImage *lineVerticalImage;
@end
