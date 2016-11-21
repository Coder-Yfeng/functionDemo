//
//  HYFTopTopicView.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/25.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <UIKit/UIKit.h>
@class HYFTopicItem;
@interface HYFTopTopicView : UIView
@property (nonatomic, strong) HYFTopicItem *item;
+(instancetype)viewForXib;

@end
