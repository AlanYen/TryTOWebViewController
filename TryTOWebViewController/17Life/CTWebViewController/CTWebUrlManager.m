//
//  CTWebUrlManager.m
//  TryTOWebViewController
//
//  Created by AlanYen on 2016/11/1.
//  Copyright © 2016年 Alan-App. All rights reserved.
//

#import "CTWebUrlManager.h"
#import "NSString+ParseURLParams.h"
#import "NSString+RegularPatternCompare.h"

static NSString *ServerHostName = @"http://www.17life.com";
static NSString *SSLServerHostName = @"https://www.17life.com";

@interface CTWebUrlManager ()

@property (strong, nonatomic) NSArray *targetWebUrls;

@end

@implementation CTWebUrlManager

+ (instancetype)sharedInstance {
    
    static CTWebUrlManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^ {
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

+ (NSString *)parseServerHost:(NSString *)urlString {
    
    //
    // 網址: 檢查 Server
    // http://www.17life.com / https://www.17life.com
    //
    if ([urlString rangeOfString:ServerHostName].location != NSNotFound) {
        return ServerHostName;
    }
    else if ([urlString rangeOfString:SSLServerHostName].location != NSNotFound) {
        return SSLServerHostName;
    }
    return nil;
}

+ (NSString *)parseBid:(NSString *)urlString {
    
    NSString *lowerUrlString = [urlString lowercaseString];

    //
    // 檢查檔案類型: 如果是圖檔類型則不處理
    //
    NSArray *imageExtensions = @[@"png", @"jpg", @"gif"];
    for (NSString *imageExtension in imageExtensions) {
        if ([lowerUrlString hasSuffix:imageExtension]) {
            return nil;
        }
    }

    //
    // 網址: 檢查 Bid
    // http://www.17life.com/199/ceab30ff-da1b-4af7-8013-ecc26895f196
    //
    NSString *regularPattern = @"(\\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\\}{0,1})";
    NSString *bidString = [lowerUrlString stringMatchRegularExtensionWithPattern:regularPattern];
    return bidString;
}

+ (NSString *)parseChannelId:(NSString *)urlString {
    
    NSString *lowerUrlString = [urlString lowercaseString];
    
    //
    // 網址: 檢查頻道 ID
    // http://www.17life.com/477
    //
    if ([lowerUrlString hasSuffix:@"/475"]) {
        return @"475";
    }
    else if ([lowerUrlString hasSuffix:@"/476"]) {
        return @"476";
    }
    else if ([lowerUrlString hasSuffix:@"/477"]) {
        return @"477";
    }
    else if ([lowerUrlString hasSuffix:@"/490"]) {
        return @"490";
    }
    return nil;
}

+ (NSDictionary *)parseEvent:(NSString *)urlString {
    
    NSString *lowerUrlString = [urlString lowercaseString];
    
    //
    // 網址: 檢查策展 (Event)
    // http://www.17life.com/Event/BrandEvent.aspx?u=2016_2efe9037&rsrc=TBN_d1&type=2&eventId=3&cid=477
    //
    if ([lowerUrlString rangeOfString:@"/event/brandevent.aspx"].location != NSNotFound) {
        NSDictionary *paramDict = [lowerUrlString parseURLParams];
        if ([paramDict objectForKey:@"type"] && [paramDict objectForKey:@"eventid"]) {
            NSMutableDictionary *replyDict = [NSMutableDictionary dictionary];
            [replyDict setObject:[paramDict objectForKey:@"type"] forKey:@"type"];
            [replyDict setObject:[paramDict objectForKey:@"eventid"] forKey:@"eventId"];
            return (NSDictionary *)replyDict;
        }
    }
    return nil;
}

@end
