//
//  CTWebUrlManager.h
//  TryTOWebViewController
//
//  Created by AlanYen on 2016/11/1.
//  Copyright © 2016年 Alan-App. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTWebUrlManager : NSObject

+ (instancetype)sharedInstance;
+ (NSString *)parseServerHost:(NSString *)urlString;
+ (NSString *)parseBid:(NSString *)urlString;
+ (NSString *)parseChannelId:(NSString *)urlString;
+ (NSDictionary *)parseEvent:(NSString *)urlString;

@end
