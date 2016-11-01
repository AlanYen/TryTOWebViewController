//
//  ViewController.m
//  TryTOWebViewController
//
//  Created by AlanYen on 2016/10/28.
//  Copyright © 2016年 Alan-App. All rights reserved.
//

#import "ViewController.h"
#import "CTWebViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *openButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openButtonClicked:(UIButton *)sender {

    //NSURL *url = [NSURL URLWithString:@"http://www.17life.com/media/A0-64-787/ceab30ffEDMda1bEDM4af7EDM8013EDMecc26895f196.jpg"];
    NSURL *url = [NSURL URLWithString:@"http://www.17life.com"];
    
    CTWebViewController *vc = [[CTWebViewController alloc] initWithURL:url];
    vc.showDoneButton = YES;
    vc.showPageTitles = NO;
    vc.showActionButton = NO;
    vc.doneButtonTitle = @"關閉";
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

@end
