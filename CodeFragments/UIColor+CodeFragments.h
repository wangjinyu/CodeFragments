//
//  UIColor+CodeFragments.h
//  CodeFragment
//
//  Created by jinyu on 15/2/4.
//  Copyright (c) 2015年 jinyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TargetConditionals.h"

#pragma mark - Static String Keys
static NSString * kColoursRGBA_R = @"RGBA-r";
static NSString * kColoursRGBA_G = @"RGBA-g";
static NSString * kColoursRGBA_B = @"RGBA-b";
static NSString * kColoursRGBA_A = @"RGBA-a";
static NSString * kColoursHSBA_H = @"HSBA-h";
static NSString * kColoursHSBA_S = @"HSBA-s";
static NSString * kColoursHSBA_B = @"HSBA-b";
static NSString * kColoursHSBA_A = @"HSBA-a";
static NSString * kColoursCIE_L = @"LABa-L";
static NSString * kColoursCIE_A = @"LABa-A";
static NSString * kColoursCIE_B = @"LABa-B";
static NSString * kColoursCIE_alpha = @"LABa-a";
static NSString * kColoursCMYK_C = @"CMYK-c";
static NSString * kColoursCMYK_M = @"CMYK-m";
static NSString * kColoursCMYK_Y = @"CMYK-y";
static NSString * kColoursCMYK_K = @"CMYK-k";


#pragma mark - Create correct iOS/OSX interface

#if TARGET_OS_IPHONE
@interface UIColor (CodeFragments)
#endif

/**
 Creates a Color from a Hex representation string
 @param hexString   Hex string that looks like @"#FF0000" or @"FF0000"
 @return    Color
 */
+ (instancetype)colorFromHexString:(NSString *)hexString;

+ (instancetype)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 Creates a Color from an array of 4 NSNumbers (r,g,b,a)
 @param rgbaArray   4 NSNumbers for rgba between 0 - 1
 @return    Color
 */
+ (instancetype)colorFromRGBAArray:(NSArray *)rgbaArray;

/**
 Creates a Color from a dictionary of 4 NSNumbers
 Keys: kColoursRGBA_R, kColoursRGBA_G, kColoursRGBA_B, kColoursRGBA_A
 @param rgbaDictionary   4 NSNumbers for rgba between 0 - 1
 @return    Color
 */
+ (instancetype)colorFromRGBADictionary:(NSDictionary *)rgbaDict;

/**
 Creates a Hex representation from a Color
 @return    NSString
 */
- (NSString *)hexString;

/**
 Creates an array of 4 NSNumbers representing the float values of r, g, b, a in that order.
 @return    NSArray
 */
- (NSArray *)rgbaArray;

/**
 *  Returns the red value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)red;

/**
 *  Returns the green value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)green;

/**
 *  Returns the blue value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)blue;

/**
 *  Returns the alpha value from an RGBA formulation of the UIColor.
 *
 *  @return CGFloat
 */
- (CGFloat)alpha;

@end
