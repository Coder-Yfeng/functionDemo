//
//  HYFTabBarController.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/17.
//  Copyright © 2016年 youfenghe. All rights reserved.
//

#import "HYFTabBarController.h"
#import "HYFNavigationController.h"
#import "HYFMainstreamFrameworkViewController.h"
#import "HYFInstantMessagingViewController.h"
#import "HYFMapLocationViewController.h"
#import "HYFPublishViewController.h"

@interface HYFTabBarController ()

@property (nonatomic, weak) UIButton *publishBtn;


@end

@implementation HYFTabBarController

-(UIButton *)publishBtn {
    if (_publishBtn == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        _publishBtn = btn;
        [self.tabBar addSubview:btn];
    }
    return _publishBtn;
}

// 设置tabBleItem外观
+(void)load {
    [super load];
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *attrD = [NSMutableDictionary dictionary];
    attrD[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [item setTitleTextAttributes:attrD forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加publishBtn
    [self setupPublishBtn];
    self.tabBar.tintColor = [UIColor greenColor];
    // 添加所有子控制器
    [self addAllChildViewController];
    
}

/// 添加publishBtn
-(void)setupPublishBtn{
    CGFloat x = self.tabBar.bounds.size.width * 0.5;
    CGFloat y = self.tabBar.bounds.size.height * 0.5;
    self.publishBtn.center = CGPointMake(x, y);
    [self.publishBtn addTarget:self action:@selector(modalPublishVC) forControlEvents:UIControlEventTouchUpInside];
}

/// 弹出publish控制器
- (void)modalPublishVC {
    HYFPublishViewController *publishVC = [[HYFPublishViewController alloc] init];
    [self presentViewController:publishVC animated:YES completion:nil];

}






/// 添加所有自控制器
-(void)addAllChildViewController {
    
    [self setupChildVC:[[HYFMainstreamFrameworkViewController alloc] init] title:@"主流" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupChildVC:[[HYFMapLocationViewController alloc] init] title:@"导航" image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL"];
    [self setupChildVC:[[UIViewController alloc] init] title:@"" image:@"" selectedImage:@""];
    UIViewController *vc = self.childViewControllers[2];
    vc.tabBarItem.enabled = NO;
    [self setupChildVC:[[HYFInstantMessagingViewController alloc] init] title:@"通讯" image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
    [self setupChildVC:[[HYFInstantMessagingViewController alloc] init] title:@"通讯" image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
    
}

/**
 添加控制器

 @param vc 控制器
 @param title 标题
 @param image 图片
 @param selectedImage 选中的图片
 */
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 包装一个导航控制器
    HYFNavigationController *nav = [[HYFNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    // 设置子控制器的tabBarItem
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:image];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
}




@end
