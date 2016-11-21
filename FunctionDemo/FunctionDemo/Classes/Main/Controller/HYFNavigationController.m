//
//  HYFNavigationController.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/17.
//  Copyright © 2016年 youfenghe. All rights reserved.
//

#import "HYFNavigationController.h"
#import "HYFNavigationBar.h"
#import "HYFBackView.h"
@interface HYFNavigationController ()

@end

@implementation HYFNavigationController


+(void)load {
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 设置导航条标题字体 => 导航条
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    bar.titleTextAttributes = attr;
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}

// 控制是否触发手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    return self.childViewControllers.count > 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 不要系统手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    id target = self.interactivePopGestureRecognizer.delegate;
    
    // 创建Pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    // 创建自己的导航条
    HYFNavigationBar *navigationBar = [[HYFNavigationBar alloc] initWithFrame:self.navigationBar.frame];
    [self setValue:navigationBar forKey:@"navigationBar"];
    
    
    
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    
    // 设置返回按钮
    // 设置导航条返回按钮 获取到当前控制器的navgationItem的left
    
    if (self.childViewControllers.count > 0) {
        HYFBackView *backView = [HYFBackView backViewWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backView];
        // 一定在push之前
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
