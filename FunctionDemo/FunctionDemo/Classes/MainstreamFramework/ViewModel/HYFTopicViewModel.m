//
//  HYFTopicViewModel.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/21.
//  Copyright © 2016年 youfenghe. All rights reserved.
//

#import "HYFTopicViewModel.h"
#import "HYFTopicItem.h"
#import "HYFCommentView.h"
#import "HYFBottomView.h"
@implementation HYFTopicViewModel

- (void)setItem:(HYFTopicItem *)item
{
    _item = item;
    
    // 计算TopView
    CGFloat topX = 0;
    CGFloat topY = 0;
    CGFloat topW = HYFScreenW;
    CGFloat margin = 10;
    CGFloat textY = 55;
    CGFloat textW = HYFScreenW - 2 * margin;
    CGFloat textH = [item.text sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(textW, MAXFLOAT)].height;
    CGFloat topH = textY + textH;
    
    _topViewFrame = CGRectMake(topX, topY, topW, topH);
    
    _cellH = CGRectGetMaxY(_topViewFrame) + margin;
    _topViewFrame = CGRectMake(topX, topY, topW, topH);
    _cellH = CGRectGetMaxY(_topViewFrame) + margin;
    
    // 计算中间View
    if (item.type != HYFTopicItemTypeText) {
        CGFloat middleX = margin;
        CGFloat middleY = _cellH;
        CGFloat middleW = textW;
        CGFloat middleH = textW / item.width * item.height;
        if (middleH > HYFScreenW) {
            middleH = 300;
            item.is_bigPicture = YES;
        }
        _middleViewFrame = CGRectMake(middleX, middleY, middleW, middleH);
        _cellH = CGRectGetMaxY(_middleViewFrame) + margin;
    }
    
    // 最热评论View
    if (item.topComment) {
        CGFloat commentX = margin;
        CGFloat commentY = _cellH;
        CGFloat commentW = HYFScreenW;
        CGFloat commentH = 43;
        if (item.topComment.content.length) {
            CGFloat textH = [item.topComment.totalContent sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(textW, MAXFLOAT)].height;
            commentH = 21 + textH;
        }
        _commentViewFrame = CGRectMake(commentX, commentY, commentW, commentH);
        _cellH = CGRectGetMaxY(_commentViewFrame) + margin;
    }
    
    // 底部View
    CGFloat bottomX = 0;
    CGFloat bottomY = _cellH;
    CGFloat bottomW = HYFScreenW;
    CGFloat bottomH = 35;
    _bottomViewFrame = CGRectMake(bottomX, bottomY, bottomW, bottomH);
    _cellH = CGRectGetMaxY(_bottomViewFrame);
    
    
}

@end
