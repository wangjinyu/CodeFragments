//
//  ALAssetsLibrary+CodeFragments.h
//  Vodka
//
//  Created by jinyu on 15/8/3.
//  Copyright (c) 2015年 Vodka Inc. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>
typedef void (^SaveImageCompletion) (NSError* error, BOOL successed, NSString* message);

@interface PHPhotoLibrary (CodeFragments)
+ (void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;
@end
