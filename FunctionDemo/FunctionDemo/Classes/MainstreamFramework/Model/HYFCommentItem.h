//
//  HYFCommentItem.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/26.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <Foundation/Foundation.h>
#import "HYFUserItem.h"
@class HYFUserItem;

@interface HYFCommentItem : NSObject

@property (nonatomic, strong) NSString *voiceuri;
@property (nonatomic, strong) NSString *voicetime;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) HYFUserItem *user;
@property (nonatomic, strong) NSString *totalContent;


@end
