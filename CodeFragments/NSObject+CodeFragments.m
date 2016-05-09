//
//  NSObject+CodeFragment.m
//  CodeFragment
//
//  Created by jinyu on 14/12/6.
//  Copyright (c) 2014年 jinyu. All rights reserved.
//


//它会输出文件名，和打印的具体行号



#import "NSObject+CodeFragments.h"

@implementation NSObject (CodeFragments)

/**
 *  @brief 获取当前系统语言版本
 *
 *  @return 当前系统语言版本
 */
+ (NSString*)currentSystemLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return currentLanguage;
}


- (void)writeImage:(UIImage *)image withFileArguments:(FileArguments)arguments complete:(SaveImageComplete)complete{
    NSFileManager* defaultManager = [NSFileManager defaultManager];
    [defaultManager createDirectoryAtPath:[NSString stringWithFormat:@"%@/%@", arguments.syetemPath, arguments.directory] withIntermediateDirectories:NO attributes:nil error:nil];
    
    NSString* directoryPath = [arguments.syetemPath stringByAppendingPathComponent:arguments.directory];
    NSString* filePath = [directoryPath stringByAppendingPathComponent:arguments.filename];
    NSData* data = UIImageJPEGRepresentation(image, arguments.scale);
    [data writeToFile:filePath atomically:YES];
    complete([NSString stringWithFormat:@"%@/%@", arguments.directory, arguments.filename], [NSString stringWithFormat:@"%@/%@/%@", arguments.syetemPath, arguments.directory, arguments.filename]);
}


/**
 *  @brief 把数据保存到应用的沙盒中
 *
 *  @param image     要保存的图片
 *  @param arguments 保存时的参数
 *  @param complete  保存完成后的block，会包含图片的绝对路径(absolutePath)和相对路径(relativePath)
 */
- (void)writeData:(NSData*)data withFileArguments:(FileArguments)arguments complete:(SaveImageComplete)complete{
    NSFileManager* defaultManager = [NSFileManager defaultManager];
    [defaultManager createDirectoryAtPath:[NSString stringWithFormat:@"%@/%@", arguments.syetemPath, arguments.directory] withIntermediateDirectories:NO attributes:nil error:nil];
    
    NSString* directoryPath = [arguments.syetemPath stringByAppendingPathComponent:arguments.directory];
    NSString* filePath = [directoryPath stringByAppendingPathComponent:arguments.filename];
    [data writeToFile:filePath atomically:YES];
    complete([NSString stringWithFormat:@"%@/%@", arguments.directory, arguments.filename], [NSString stringWithFormat:@"%@/%@/%@", arguments.syetemPath, arguments.directory, arguments.filename]);    
}

- (NSString*)absolutePath:(NSString*)relativePath systemPath:(NSString*)systemPath{
    return [systemPath stringByAppendingPathComponent:relativePath];
}

@end
