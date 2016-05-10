//
//  NSString+CodeFragments.m
//  CodeFragment
//
//  Created by jinyu on 15/1/30.
//  Copyright (c) 2015年 jinyu. All rights reserved.
//

#import "NSString+CodeFragments.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (CodeFragments)

- (NSString*)md5String{
    if(self == nil || [self length] == 0){
        return @"";
    }
    const char *value = [self UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}

- (id)jsonvalue{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    if(!data){
        NSLog(@"解析json字符串出错！");
        return nil;
    }
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if(error){
        NSLog(@"解析json字符串出错！");
    }
    return result;
}

- (BOOL)stringContainsSubString:(NSString *)subString {
    NSRange aRange = [self rangeOfString:subString];
    if (aRange.location == NSNotFound) {
        return NO;
    }
    
    return YES;
}

- (BOOL)matchStringWithRegextes:(NSString*)regString{
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regString];
    BOOL result = [predicate evaluateWithObject:self];
    return result;
}

/*!
 @author 王金宇, 16-05-09 16:05:21
 
 @brief 判断一个字符串是否为空字符串
 
 @param string 要判断的字符串
 
 @return 判断结果
 
 @since 3.0
 */
+ (BOOL)isEmptyString:(NSString *)string{
    
    if(string == nil){
        return YES;
    }
    if([string isKindOfClass:[[NSNull null] class]]){
        return YES;
    }
    if([string isEqualToString:@""]){
        return YES;
    }
    if([string isEqualToString:@"<null>"]){
        return YES;
    }
    if([string isEqualToString:@"(null)"]){
        return YES;
    }
    return NO;
}

- (BOOL)containsEmojiString
{
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

@end
