//
//  SecondViewController.m
//  CustomTabBar
//
//  Created by haoshiqi on 16/4/28.
//  Copyright © 2016年 haoshiqi. All rights reserved.
//

#import "SecondViewController.h"
#import "FiveViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"分类";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - action

- (IBAction)onNext:(UIButton *)sender {
    FiveViewController *fiveVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"FiveViewController"];
    fiveVC.view.backgroundColor = [UIColor redColor];
    fiveVC.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:fiveVC animated:true];
}

@end
