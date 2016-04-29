//
//  AppDelegate.m
//  CustomTabBar
//
//  Created by haoshiqi on 16/4/28.
//  Copyright © 2016年 haoshiqi. All rights reserved.
//

#import "AppDelegate.h"
#import "HMSettingFarmeButton.h"
#import "UIView+Frame.h"

static NSString *const kAppDelegateCarBadgeKey = @"kAppDelegateCarBadgeKey";

@interface AppDelegate () <UITabBarControllerDelegate>

@property (nonatomic, strong) UILabel *labelBageValue;
@property (nonatomic, strong) UIView *tabbarView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self customTabbarView];
    return YES;
}

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *) [UIApplication sharedApplication].delegate;
}

- (void)customTabbarView
{
    UITabBarController *taBarController = self.tabBarController;
    
    self.tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight(taBarController.tabBar.frame))];
    self.tabbarView.backgroundColor = [UIColor clearColor];
    self.tabbarView.userInteractionEnabled = false;
    [taBarController.tabBar addSubview:self.tabbarView];
    
    NSArray *titles = @[@"首页", @"分类", @"购物车", @"我的"];
    NSArray *imageNormal = @[@"ic_main_home", @"ic_main_category", @"ic_main_shopcart" , @"ic_main_mine"];
    NSArray *imageSelected = @[@"ic_main_home_selected", @"ic_main_category_selected", @"ic_main_shopcart_selected", @"ic_main_mine_selected"];
    for (int i = 0; i < 4; i++) {
        HMSettingFarmeButton *button = [HMSettingFarmeButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * CGRectGetWidth([[UIScreen mainScreen] bounds])/4, 0, CGRectGetWidth([[UIScreen mainScreen] bounds])/4, CGRectGetHeight(taBarController.tabBar.frame));
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.tag = i + 7777;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0x91 / 255. green:0x4E / 255. blue:0x07 / 255. alpha:1] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageNormal[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageSelected[i]] forState:UIControlStateSelected];
        button.userInteractionEnabled = false;
        
        if (i == 0) {
            button.selected = true;
        }
        
        [self.tabbarView addSubview:button];
    }
}

- (UITabBarController *)tabBarController
{
    UITabBarController *tabBarController = (id)self.window.rootViewController;
    tabBarController.delegate = self;
    if ([tabBarController isKindOfClass:[UITabBarController class]]) {
        return tabBarController;
    }
    
    return nil;
}

- (UILabel *)labelBageValue
{
    static UILabel *label = nil;
    static dispatch_once_t onec;
    dispatch_once(&onec, ^{
        HMSettingFarmeButton *button = [self.tabbarView viewWithTag:2 + 7777];
        label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(button.frame) / 2 + 5, 2, 16, 16)];
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = 8;
        label.layer.masksToBounds = YES;
        [button addSubview:label];
    });
    return label;
}

#pragma mark - 购物车相关

//购物车数量
- (void)setCartBadgeCount:(int)cartBadgeCount
{
    [[NSUserDefaults standardUserDefaults] setObject:@(cartBadgeCount) forKey:kAppDelegateCarBadgeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //系统的
    //    if (cartBadgeCount > 0) {
    //        [self cartBarItem].badgeValue = cartBadgeCount >= 100 ? @"99+" : [NSString stringWithFormat:@"%d",cartBadgeCount];
    //    }else {
    //        [self cartBarItem].badgeValue = nil;
    //    }
    
    if (cartBadgeCount >= 100) {
        self.labelBageValue.text = @"99+";
    }else self.labelBageValue.text = @(cartBadgeCount).description;
    
    CGPoint center = self.labelBageValue.center;
    CGSize size = [self.labelBageValue sizeThatFits:CGSizeMake(40, 16)];
    self.labelBageValue.size = CGSizeMake(MAX(10, size.width) + 6, 16);
    self.labelBageValue.center = center;
    self.labelBageValue.hidden = cartBadgeCount < 1;
}

- (int)cartBadgeCount
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kAppDelegateCarBadgeKey] intValue];
}

#pragma mark - tabBarController delegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    int index = (int)[tabBarController.viewControllers indexOfObject:viewController];
    
    /* 设置label的正常和选中颜色 */
    
    for (int i = 0; i < 4; i++) {
        HMSettingFarmeButton *button = [self.tabbarView viewWithTag:i + 7777];
        if (index == button.tag - 7777) {
            button.selected = true;
        }else {
            button.selected = false;
        }
    }
    
    return true;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
