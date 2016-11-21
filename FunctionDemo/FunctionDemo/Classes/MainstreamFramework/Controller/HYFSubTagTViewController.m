//
//  HYFSubTagTViewController.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/20.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFSubTagTViewController.h"
#import <MJExtension/MJExtension.h>
#import "HYFSubTagItem.h"
#import "HYFTagCell.h"
#import <SVProgressHUD.h>
static NSString * const ID = @"cell1";
@interface HYFSubTagTViewController ()

@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, weak) AFHTTPSessionManager *mgr;

@end

@implementation HYFSubTagTViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    // 注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"HYFTagCell" bundle:nil] forCellReuseIdentifier:ID];
    // 取消系统分割线
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
}
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    // 隐藏指示器
    [SVProgressHUD dismiss];
    
    // 取消请求
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData{
    
    // 添加HUD
    [SVProgressHUD showWithStatus:@"正在加载数据..."];
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager hyf_manager];
    self.mgr = mgr;
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"c"] = @"topic";
    parameters[@"action"] = @"sub";
    
    // 3.发送请求
    [mgr GET:HYFBaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 关闭指示器
        [SVProgressHUD dismiss];
        self.tags = [HYFSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        
        // 刷新tableView数据
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
    }];

    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HYFTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.item = _tags[indexPath.row];
    
    //    cell.textLabel.text = [_tags[indexPath.row] theme_name];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
