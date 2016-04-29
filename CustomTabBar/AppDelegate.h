//
//  AppDelegate.h
//  CustomTabBar
//
//  Created by haoshiqi on 16/4/28.
//  Copyright © 2016年 haoshiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (AppDelegate *)sharedAppDelegate;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) int cartBadgeCount;

@end

