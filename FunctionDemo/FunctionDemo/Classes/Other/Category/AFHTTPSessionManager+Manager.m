//
//  AFHTTPSessionManager+Manager.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/20.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "AFHTTPSessionManager+Manager.h"

@implementation AFHTTPSessionManager (Manager)

+(instancetype)hyf_manager{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // [AFJSONResponseSerializer serializer] : JSON
    // [AFOnoResponseSerializer XMLResponseSerializer] ： XML
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    mgr.responseSerializer = response;
    return mgr;
    
}

@end
