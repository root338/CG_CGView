//
//  CGAliquots.m
//  Test_ProjectMode
//
//  Created by ym on 15/7/2.
//  Copyright (c) 2015年 ym. All rights reserved.
//

#import "CGAliquotsView.h"
#import "Masonry.h"

@interface CGAliquotsView ()
{
    NSMutableArray *_constraintsForSubviewAdd;
}

@end

@implementation CGAliquotsView

- (void)updateConstraints
{
    if (self.subviews.count) {
        if (!_constraintsForSubviewAdd) {
            _constraintsForSubviewAdd = [NSMutableArray new];
        }else {
            [_constraintsForSubviewAdd removeAllObjects];
        }
        if (self.subviews.count == 1) {
            
            //当只有一个视图时只与父视图建立约束
            [_constraintsForSubviewAdd addObjectsFromArray:[self.subviews[0] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self).with.insets(self.edgeInsets);
            }]];
        }else {
            
            NSInteger maxIndex = self.subviews.count - 1;
            [self.subviews enumerateObjectsUsingBlock:^(UIView * obj, NSUInteger idx, BOOL *stop) {
                if (idx == 0) {
                    
                    //获取除第一个视图外的其他子视图
                    NSMutableArray *array = [NSMutableArray arrayWithArray:self.subviews];
                    [array removeObjectAtIndex:0];
                    
                    [_constraintsForSubviewAdd addObjectsFromArray:[obj mas_makeConstraints:^(MASConstraintMaker *make) {
                        
                        //不管横向还是纵向都通用的约束
                        make.top.equalTo(self.mas_top).with.offset(self.edgeInsets.top);
                        make.leading.equalTo(self.mas_leading).with.offset(self.edgeInsets.left);
                        
                        if (self.alignType == CGAliquotsTypeHorizontalAlign) {
                            //横向约束设置
                            
                            //设置第一个视图与父视图的约束关系
                            make.bottom.equalTo(self.mas_bottom).with.offset(-self.edgeInsets.bottom);
                            
                            //设置第一个视图于其他子视图 等宽，等高
                            make.top.equalTo(array);
                            make.bottom.equalTo(array);
                            make.width.equalTo(array);
                            
                            //设置与下一个视图之间的间距
                            UIView *nextView = self.subviews[idx + 1];
                            make.trailing.equalTo(nextView.mas_leading).with.offset(-self.subviewSpace);
                        }else {
                            //纵向约束设置
                            
                            //设置第一个视图与父视图的约束关系
                            make.trailing.equalTo(self.mas_trailing).with.offset(self.edgeInsets.right);
                            
                            //设置第一个视图与其他子视图的约束关系
                            make.leading.equalTo(array);
                            make.trailing.equalTo(array);
                            make.height.equalTo(array);
                            
                            //设置与下一个视图之间的间距
                            UIView *nextView = self.subviews[idx + 1];
                            make.bottom.equalTo(nextView.mas_top).with.offset(-self.subviewSpace);
                        }
                        
                    }]];
                }else if (idx == maxIndex) {
                    
                    
                    //设置最后一个视图与父视图的约束关系
                    [_constraintsForSubviewAdd addObjectsFromArray:[obj mas_makeConstraints:^(MASConstraintMaker *make) {
                        
                        if (self.alignType == CGAliquotsTypeHorizontalAlign) {
                            make.trailing.equalTo(self.mas_trailing);
                        }else {
                            make.bottom.equalTo(self.mas_bottom);
                        }
                    }]];
                }else {
                    
                    //设置中间视图与下一个视图之间的间距
                    [_constraintsForSubviewAdd addObjectsFromArray:[obj mas_makeConstraints:^(MASConstraintMaker *make) {
                        
                        UIView *nextView = self.subviews[idx + 1];
                        if (self.alignType == CGAliquotsTypeHorizontalAlign) {
                            make.trailing.equalTo(nextView.mas_leading).with.offset(-self.subviewSpace);
                        }else {
                            make.bottom.equalTo(nextView.mas_top).with.offset(-self.subviewSpace);
                        }
                        
                    }]];
                }
            }];
        }
    }
    
    [super updateConstraints];
}

#pragma mark 属性设置
- (void)setSubviewSpace:(CGFloat)subviewSpace
{
    _subviewSpace = subviewSpace;
    
    [self setNeedsUpdateConstraints];
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets
{
    _edgeInsets = edgeInsets;
    
    [self setNeedsUpdateConstraints];
}

- (NSArray *)constraintsForSubviewAdd
{
    return _constraintsForSubviewAdd;
}

- (void)setAlignType:(CGAliquotsType)alignType
{
    _alignType = alignType;
    
    [self setNeedsUpdateConstraints];
}

@end
