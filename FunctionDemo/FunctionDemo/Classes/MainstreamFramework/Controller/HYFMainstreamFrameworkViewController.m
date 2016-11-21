//
//  HYFMainstreamFrameworkViewController.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/17.
//  Copyright © 2016年 youfenghe. All rights reserved.
//

#import "HYFMainstreamFrameworkViewController.h"
#import "HYFBaseTopicViewController.h"
#import "UIBarButtonItem+Item.h"

@interface HYFMainstreamFrameworkViewController ()

@end

@implementation HYFMainstreamFrameworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    
    // 添加所有的子控制器
    [self setupAllChildViewController];
    
}

-(void)setupNavBar{
    // 添加导航控制器标题
    self.navigationItem.title = @"主流";
    
}

-(void)gameClick{
    
    NSLog(@"点击了游戏按钮");
}


-(void)setupAllChildViewController{
    
    // 全部
    HYFBaseTopicViewController *allVC = [[HYFBaseTopicViewController alloc] init];
    allVC.title = @"全部";
    [self addChildViewController:allVC];
    
    // 视频
    HYFBaseTopicViewController *videoVC = [[HYFBaseTopicViewController alloc] init];
    videoVC.title = @"视频";
    [self addChildViewController:videoVC];
    
    // 声音
    HYFBaseTopicViewController *voiceVC = [[HYFBaseTopicViewController alloc] init];
    voiceVC.title = @"声音";
    [self addChildViewController:voiceVC];
    
    // 图片
    HYFBaseTopicViewController *pictureVC = [[HYFBaseTopicViewController alloc] init];
    pictureVC.title = @"图片";
    [self addChildViewController:pictureVC];
    
    // 段子
    HYFBaseTopicViewController *textVC = [[HYFBaseTopicViewController alloc] init];
    textVC.title = @"段子";
    [self addChildViewController:textVC];
    
}




























@end
