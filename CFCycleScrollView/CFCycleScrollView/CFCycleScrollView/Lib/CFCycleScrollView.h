//
//  CFCycleScrollView.h
//  CFCycleScrollView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFCycleScrollView : UIView

/* 数据源数组 */
@property (nonatomic, strong) NSArray *dataSourceArray;

/* 轮播方向 默认-竖直方向 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

// showLabelCount
+ (instancetype)cycleScrollLabelViewWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray showLabelCount:(NSInteger)showLabelCount;

@end
