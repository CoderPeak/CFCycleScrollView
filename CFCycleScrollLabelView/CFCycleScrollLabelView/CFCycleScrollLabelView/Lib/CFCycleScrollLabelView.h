//
//  CFCycleScrollLabelView.h
//  CFCycleScrollLabelView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFCycleScrollLabelView : UIView

/* 数据源数组 */
@property (nonatomic, strong) NSArray *dataSourceArray;


// showLabelCount
+ (instancetype)cycleScrollLabelViewWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray showLabelCount:(NSInteger)showLabelCount;

@end
