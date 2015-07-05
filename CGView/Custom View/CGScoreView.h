//
//  ScoreView.h
//  Test_ProjectMode
//
//  Created by ym on 15/7/2.
//  Copyright (c) 2015年 ym. All rights reserved.
//

#import "CGAliquotsView.h"

/**
 *  设置评分内部视图的类型
 */
typedef NS_ENUM(NSInteger, ScoreSubviewType){
    /**
     *  按钮视图
     */
    ScoreSubviewTypeButton,
    /**
     *  图像视图
     */
    ScoreSubviewTypeImageView,
};

/**
 *  评分视图
 */
@interface CGScoreView : CGAliquotsView

/**
 *  默认的图片
 */
@property (strong, nonatomic) UIImage *scoreImage;

/**
 *  选择的图片
 */
@property (strong, nonatomic) UIImage *selectScoreImage;

/**
 *  所评价的序号
 */
@property (assign, nonatomic) NSInteger selectScoreNumber;

/**
 *  总分序号
 */
@property (assign, nonatomic) NSInteger totalScoreNumber;

/**
 *  评分后的回调
 */
@property (copy, nonatomic) void(^didScoreCallback)(NSInteger scoreNumber);

/**
 *  初始化一个评分视图
 *
 *  @param image            默认图片
 *  @param selecteImage     选择之后的图片
 *  @param totalCount       总星数
 *  @param didScoreCallback 评分后的回调
 *
 *  @return 返回创建的评分视图
 */
- (instancetype)initWithDefalutImage:(UIImage *)image selecteImage:(UIImage *)selectImage totalCount:(NSInteger)totalCount didScoreCallback:(void (^)(NSInteger scoreNumber))didScoreCallback;

/**
 *  创建一个评分视图
 *
 *  @param image            默认图片
 *  @param selecteImage     选择之后的图片
 *  @param totalCount       总星数
 *  @param didScoreCallback 评分后的回调
 *
 *  @return 返回创建的评分视图
 */
+ (instancetype)createScoreViewWithDefalutImage:(UIImage *)image selecteImage:(UIImage *)selectImage totalCount:(NSInteger)totalCount didScoreCallback:(void (^)(NSInteger scoreNumber))didScoreCallback;
@end