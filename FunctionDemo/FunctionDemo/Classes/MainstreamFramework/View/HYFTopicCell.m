//
//  HYFTopicCell.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/25.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFTopicCell.h"
#import "HYFTopTopicView.h"
#import "HYFTopicItem.h"
#import "HYFTopicViewModel.h"
#import "HYFTopPictureView.h"
#import "HYFVideoTopicView.h"
#import "HYFVoiceTopicView.h"
#import "HYFCommentView.h"
#import "HYFCommentItem.h"
#import "HYFBottomView.h"
@interface HYFTopicCell ()

@property (nonatomic,weak) HYFTopTopicView *topView;
@property (nonatomic,weak) HYFTopPictureView *pictureView;
@property (nonatomic, weak) HYFVideoTopicView *videoView;
@property (nonatomic, weak) HYFVoiceTopicView *voiceView;
@property (nonatomic, weak) HYFCommentView *commentView;;
@property (nonatomic, weak) HYFBottomView *bottomView;;



@end
@implementation HYFTopicCell

// 设置cell之间间距
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 5;
    frame.size.height -= 5;
    [super setFrame:frame];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 设置顶部view内容
        HYFTopTopicView *topView = [HYFTopTopicView viewForXib];
        [self.contentView addSubview:topView];
        _topView = topView;
        
        // 中间view
        // 图片
        HYFTopPictureView *pictureView = [HYFTopPictureView viewForXib];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
        
        // 视频
        HYFVideoTopicView *videoView = [HYFVideoTopicView viewForXib];
        [self.contentView addSubview:videoView];
        _videoView = videoView;
        
        // 声音
        HYFVoiceTopicView *voiceView = [HYFVoiceTopicView viewForXib];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
        
        // 最热评论
        HYFCommentView *commentView = [HYFCommentView viewForXib];
        [self.contentView addSubview:commentView];
        _commentView = commentView;
        
        // 底部View
        HYFBottomView *bottomView = [HYFBottomView viewForXib];
        [self.contentView addSubview:bottomView];
        _bottomView = bottomView;
    }
    return self;
}

-(void)setVm:(HYFTopicViewModel *)vm{
    
    _vm = vm;
    _topView.item = vm.item;
    _topView.frame = vm.topViewFrame;
    // 中间View
    if (vm.item.type == HYFTopicItemTypePicture) {
        // 图片
        _pictureView.item = vm.item;
        _pictureView.frame = vm.middleViewFrame;
        
        _videoView.hidden = YES;
        _voiceView.hidden = YES;
        _pictureView.hidden = NO;
        
    } else if (vm.item.type == HYFTopicItemTypeVideo) {
        // 视频
        _videoView.item = vm.item;
        _videoView.frame = vm.middleViewFrame;
        _videoView.hidden = NO;
        _pictureView.hidden = YES;
        _voiceView.hidden = YES;
        
    } else if (vm.item.type == HYFTopicItemTypeVocie) {
        // 声音
        _voiceView.item = vm.item;
        _voiceView.frame = vm.middleViewFrame;
        _videoView.hidden = YES;
        _pictureView.hidden = YES;
        _voiceView.hidden = NO;
    } else {
        // 段子
        _videoView.hidden = YES;
        _pictureView.hidden = YES;
        _voiceView.hidden = YES;
    }
    
    // 最热评论
    if (vm.item.topComment) {
        _commentView.hidden = NO;
        _commentView.item = vm.item;
        _commentView.frame = vm.commentViewFrame;
    }else{
        _commentView.hidden = YES;
    }
    
    // 底部
    _bottomView.item = vm.item;
    _bottomView.frame = vm.bottomViewFrame;
    
    
}

@end
