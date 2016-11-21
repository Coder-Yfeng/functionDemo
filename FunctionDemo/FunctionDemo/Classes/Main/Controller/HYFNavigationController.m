//
//  HYFNavigationController.m
//  FunctionDemo
//
//  Created by hyp on 2016/11/17.
//  Copyright © 2016年 youfenghe. All rights reserved.
//

#import "HYFNavigationController.h"

@interface HYFNavigationController ()

@end

@implementation HYFNavigationController


+(void)load {
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *attrDct = [NSMutableDictionary dictionary];
    attrDct[NSFontAttributeName] = [UIFont systemFontOfSize:22];
    navBar.titleTextAttributes = attrDct;
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
