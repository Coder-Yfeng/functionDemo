//
//  HYFNavigationBar.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/17.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFNavigationBar.h"
#import "HYFBackView.h"
@implementation HYFNavigationBar

-(void)layoutSubviews{
    
    [super layoutSubviews];
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:[HYFBackView class]]) {
            v.hyf_x = 0;
        }
    }
}
@end
