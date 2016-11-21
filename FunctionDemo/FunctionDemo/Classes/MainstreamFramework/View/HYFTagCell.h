//
//  HYFTagCell.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/20.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <UIKit/UIKit.h>
@class HYFSubTagItem;
@interface HYFTagCell : UITableViewCell

@property (nonatomic, strong) HYFSubTagItem *item;

+ (instancetype)cell;

@end
