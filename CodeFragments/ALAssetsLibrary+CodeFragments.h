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

/*!
 @author 王金宇, 16-05-10 15:05:35
 
 @brief 保存图片到自定义相册
 
 @param image           要保存的图片
 @param albumName       自定义相册名称
 @param completionBlock 完成回调
 
 @since 3.0
 */
+ (void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;

/*!
 @author 王金宇, 16-05-10 15:05:44
 
 @brief 获取相册中所有照片,并按照时间的先后顺序排序
 
 @return PHAsset 合集
 
 @see getImageInAsset:size:result
 
 @since 3.0
 */
+ (NSArray*)getAllPhotoLibraryPhotos;

/*!
 @author 王金宇, 16-05-10 16:05:50
 
 @brief 获取一段时间之间的照片
 
 @param startDate 开始时间
 @param endDate   结束时间
 
 @see getImageInAsset:size:result
 
 @return PHAsset 合集
 
 @since 3.0
 */
+ (NSArray*)getPhtotsBetweenDate:(NSDate*)startDate andDate:(NSDate*)endDate;

/*!
 @author 王金宇, 16-05-10 16:05:30
 
 @brief 获取相册中最后一张照片
 
 @see getImageInAsset:size:result
 
 @return 最后一张照片
 
 @since 3.0
 */
+ (PHAsset*)getLastPhotoInPhtots;

/*!
 @author 王金宇, 16-05-10 16:05:02
 
 @brief 通过PHAsset对象获取图片
 
 @param asset       PHAsset对象
 @param aSize       要获取图片的缩略图大小，如果要获取原图, 传入PHImageManagerMaximumSize
 @param resultBlock 返回的UIImage和info
 
 @since 3.0
 */
+ (void)getImageInAsset:(PHAsset*)asset size:(CGSize)aSize result:(void (^) (UIImage* image, NSDictionary* info))resultBlock;

@end
