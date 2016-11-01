//
//  NSString+RegularPatternCompare.m
//  regularTest
//
//  Created by WuMingHung on 2016/1/22.
//  Copyright © 2016年 WuMingHung. All rights reserved.
//

#import "NSString+RegularPatternCompare.h"

// CT Component

// Model

// View

// Controller

// Other

@implementation NSString (RegularPatternCompare)

//================================================================================
// 比對url的String是否與pattern符合
//================================================================================
- (NSString *)stringMatchRegularExtensionWithPattern:(NSString *)pattern
{
    NSError *error;
    NSString *returnString = @"";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    if (regex != nil) {
        
        NSTextCheckingResult *firstMatch = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
        
        if (firstMatch) {
            
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            returnString = [self substringWithRange:resultRange];
        }
    }
    // 回傳符合的字串
    return returnString;
}

- (BOOL)isMatchWithPattern:(NSString *)pattern {
    NSRegularExpression *regularExpression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    return [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)] > 0;
}

@end
