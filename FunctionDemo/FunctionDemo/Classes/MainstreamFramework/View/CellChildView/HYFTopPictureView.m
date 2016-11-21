//
//  HYFTopPictureView.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/25.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFTopPictureView.h"
#import "HYFTopicItem.h"
#import "HYFBigPictureViewController.h"
#import <MJExtension/MJExtension.h>
#import <DALabeledCircularProgressView.h>
@interface HYFTopPictureView ()

@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@end

@implementation HYFTopPictureView

-(void)awakeFromNib{

    [super awakeFromNib];
    _progressView.progressTintColor = [UIColor grayColor];
    _progressView.trackTintColor = [UIColor lightGrayColor];
    _progressView.roundedCorners = 5;
    _progressView.progressLabel.textColor = [UIColor lightGrayColor];
    self.autoresizingMask = UIViewAutoresizingNone;
    
}

-(void)setItem:(HYFTopicItem *)item{
    
    [super setItem:item];
    
    // 添加进度条
    _progressView.progress = 0;
    _progressView.progressLabel.text = @"0%";
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:item.image0]placeholderImage:[UIImage imageNamed:@"imageBackground"] options:nil progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        if (expectedSize == -1) return ;
        CGFloat progress = 1.0 *receivedSize / expectedSize;
        NSString *str = [NSString stringWithFormat:@"%.0f%%",progress * 100];
        dispatch_async(dispatch_get_main_queue(), ^{
            _progressView.progressLabel.text = str;
            _progressView.progress = progress;

        });
        
    } completed:nil ];
    _gifView.hidden = !item.is_gif;
    
    // 处理大图
    _seeBigButton.hidden = !item.is_bigPicture;
    if (item.is_bigPicture) {
        // 设置图片显示的大小
        _pictureView.contentMode = UIViewContentModeTop;
        _pictureView.clipsToBounds = YES;
    }else{
        _pictureView.contentMode = UIViewContentModeScaleToFill;
        _pictureView.clipsToBounds = NO;
        
    }
}

// 点击显示原图;
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    HYFBigPictureViewController *bigPictureVC = [[HYFBigPictureViewController alloc] init];
    bigPictureVC.item = self.item;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:bigPictureVC animated:YES completion:nil] ;
}


@end
