//
//  HYFBaseTopicViewController.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/31.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <UIKit/UIKit.h>
#import "HYFTopicItem.h"
@interface HYFBaseTopicViewController : UITableViewController
@property (nonatomic, assign) NSNumber *type;
- (void)reload;
@end
