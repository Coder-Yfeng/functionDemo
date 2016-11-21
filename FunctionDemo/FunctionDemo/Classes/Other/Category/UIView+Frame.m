//
//  UIView+Frame.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/17.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (CGFloat)hyf_centerX
{
    return self.center.x;
}
- (void)setHyf_centerX:(CGFloat)hyf_centerX
{
    CGPoint center = self.center;
    center.x = hyf_centerX;
    self.center = center;
}

- (CGFloat)hyf_centerY
{
    return self.center.y;
}

- (void)setHyf_centerY:(CGFloat)hyf_centerY
{
    CGPoint center = self.center;
    center.y = hyf_centerY;
    self.center = center;
}


- (CGFloat)hyf_x
{
    return self.frame.origin.x;
}

- (void)setHyf_x:(CGFloat)hyp_x
{
    CGRect frame = self.frame;
    frame.origin.x = hyp_x;
    self.frame = frame;
}

- (CGFloat)hyf_y
{
    return self.frame.origin.y;
}
- (void)setHyf_y:(CGFloat)hyp_y
{
    CGRect frame = self.frame;
    frame.origin.y = hyp_y;
    self.frame = frame;
}

- (CGFloat)hyf_width
{
    return self.frame.size.width;
    
}

- (void)setHyf_width:(CGFloat)hyp_width
{
    CGRect frame = self.frame;
    frame.size.width = hyp_width;
    self.frame = frame;
}
- (CGFloat)hyf_height
{
    return self.frame.size.height;
}
- (void)setHyf_height:(CGFloat)hyp_height
{
    CGRect frame = self.frame;
    frame.size.height = hyp_height;
    self.frame = frame;
}
@end
