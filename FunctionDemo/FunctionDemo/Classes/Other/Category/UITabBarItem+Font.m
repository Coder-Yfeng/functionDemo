//
//  UITabBarItem+Font.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/16.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "UITabBarItem+Font.h"

@implementation UITabBarItem (Font)
- (void)setupTabBarButtonFont:(UIFont *)font
{
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = font;
    [self setTitleTextAttributes:attr forState:UIControlStateNormal];
}
@end
