//
//  HYFBackView.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/17.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <UIKit/UIKit.h>

@interface HYFBackView : UIView
+ (instancetype)backViewWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;
@end
