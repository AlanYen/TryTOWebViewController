//
//  CTWebViewController.m
//  TryTOWebViewController
//
//  Created by AlanYen on 2016/10/28.
//  Copyright © 2016年 Alan-App. All rights reserved.
//

#import "CTWebViewController.h"
#import "NSString+RegularPatternCompare.h"
#import "CTWebUrlManager.h"

@interface CTWebViewController ()

@end

@implementation CTWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHandler];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupHandler {
    
    // __weak typeof(self) weakSelf = self;

    self.shouldStartLoadRequestHandler = ^BOOL (NSURLRequest *request, UIWebViewNavigationType navigationType) {
        
        NSString *urlString = [request.URL.absoluteString copy];
        if ([CTWebUrlManager parseServerHost:urlString]) {
            NSString *bidString = [CTWebUrlManager parseBid:urlString];
            NSString *channelIdString = [CTWebUrlManager parseChannelId:urlString];
            NSDictionary *eventInfo = [CTWebUrlManager parseEvent:urlString];
            NSLog(@"\n網址: %@\n[%@]\n[%@]\n[%@]\n", request.URL.absoluteString, bidString, channelIdString, [eventInfo description]);
        }
        return YES;
    };
}



@end
