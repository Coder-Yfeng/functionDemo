//
//  HYFPhotoManager.m
//  FunctionDemo
//
//  Created by hyp on 2020/22/31.
//  Copyright © 2016年 youfenghe. All rights reserved.

//

#import "HYFPhotoManager.h"
#import <Photos/Photos.h>
@implementation HYFPhotoManager

#pragma mark - 获取之前相册fetchAssetColletion
+ (PHAssetCollection *)fetchAssetColletion:(NSString *)albumTitle
{
    // 获取之前相册
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    for (PHAssetCollection *assetCollection in result) {
        if ([assetCollection.localizedTitle isEqualToString:albumTitle]) {
            return assetCollection;
        }
    }
    
    return nil;
    
}

+ (void)savePhoto:(UIImage *)image albumTitle:(NSString *)albumTitle completionHandler:(void(^)(BOOL success, NSError * error))completionHandler{
    
    // 相簿
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        // 判断之前有没有相册,获取之前相册
        PHAssetCollection *assetCollection = [self fetchAssetColletion:albumTitle];
        
        PHAssetCollectionChangeRequest *assetCollectionChangeRequest;
        if (assetCollection) {
            // 相册存在
            assetCollectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
        }else{
            // 相册不存在
            assetCollectionChangeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:albumTitle];
        }
        // 保存图片
        PHAssetChangeRequest *assetChangeRequesta = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        // 把图片添加到自定义相册里
        PHObjectPlaceholder *paceholderp = [assetChangeRequesta placeholderForCreatedAsset];
        [assetCollectionChangeRequest addAssets:@[paceholderp]];
        
        
    } completionHandler:completionHandler];

}

@end
