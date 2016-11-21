//
//  HYFCommentItem.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/26.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFCommentItem.h"
#import "HYFUserItem.h"

@implementation HYFCommentItem
-(NSString *)totalContent{

    return [NSString stringWithFormat:@"%@:%@", self.user.username, self.content];
}

@end
