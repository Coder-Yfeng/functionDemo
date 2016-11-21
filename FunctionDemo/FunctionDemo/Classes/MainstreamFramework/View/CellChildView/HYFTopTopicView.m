//
//  HYFTopTopicView.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/25.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFTopTopicView.h"
#import <UIImageView+WebCache.h>
#import "HYFTopicItem.h"

@interface HYFTopTopicView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *textLable;

@end

@implementation HYFTopTopicView

//
- (IBAction)moreClick:(UIButton *)sender {
    
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"投诉",@"建议", nil];
//        [actionSheet showInView:self];
    
    // topView点击更多
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *affirmActon = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:cancelAction];
    [alertVC addAction:affirmActon];
    
    // 获取主窗口根控制器
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC presentViewController:alertVC animated:YES completion:nil];
    
}

+(instancetype)viewForXib{

    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
-(void)setItem:(HYFTopicItem *)item{

    _item = item;
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:item.profile_image]placeholderImage:[UIImage imageNamed:@"imageBackground"]];
    _nameLable.text = item.screen_name;
    _timeLable.text = item.create_time;
    _textLable.text = item.text;
}

@end
