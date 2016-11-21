//
//  HYFBaseTopicViewController.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/31.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFBaseTopicViewController.h"
#import "HYFTopicCell.h"
#import "HYFTopicViewModel.h"
#import "HYFTopicItem.h"
#import <MJExtension/MJExtension.h>
#import <MJRefresh/MJRefresh.h>
#import "HYFNewViewController.h"
static NSString * const ID = @"cell";

@interface HYFBaseTopicViewController ()
@property (nonatomic, strong) NSMutableArray *topicsVM;
@property (nonatomic, strong) NSString *maxtime;
@property (nonatomic, weak) AFHTTPSessionManager *mgr;
@end

@implementation HYFBaseTopicViewController

-(AFHTTPSessionManager *)mgr{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}
-(NSMutableArray *)topicsVM{
    
    if (_topicsVM == nil) {
        _topicsVM = [NSMutableArray array];
    }
    return _topicsVM;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册cell
    [self.tableView registerClass:[HYFTopicCell class] forCellReuseIdentifier:ID];
    // 请求数据
    [self loadNewData];
    
    // 清楚tableView间距
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置背景色
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    // 设置右边内容条指示
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(99, 0, 49, 0);
    // 添加上下拉刷新
    [self setupRefresh];
    // 每次一进来,先加载最新数据
    [self.tableView.mj_header beginRefreshing];
    // 通知:通知底部按钮,点击的时候,刷新列表
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reload) name:@"repeatClickTab" object:nil];
}
-(void)dealloc{
    // 移除所有通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setupRefresh{
    // 添加下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 自动处理显示状态
    header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header = header;
    
    // 添加上拉刷新
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 自动处理显示状态
    footer.automaticallyChangeAlpha = YES;
    self.tableView.mj_footer = footer;
    
}


#pragma mark - 加载更多数据
- (void)loadMoreData
{
    
    // 取消之前请求
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    // 添加会话管理者
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *a = @"list";
    // 判断是精华还是新帖
    if ([self.parentViewController isKindOfClass:[HYFNewViewController class]]) {
        a = @"newlist";
    }
    
    parameters[@"a"] = a;    parameters[@"c"] = @"data";
    parameters[@"maxtime"] = _maxtime;
    parameters[@"type"] = self.type;
    
    [self.mgr GET:HYFBaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self.tableView.mj_footer endRefreshing];
        
        // 保存下一页最大ID
        _maxtime =  responseObject[@"info"][@"maxtime"];
        
        // 字典数组 转 模型数组
        NSArray *topics = [HYFTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 计算topView尺寸 =》 cell尺寸
        // 模型转视图模型
        for (HYFTopicItem *item in topics) {
            
            HYFTopicViewModel *vm = [[HYFTopicViewModel alloc] init];
            // 计算cell高度和子控件尺寸
            vm.item = item;
            [self.topicsVM addObject:vm];
        }
        
        // 刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
// 加载数据
- (void)reload
{
    [self.tableView.mj_header beginRefreshing];
}

// 请求数据
-(void)loadNewData{
    // 取消之前请求
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    // 添加会话管理者
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    // 判断是精华还是新帖
    NSString *a = @"list";
    if ([self.parentViewController isKindOfClass:[HYFNewViewController class]]) {
        a = @"newlist";
    }
    parameters[@"a"] = a;
    parameters[@"c"] = @"data";
    parameters[@"c"] = @"data";
    parameters[@"type"] = self.type;
    
    [self.mgr GET:HYFBaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 停止刷新
        [self.tableView.mj_header endRefreshing];
        
        // 字典数组转模型数组
        NSArray *topics = [HYFTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //        [responseObject writeToFile:@"/Users/hyp/Desktop/简历准备/abs.plist" atomically:YES];
        // 计算topView的尺寸
        for (HYFTopicItem *item in topics) {
            HYFTopicViewModel *vm = [[HYFTopicViewModel alloc] init];
            vm.item = item;
            [self.topicsVM addObject:vm];
        }
        // 刷新表格
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _topicsVM.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HYFTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.vm = self.topicsVM[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [_topicsVM[indexPath.row] cellH] + 5;
}

@end
