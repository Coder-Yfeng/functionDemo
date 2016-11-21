//
//  HYFBackView.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/17.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFBackView.h"

@implementation HYFBackView
+ (instancetype)backViewWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    HYFBackView *view = [[HYFBackView alloc] initWithFrame:backButton.bounds];
    [view addSubview:backButton];
    return view ;
}

@end
