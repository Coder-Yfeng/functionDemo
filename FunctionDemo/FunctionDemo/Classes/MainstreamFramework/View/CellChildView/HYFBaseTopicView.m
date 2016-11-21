//
//  HYFBaseTopicView.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/25.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFBaseTopicView.h"

@implementation HYFBaseTopicView

+ (instancetype)viewForXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}

@end
