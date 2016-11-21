//
//  UIImage+Rendar.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/16.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "UIImage+Rendar.h"

@implementation UIImage (Rendar)
+(UIImage *)imageNamedWithOriginal:(NSString *)name{
    
    UIImage *selImage = [UIImage imageNamed:name];
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return selImage;
}

@end
