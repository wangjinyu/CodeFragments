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
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if(error){
        NSLog(@"解析json字符串出错！");
    }
    return result;
}

- (BOOL)isEmpty{
    if(self.length <= 0 || self == (id)[NSNull null] || [self isKindOfClass:[[NSNull null] class]] || self == nil)
        return YES;
    return NO;
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

@end
