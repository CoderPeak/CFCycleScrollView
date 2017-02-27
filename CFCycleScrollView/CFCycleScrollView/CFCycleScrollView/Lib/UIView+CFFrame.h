//
//  UIView+CFFrame.h
//  CFCycleScrollView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CFFrame)

@property (nonatomic, assign) CGFloat cf_x;
@property (nonatomic, assign) CGFloat cf_y;
@property (nonatomic, assign) CGFloat cf_centerX;
@property (nonatomic, assign) CGFloat cf_centerY;
@property (nonatomic, assign) CGFloat cf_width;
@property (nonatomic, assign) CGFloat cf_height;

@property (nonatomic, assign, readonly) CGFloat cf_maxX;
@property (nonatomic, assign, readonly) CGFloat cf_maxY;

@property (nonatomic, assign) CGPoint cf_origin;
@property (nonatomic, assign) CGSize cf_size;

+ (instancetype)viewWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
+ (instancetype)viewWithFrame:(CGRect)frame;
+ (instancetype)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;

@end
