//
//  NSString+Regex.h
//  GLRegex
//
//  Created by jiaguanglei on 16/1/29.
//  Copyright © 2016年 roseonly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)


-(BOOL)isChinese;
- (BOOL)isQQ;
- (BOOL)isPhoneNumber;
- (BOOL)isIPAddress;

@end
