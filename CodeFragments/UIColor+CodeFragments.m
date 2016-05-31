//
//  UIColor+CodeFragments.m
//  CodeFragment
//
//  Created by jinyu on 15/2/4.
//  Copyright (c) 2015年 jinyu. All rights reserved.
//

#import "UIColor+CodeFragments.h"
#import <objc/runtime.h>

#define ColorClass UIColor

#pragma mark - Static Block
static CGFloat (^RAD)(CGFloat) = ^CGFloat (CGFloat degree){
    return degree * M_PI/180;
};
@implementation UIColor (CodeFragments)

#pragma mark - Color from Hex
+ (instancetype)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    
    return [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:1.0];
}

+ (instancetype)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    
    return [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:alpha];
}


#pragma mark - Hex from Color
- (NSString *)hexString
{
    NSArray *colorArray	= [self rgbaArray];
    int r = [colorArray[0] floatValue] * 255;
    int g = [colorArray[1] floatValue] * 255;
    int b = [colorArray[2] floatValue] * 255;
    NSString *red = [NSString stringWithFormat:@"%02x", r];
    NSString *green = [NSString stringWithFormat:@"%02x", g];
    NSString *blue = [NSString stringWithFormat:@"%02x", b];
    
    return [NSString stringWithFormat:@"#%@%@%@", red, green, blue];
}


#pragma mark - Color from RGBA
+ (instancetype)colorFromRGBAArray:(NSArray *)rgbaArray
{
    if (rgbaArray.count < 4) {
        return [[self class] clearColor];
    }
    
    return [[self class] colorWithRed:[rgbaArray[0] floatValue]
                                green:[rgbaArray[1] floatValue]
                                 blue:[rgbaArray[2] floatValue]
                                alpha:[rgbaArray[3] floatValue]];
}

+ (instancetype)colorFromRGBADictionary:(NSDictionary *)rgbaDict
{
    if (rgbaDict[kColoursRGBA_R] && rgbaDict[kColoursRGBA_G] && rgbaDict[kColoursRGBA_B] && rgbaDict[kColoursRGBA_A]) {
        return [[self class] colorWithRed:[rgbaDict[kColoursRGBA_R] floatValue]
                                    green:[rgbaDict[kColoursRGBA_G] floatValue]
                                     blue:[rgbaDict[kColoursRGBA_B] floatValue]
                                    alpha:[rgbaDict[kColoursRGBA_A] floatValue]];
    }
    
    return [[self class] clearColor];
}


#pragma mark - RGBA from Color
- (NSArray *)rgbaArray
{
    CGFloat r=0,g=0,b=0,a=0;
    
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    
    return @[@(r),
             @(g),
             @(b),
             @(a)];
}

- (NSDictionary *)rgbaDictionary
{
    CGFloat r=0,g=0,b=0,a=0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    
    return @{kColoursRGBA_R:@(r),
             kColoursRGBA_G:@(g),
             kColoursRGBA_B:@(b),
             kColoursRGBA_A:@(a)};
}

- (CGFloat)red
{
    return [[self rgbaArray][0] floatValue];
}

- (CGFloat)green
{
    return [[self rgbaArray][1] floatValue];
}

- (CGFloat)blue
{
    return [[self rgbaArray][2] floatValue];
}

- (CGFloat)alpha
{
    return [[self rgbaArray][3] floatValue];
}

#pragma mark - RGBA Helper method
+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
