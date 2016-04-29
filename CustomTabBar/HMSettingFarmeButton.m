//
//  HMSettingFarmeButton.m
//  Haoshiqi
//
//  Created by haoshiqi on 15/11/10.
//  Copyright © 2015年 haoshiqi. All rights reserved.
//

#import "HMSettingFarmeButton.h"

@implementation HMSettingFarmeButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super imageRectForContentRect:contentRect];
    rect.origin.x = (CGRectGetWidth(contentRect)  - CGRectGetWidth(rect)) / 2.0;
    rect.origin.y = CGRectGetHeight(contentRect) * 0.12;
    
    return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super titleRectForContentRect:contentRect];
    rect.origin.x =  (CGRectGetWidth(contentRect)  - CGRectGetWidth(rect)) / 2.0;
    rect.origin.y = CGRectGetMaxY([self imageRectForContentRect:contentRect]) + 5;
    rect.size.width = CGRectGetWidth(contentRect);
    
    return rect;
}


@end
