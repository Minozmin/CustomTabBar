//
//  ThirdViewController.m
//  CustomTabBar
//
//  Created by haoshiqi on 16/4/28.
//  Copyright © 2016年 haoshiqi. All rights reserved.
//

#import "ThirdViewController.h"
#import "FiveViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"购物车";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (IBAction)onNext:(UIButton *)sender {
    FiveViewController *fiveVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"FiveViewController"];
    fiveVC.view.backgroundColor = [UIColor orangeColor];
    fiveVC.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:fiveVC animated:true];
}

@end
