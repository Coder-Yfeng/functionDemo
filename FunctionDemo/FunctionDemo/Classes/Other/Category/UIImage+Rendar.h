//
//  UIImage+Rendar.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/16.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <UIKit/UIKit.h>

@interface UIImage (Rendar)

// 加载一个不要被渲染的图片
+(UIImage *)imageNamedWithOriginal:(NSString *)name;
@end
