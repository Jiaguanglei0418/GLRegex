//
//  main.m
//  GLRegex
//
//  Created by jiaguanglei on 16/1/29.
//  Copyright © 2016年 roseonly. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+Regex.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //
        NSString *username = @"[哈哈]// @192.168.1.1; @浪小花 #解放军# WWW.baidu.com, [ni]百度";
        
//        NSLog(@"%d", [username isIPAddress]);
        
        NSString *text = @"[哈哈]// http://www.baidu.com 192.168.1.1; @浪小花 #解放军# WWW.baidu.com, [ni]百度";
        /**
         *  使用正则表达式的步骤
         1. 创建一个正则表达式对象, 定义规则
         
         2. 利用正则表达式对象 来测试 相应的字符串
         */
        
        // 1. 创建正则表达式
        // 规则: [0-9], 查找0-9之间的数字; 相当于 \d (注意\转义字符)
        // [a-z]{3,6}: 查找 连续3个到6个 的小写字母个数;
        //
        NSString *pattern = @"^\\d[0-9a-zA-Z]*\\d$";
        // 1.1 QQ
        pattern = @"^[1-9]\\d{4,10}$";
        
        // 1.2 phoneNum
        pattern = @"^1[3578]\\d{9}$";
        
        // 1.3 ip
        pattern = @"\\d+\\.\\d+\\.\\d+\\.\\d+";
        
        // 1.4 判断汉字[]
        pattern = @"\\[[a-zA-Z\\u4e00-\\u9fa5]+\\]";
        
        // 1.5 @
        pattern = @"@[0-9a-zA-Z\\u4e00-\\u9fa5]+";
        
        // 1.6 #
        pattern = @"\\#[a-zA-Z\\u4e00-\\u9fa5]+\\#";
        
        // 1.7 链接 url
        pattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
        
        pattern = @"\\[[a-zA-Z\\u4e00-\\u9fa5]+\\]|@[0-9a-zA-Z\\u4e00-\\u9fa5]+|\\#[a-zA-Z\\u4e00-\\u9fa5]+\\#|\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
        
        NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
        // ? + *
        // ?: 0个或者1个
        // +: 至少1个
        // *: 0个或者多个(任意)
        // ^: 开头
        // @"^\\d[0-9a-zA-Z]*\\d$" 以数字开头, 以数字结尾, 中间是任意多个数字或者字母;
        
        // 2. 测试字符串
        NSArray *results = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
        for (NSTextCheckingResult *result in results) {
            NSLog(@"%@ %@", NSStringFromRange(result.range), [text substringWithRange:result.range]);
        }
        
        
    }
    return 0;
}
