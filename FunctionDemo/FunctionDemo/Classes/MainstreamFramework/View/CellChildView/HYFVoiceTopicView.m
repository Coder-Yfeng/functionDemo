//
//  HYFVoiceTopicView.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/26.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFVoiceTopicView.h"
#import "HYFTopicItem.h"
#import <UIImageView+WebCache.h>

@interface HYFVoiceTopicView ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end

@implementation HYFVoiceTopicView
-(void)setItem:(HYFTopicItem *)item{
    
    [super setItem:item];
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:item.image0]];

    self.playCountLable.text = [NSString stringWithFormat:@"%@播放",item.playcount];
    
    NSInteger second = item.voicetime % 60;
    NSInteger minute = item.voicetime / 60;
    
    self.timeLable.text = [NSString stringWithFormat:@"%02ld:%02ld",minute,second];

}


@end
