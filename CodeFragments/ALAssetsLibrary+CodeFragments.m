//
//  ALAssetsLibrary+CodeFragments.m
//  Vodka
//
//  Created by jinyu on 15/8/3.
//  Copyright (c) 2015年 Vodka Inc. All rights reserved.
//

#import "ALAssetsLibrary+CodeFragments.h"
#import "NSString+CodeFragments.h"

@implementation PHPhotoLibrary (CodeFragments)

+ (void)authorization:(void (^) (BOOL authrization))authrization{

    if([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusNotDetermined){
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if(status != PHAuthorizationStatusNotDetermined){
                authrization(YES);
            }else{
                authrization(NO);
            }
        }];
    }else{
        authrization(YES);
    }
}

+ (void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock {
    if(image == nil){
        if(completionBlock){
            completionBlock(nil, NO, NSLocalizedString(@"要存储的图片不能为空", nil));
        }
        return;
    }
    
    if([NSString isEmptyString:albumName]){
        if(completionBlock){
            completionBlock(nil, NO, NSLocalizedString(@"相册名称不能为空", nil));
        }
        return;
    }
    
    
    [self authorization:^(BOOL authrization) {
        __block PHAssetCollection   *collection;
        __block PHObjectPlaceholder *placeHolder;
        
        PHFetchOptions *fetchoptions = [[PHFetchOptions alloc] init];
        fetchoptions.predicate = [NSPredicate predicateWithFormat:@"title = %@", albumName];
        collection = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:fetchoptions].firstObject;
        if(!collection){
            
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                PHAssetCollectionChangeRequest  *createAlbum = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:albumName];
                placeHolder = [createAlbum placeholderForCreatedAssetCollection];
                
            } completionHandler:^(BOOL success, NSError * _Nullable error) {
                if(success){
                    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                        
                        PHAssetChangeRequest    *imageCreationRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
                        collection = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[placeHolder.localIdentifier] options:nil].firstObject;
                        PHAssetCollectionChangeRequest  *albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
                        [albumChangeRequest addAssets:@[imageCreationRequest.placeholderForCreatedAsset]];
                        
                    } completionHandler:^(BOOL success, NSError * _Nullable error) {
                        if(success){
                            if(completionBlock){
                                completionBlock(nil, YES, @"");
                            }
                            
                        }else{
                            if(completionBlock){
                                completionBlock(error, NO, @"图片存储出错");
                            }
                        }
                    }];
                }
            }];
        }else{
            
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                PHAssetChangeRequest    *imageCreationRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
                collection = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:fetchoptions].firstObject;
                PHAssetCollectionChangeRequest  *albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
                [albumChangeRequest addAssets:@[imageCreationRequest.placeholderForCreatedAsset]];
            } completionHandler:^(BOOL success, NSError * _Nullable error) {
                if(success){
                    if(completionBlock){
                        completionBlock(nil, YES, @"");
                    }
                    
                }else{
                    if(completionBlock){
                        completionBlock(error, NO, @"图片存储出错");
                    }
                }
            }];
        }
    }];
}

@end
