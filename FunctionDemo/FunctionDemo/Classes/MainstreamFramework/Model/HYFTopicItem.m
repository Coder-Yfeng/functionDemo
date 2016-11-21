//
//  HYFTopicItem.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/25.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFTopicItem.h"
#import <MJExtension/MJExtension.h>
#import "HYFCommentItem.h"
@implementation HYFTopicItem

+(NSDictionary *)mj_objectClassInArray{

    return @{@"top_cmt":@"HYFCommentItem"};
}

-(void)setTop_cmt:(NSArray *)top_cmt{

    _top_cmt = top_cmt;
    if (_top_cmt.count) {
        _top_cmt = top_cmt.firstObject;
    }
    
}

@end
