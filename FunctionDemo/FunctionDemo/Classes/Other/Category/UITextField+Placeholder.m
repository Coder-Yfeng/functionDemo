//
//  UITextField+Placeholder.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/31.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)
// 设置占位文字颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (self.placeholder.length == 0) {
        self.placeholder = @" ";
    }
    
    UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    placeholderLabel.textColor = placeholderColor;
}

- (UIColor *)placeholderColor
{
    UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    
    return placeholderLabel.textColor;
}
@end
