//
//  ForthViewController.m
//  CustomTabBar
//
//  Created by haoshiqi on 16/4/28.
//  Copyright © 2016年 haoshiqi. All rights reserved.
//

#import "ForthViewController.h"
#import "FiveViewController.h"

@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我的";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (IBAction)onNext:(UIButton *)sender {
    FiveViewController *fiveVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"FiveViewController"];
    fiveVC.view.backgroundColor = [UIColor blueColor];
    fiveVC.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:fiveVC animated:true];
}

@end
