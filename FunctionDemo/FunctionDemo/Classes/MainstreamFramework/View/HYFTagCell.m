//
//  HYFTagCell.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/20.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFTagCell.h"
#import "HYFSubTagItem.h"
#import <UIImageView+WebCache.h>

@interface HYFTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *numView;



@end

@implementation HYFTagCell
// 设置cell的尺寸
-(void)setFrame:(CGRect)frame{
    
    frame.size.height -=10;
    [super setFrame:frame];
}

- (void)setItem:(HYFSubTagItem *)item
{
    _item = item;
    
    // 圆角图像
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        // 1.开启和图片相同大小的位图上下文
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        // 2.圆形裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        // 3.设置裁剪区域
        [clipPath addClip];
        // 4.绘图
        [image drawAtPoint:CGPointZero];
        // 5.取出图片
        image = UIGraphicsGetImageFromCurrentImageContext();
        // 6.关闭位图上下文
        UIGraphicsEndImageContext();
        self.iconView.image = image;
        
    }];
    
    
    // 处理订阅数字
    CGFloat num = [item.sub_number floatValue];
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅",item.sub_number];
    if (num > 10000) {
        num = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f万人订阅",num];
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    
    _numView.text = numStr;
    
}

+ (instancetype)cell{

    return [[[NSBundle mainBundle] loadNibNamed:@"HYFTagCell" owner:nil options:nil] firstObject];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
