//
//  CGAliquots.h
//  Test_ProjectMode
//
//  Created by ym on 15/7/2.
//  Copyright (c) 2015年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  均等分的类型
 */
typedef NS_ENUM(NSInteger, CGAliquotsType){
    /**
     *  横向
     */
    CGAliquotsTypeHorizontalAlign,
    /**
     *  纵向
     */
    CGAliquotsTypeVerticalAlign
};
/**
 *  等分视图
 */
@interface CGAliquotsView : UIView

/**
 *  内部子视图的约束集合
 */
@property (strong, nonatomic, readonly) NSArray *constraintsForSubviewAdd;

/**
 *  内部视图之间的间距
 */
@property (assign, nonatomic) CGFloat subviewSpace;

/**
 *  视图与视图外围之间的间距
 */
@property (assign, nonatomic) UIEdgeInsets edgeInsets;

/**
 *  设置对齐的类型，默认为横向
 */
@property (assign, nonatomic) CGAliquotsType alignType;
@end
