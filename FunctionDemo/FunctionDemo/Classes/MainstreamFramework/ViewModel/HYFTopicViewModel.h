//
//  HYFTopicViewModel.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/21.
//  Copyright © 2016年 youfenghe. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HYFTopicItem;
@interface HYFTopicViewModel : NSObject

@property (nonatomic, strong) HYFTopicItem *item;

@property (nonatomic, assign) CGRect topViewFrame;
@property (nonatomic, assign) CGRect middleViewFrame;
@property (nonatomic, assign) CGFloat cellH;
@property (nonatomic, assign) CGRect commentViewFrame;
@property (nonatomic, assign) CGRect bottomViewFrame;

@end
