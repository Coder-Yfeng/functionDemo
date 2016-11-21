//
//  HYFBaseTabViewController.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/21.
//  Copyright © 2016年 youfenghe. All rights reserved.
//

#import "HYFBaseTabViewController.h"
#import "HYFBaseTopicViewController.h"
static NSString * const ID = @"cell";
@interface HYFBaseTabViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UIScrollView *topScrollView;
@property (nonatomic, weak) UICollectionView *bottomCollectionView;
@property (nonatomic, weak) UIButton *selectedButton;
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, weak) UIView *underline;
@property (nonatomic, assign)  BOOL isInitial;
@end

@implementation HYFBaseTabViewController

-(NSMutableArray *)btnArray{
    
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加底部内容View
    [self setupBottomContanierView];
    
    // 添加顶部内容View
    [self setupTopTitleView];
    
    // 添加所有的标题按钮
    [self setupAllTitleButton];
    
    // 取消自动添加额外滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    if (_isInitial == NO) {
        [self setupAllTitleButton];
        _isInitial = YES;
    }
    
}

- (void)titleClick:(UIButton *)button
{
    NSInteger i = button.tag;
    if (button == _selectedButton) {
        // 获取当前的控制器
        HYFBaseTopicViewController *topicView  = self.childViewControllers[i];
        // 刷新当前控制器
        [topicView reload];
    }
    [self selButton:button];
    CGFloat offsetX = HYFScreenW * i;
    self.bottomCollectionView.contentOffset = CGPointMake(offsetX, 0);
}
#pragma mark - 选中标题
-(void)selButton:(UIButton *)button{
    
    
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    [UIView animateWithDuration:0.15 animations:^{
        self.underline.hyf_centerX = button.hyf_x + button.hyf_width * 0.5;
    }];
    
}
/**
 *  注意扩展性问题,这里显示的button一直都会只在一个屏幕宽度上,所以需要先固定要btn的宽度,通过宽度以及子控件个数来确定scrollView的contentSize大小
 */

-(void)setupAllTitleButton{
    NSInteger count = self.childViewControllers.count;
    CGFloat btnX = 0;
    CGFloat btnW = HYFScreenW / count;
    CGFloat btnH = self.topScrollView.hyf_height;
    for (int i = 0; i < count; i++) {
        btnX = i * btnW;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
        btn.tag = i;
        [self.topScrollView addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnArray addObject:btn];
        // 默认选中第一个
        if (i == 0) {
            
            [btn.titleLabel sizeToFit];
            // 添加下划线
            UIView *underline = [[UIView alloc] init];
            underline.backgroundColor = [UIColor redColor];
            [self.topScrollView addSubview:underline];
            _underline = underline;
            underline.hyf_width = btn.titleLabel.hyf_width;
            underline.hyf_height = 2;
            underline.hyf_centerX = btn.hyf_x + btn.hyf_width * 0.5;
            underline.hyf_y = self.topScrollView.hyf_height - underline.hyf_height;
            [self titleClick:btn];
        }
        
    }
}



-(void)setupBottomContanierView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor lightGrayColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    // 注册cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collectionView];
    _bottomCollectionView = collectionView;
    
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.bounces = NO;
    collectionView.pagingEnabled = YES;
    
}


-(void)setupTopTitleView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, HYFScreenW, 35)];
    scrollView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [self.view addSubview:scrollView];
    _topScrollView = scrollView;
    
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.childViewControllers.count;
}

// 每一次只要出现新的cell就会调用
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    // 移除之前的控制器的View
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 切换自控制器的View
    UITableViewController *vc = self.childViewControllers[indexPath.row];
    // 不让tableview内容被挡住
    vc.tableView.contentInset = UIEdgeInsetsMake(64 + self.topScrollView.hyf_height, 0, 49, 0);
    vc.view.frame = [UIScreen mainScreen].bounds;
    [cell.contentView addSubview:vc.view];
    
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / HYFScreenW;
    UIButton *btn = self.btnArray[page];
    [self selButton:btn];
}

@end
