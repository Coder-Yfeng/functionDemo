//
//  HYFTopicItem.h
//  FunctionDemo
//
//  Created by hyp on 2020/22/25.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import <Foundation/Foundation.h>
#import "HYFCommentItem.h"
typedef enum : NSUInteger {
    HYFTopicItemTypeAll = 1,
    HYFTopicItemTypePicture = 10,
    HYFTopicItemTypeVideo = 41,
    HYFTopicItemTypeVocie = 31,
    HYFTopicItemTypeText = 29
} HYFTopicItemType;
@interface HYFTopicItem : NSObject

@property (nonatomic, strong) NSString *profile_image;
@property (nonatomic, strong) NSString *screen_name;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *create_time;


/*
 中间图片View属性
 */
@property (nonatomic, strong) NSString *image0;
@property (nonatomic, assign) BOOL is_gif;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) HYFTopicItemType type;
@property (nonatomic, assign) BOOL is_bigPicture;
@property (nonatomic, strong) NSString *videouri;
@property (nonatomic, assign) NSInteger videotime;
@property (nonatomic, strong) NSString *playcount;
@property (nonatomic, strong) NSString *voiceuri;
@property (nonatomic, assign) NSInteger voicetime;
@property (nonatomic, strong) NSArray *top_cmt;
@property (nonatomic, strong) HYFCommentItem *topComment;

/*
 底部View属性
 */
@property (nonatomic, assign) CGFloat cai;
@property (nonatomic, assign) CGFloat ding;
@property (nonatomic, assign) CGFloat comment;
@property (nonatomic, assign) CGFloat repost;

@end
