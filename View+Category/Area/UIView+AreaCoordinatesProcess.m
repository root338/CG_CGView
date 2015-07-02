//
//  UIView+AreaCoordinatesProcess.m
//  Test_ProjectMode
//
//  Created by ym on 15/7/2.
//  Copyright (c) 2015年 ym. All rights reserved.
//

#import "UIView+AreaCoordinatesProcess.h"

@implementation UIView (AreaCoordinatesProcess)

@dynamic offsetSuperCenterPoint;

- (void)setOffsetSuperCenterPoint:(CGPoint)offsetSuperCenterPoint
{
    self.center = CGPointMake(self.superview.center.x - offsetSuperCenterPoint.x, self.superview.center.y - offsetSuperCenterPoint.y);
}

@end
