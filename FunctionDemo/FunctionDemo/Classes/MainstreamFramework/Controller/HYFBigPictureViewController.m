//
//  HYFBigPictureViewController.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/27.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFBigPictureViewController.h"
#import "HYFTopicItem.h"
#import <UIImageView+WebCache.h>
#import <Photos/Photos.h>
#import <SVProgressHUD.h>
#import "HYFPhotoManager.h"
#define HYFAlbumTitle @"百思不得姐"
@interface HYFBigPictureViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UIImageView *imageView;
@end

@implementation HYFBigPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 显示大图
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat photoH = HYFScreenW / self.item.width * self.item.height;
    imageView.frame = CGRectMake(0, 0, HYFScreenW, photoH);
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.item.image0]];
    [_scrollView addSubview:imageView];
    _imageView = imageView;
    if (!_item.is_bigPicture) {
        imageView.center = CGPointMake(HYFScreenW * 0.5, HYFScreenH * 0.5);
    }else{
        
        self.scrollView.contentSize = CGSizeMake(0, photoH);
        if (photoH > HYFScreenH) {
            
            // 设置代理,进行缩放处理
            self.scrollView.delegate = self;
            self.scrollView.maximumZoomScale = 2.0;
        };
    }

}

// 显示大图


// 返回
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


// 点击保存图片
- (IBAction)savePhotoClick:(id)sender {
    
    // 获取授权状态
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        // 如果是不确定的时候, 那么提示用户授权
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                [HYFPhotoManager savePhoto:self.imageView.image albumTitle:HYFAlbumTitle completionHandler:^(BOOL success, NSError *error) {
                    // 成功或者失败的时候提示HUD
                    if (error) {
                        [SVProgressHUD showInfoWithStatus:@"保存失败"];
                    } else{
                        [SVProgressHUD showInfoWithStatus:@"保存成功"];
                    }
                }];
            }
        }];
    } else if (status == PHAuthorizationStatusAuthorized){
        [HYFPhotoManager savePhoto:self.imageView.image albumTitle:HYFAlbumTitle completionHandler:^(BOOL success, NSError *error) {
            // 成功或者失败的时候提示HUD
            if (error) {
                [SVProgressHUD showInfoWithStatus:@"保存失败"];
            } else{
                [SVProgressHUD showInfoWithStatus:@"保存成功"];
            }
        }];
    } else{
        // 没有授权,提示授权方式
        [SVProgressHUD showInfoWithStatus:@"进入设置界面->找到当前应用->打开允许访问相册开关"];
    }
}

#pragma mark - UIScrollViewDelegate
// 返回一个缩放后的view
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return _imageView;
}

@end
