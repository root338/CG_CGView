//
//  ScoreView.m
//  Test_ProjectMode
//
//  Created by ym on 15/7/2.
//  Copyright (c) 2015年 ym. All rights reserved.
//

#import "CGScoreView.h"
#import "Masonry.h"

@interface CGScoreView ()
{
    NSInteger subviewTotalCount;
    
#ifdef DEBUG
    UIColor *redColor;
    UIColor *greenColor;
#endif
}

@end

@implementation CGScoreView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)createScoreViewWithDefalutImage:(UIImage *)image selecteImage:(UIImage *)selectImage totalCount:(NSInteger)totalCount didScoreCallback:(void (^)(NSInteger))didScoreCallback
{
    CGScoreView *scoreView = [[CGScoreView alloc] initWithDefalutImage:image selecteImage:selectImage totalCount:totalCount didScoreCallback:didScoreCallback];
    return scoreView;
}

- (instancetype)initWithDefalutImage:(UIImage *)image selecteImage:(UIImage *)selectImage totalCount:(NSInteger)totalCount didScoreCallback:(void (^)(NSInteger))didScoreCallback
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _scoreImage = image;
        _selectScoreImage = selectImage;
        _totalScoreNumber = totalCount;
        self.didScoreCallback = didScoreCallback;
        
#ifdef DEBUG
        
        redColor = [UIColor redColor];
        greenColor = [UIColor greenColor];
#endif
        
        [self performSelector:@selector(updateContentView) withObject:nil afterDelay:0];
    }
    return self;
}

- (void)updateContentView
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(updateContentView) object:nil];
    
    for (NSInteger i = 0; i < self.totalScoreNumber; i++) {
        
        UIButton *button = nil;
        //检查是否存在相应的图像视图
        if ([self viewWithTag:i + 1]) {
            
            button = (id)[self viewWithTag:i + 1];
        }else {
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self addSubview:button];
            
            [button addTarget:self action:@selector(handleScoreAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        button.tag = i + 1;
        
        [self selectView:button index:i];
    }
    
    //删除多余的图像视图
    CGFloat offsetCount = self.subviews.count - self.totalScoreNumber;
    if (offsetCount > 0) {
        
        NSArray *subArr = [self.subviews subarrayWithRange:NSMakeRange(self.totalScoreNumber, offsetCount)];
        [subArr enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
            [obj removeFromSuperview];
        }];
    }
    
    //判断当前的子视图数有没有变化，当发生变化时删除子视图的约束
    if (subviewTotalCount != self.subviews.count && !self.constraintsForSubviewAdd.count) {
        
        [self removeConstraints:self.constraintsForSubviewAdd];
    }else {
        
        subviewTotalCount = self.subviews.count;
    }
    
    [self setNeedsUpdateConstraints];
}

//更新评分图片
- (void)updateContentViewImages
{
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [self selectView:obj index:idx];
    }];
}

- (void)selectView:(UIButton *)button index:(NSInteger)index
{
    NSAssert([button isKindOfClass:[UIButton class]], @"非按钮视图");
    
#ifdef DEBUG
    
    if (index < self.selectScoreNumber) {
        [button setBackgroundColor:redColor];
    }else {
        [button setBackgroundColor:greenColor];
    }
#endif
    
    [button setImage:index < self.selectScoreNumber ? self.selectScoreImage : self.scoreImage forState:UIControlStateNormal];
}

#pragma mark 事件处理
- (void)handleScoreAction:(UIButton *)sender
{
    self.selectScoreNumber = sender.tag;
    [self updateContentViewImages];
    
    if (self.didScoreCallback) {
        self.didScoreCallback(self.selectScoreNumber);
    }
}

#pragma mark 设置属性
- (void)setScoreImage:(UIImage *)scoreImage
{
    _scoreImage = scoreImage;
    [self updateContentViewImages];
}

- (void)setSelectScoreImage:(UIImage *)selectScoreImage
{
    _selectScoreImage = selectScoreImage;
    [self updateContentViewImages];
}

- (void)setSelectScoreNumber:(NSInteger)defalutScoreNumber
{
    _selectScoreNumber = defalutScoreNumber;
    [self updateContentView];
}

- (void)setTotalScoreNumber:(NSInteger)totalScoreNumber
{
    _totalScoreNumber = totalScoreNumber;
    [self updateContentView];
}
@end