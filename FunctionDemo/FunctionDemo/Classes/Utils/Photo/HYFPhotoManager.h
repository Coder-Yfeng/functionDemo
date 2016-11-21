//
//  HYFPhotoManager.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/31.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <Foundation/Foundation.h>
/**
 *  处理图片保存
 */
@interface HYFPhotoManager : NSObject
/**
 *  图片保存
 *
 *  @param image             需要保存的图片
 *  @param albumTitle        自定义的相册名字
 *  @param completionHandler 保存后用户需要做什么
 */
+ (void)savePhoto:(UIImage *)image albumTitle:(NSString *)albumTitle completionHandler:(void(^)(BOOL success, NSError * error))completionHandler;
@end
