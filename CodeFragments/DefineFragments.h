//
//  DefineFragments.h
//  CodeFragment
//
//  Created by jinyu on 15/1/30.
//  Copyright (c) 2015年 jinyu. All rights reserved.
//

#ifndef CodeFragment_DefineFragments_h
#define CodeFragment_DefineFragments_h


/**
 *  @brief 输出格式如下的打印信息：(类名:行数   打印的信息), 只有在DEBUG模式下输出，release模式不会输出(Build Settings 中 Preprocessor Macros 的 Debug 后边会有 DEBUG = 1 定义)
 */

#ifdef DEBUG
    #define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
    #define NSLog(...)
#endif

/**
 *  @brief  iOS 系统 Document 目录宏定义
 */
#define SYSTEM_DOCUMENT_PATH     NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

/**
 *  @brief  iOS 系统 Libiary 目录宏定义
 */
#define SYSTEM_LIBIARY_PATH      NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]



#endif
