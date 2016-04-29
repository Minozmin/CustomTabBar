//
//  FirstViewController.m
//  CustomTabBar
//
//  Created by haoshiqi on 16/4/28.
//  Copyright © 2016年 haoshiqi. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonSub;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"首页";
    
    [self checkStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkStatus
{
    self.buttonSub.enabled = [AppDelegate sharedAppDelegate].cartBadgeCount > 0;
}

#pragma mark - action

- (IBAction)onAdd:(UIButton *)sender {
    [AppDelegate sharedAppDelegate].cartBadgeCount++;
    [self checkStatus];
}

- (IBAction)onSub:(UIButton *)sender {
    [AppDelegate sharedAppDelegate].cartBadgeCount--;
    [self checkStatus];
}

@end
