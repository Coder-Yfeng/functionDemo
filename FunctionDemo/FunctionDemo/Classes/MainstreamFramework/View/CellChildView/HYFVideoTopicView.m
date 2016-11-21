//
//  HYFVideoTopicView.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/26.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFVideoTopicView.h"
#import "HYFTopicItem.h"
#import <UIImageView+WebCache.h>
@interface HYFVideoTopicView ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end

@implementation HYFVideoTopicView

-(void)setItem:(HYFTopicItem *)item{
    
    [super setItem:item];
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    
    self.playCountLable.text = [NSString stringWithFormat:@"%@播放",item.playcount];
    
    NSInteger second = item.videotime % 60;
    NSInteger minute = item.videotime / 60;
    
    self.timeLable.text = [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
    
}

@end
