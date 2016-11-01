//
//  NSString+ParseURLParams.m
//  New17Life
//
//  Created by Alan.Yen on 2016/10/06.
//  Copyright (c) 2016年 17Life. All rights reserved.
//

#import "NSString+ParseURLParams.h"

@implementation NSString (ParseURLParams)

- (NSDictionary *)parseURLParams {
    
    NSArray *pairs = [self componentsSeparatedByCharactersInSet:
                      [NSCharacterSet characterSetWithCharactersInString:@"?&"]];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        if (kv != nil && kv.count == 2) {
            NSString *val =
            [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            params[kv[0]] = val;
        }
    }
    return params;
}

@end
