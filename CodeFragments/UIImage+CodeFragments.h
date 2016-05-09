//
//  UIImage+CodeFragments.h
//  CodeFragment
//
//  Created by jinyu on 15/2/4.
//  Copyright (c) 2015年 jinyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CodeFragments)

/**
 *  @brief 生成截图
 *
 *  @param view  要截图的view
 *  @param size  要截取view上边图片的大小
 *
 *  @return      生成的截图
 */

+ (UIImage*)screenShot:(UIView *)view size:(CGSize)size resultImage:(void (^)(UIImage* image))resultImage;

/*!
 @author 王金宇, 16-05-09 16:05:10
 
 @brief 获取图片中某一个点的颜色
 
 @param point 位置
 
 @return UIColor object
 
 @since 3.0
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;



@end

