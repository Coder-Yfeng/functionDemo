//
//  HYFCommentView.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/26.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFCommentView.h"
#import <UIImageView+WebCache.h>
#import "HYFCommentItem.h"
#import "HYFUserItem.h"
#import "HYFTopicItem.h"

@interface HYFCommentView ()

@property (weak, nonatomic) IBOutlet UILabel *totalLable;
@property (weak, nonatomic) IBOutlet UIView *voiceView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;

@end
@implementation HYFCommentView

-(void)awakeFromNib{

    [super awakeFromNib];
    
    // 取消自动拉伸
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setItem:(HYFTopicItem *)item{

    [super setItem:item];
    
    if (item.topComment.content.length) {
        // 显示文字
        self.voiceView.hidden = YES;
        self.totalLable.hidden = NO;
        self.totalLable.text = item.topComment.totalContent;
        
    }else{
        // 显示声音
        self.voiceView.hidden = NO;
        self.totalLable.hidden = YES;
        self.nameLabel.text = item.topComment.user.username;
        [self.voiceButton setTitle:item.topComment.voicetime forState:UIControlStateNormal];
    
        
    }
    
}


@end
