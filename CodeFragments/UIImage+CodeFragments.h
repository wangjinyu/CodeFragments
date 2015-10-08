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
 *  @brief 生成圆角图片
 *
 *  @param image 要生成圆角的图片
 *  @param size  生成的图片大小
 *  @param r     圆角的大小
 *
 *  @return      生成的圆角图片
 */
+ (UIImage*)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
