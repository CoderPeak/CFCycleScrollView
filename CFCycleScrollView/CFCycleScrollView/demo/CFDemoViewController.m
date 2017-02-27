//
//  CFDemoViewController.m
//  CFCycleScrollView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "CFDemoViewController.h"
#import "CFCycleScrollView.h"
#import "CFMacro.h"

@interface CFDemoViewController ()

@end

@implementation CFDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CFCycleScrollView *cycleScrollLabelView = nil;
    if ([self.title containsString:@"一"] ) {
        if ([self.title containsString:@"竖"]) {
            
            cycleScrollLabelView = [CFCycleScrollView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66) dataSourceArray:self.dataSource showLabelCount:1];
        } else {
            cycleScrollLabelView = [CFCycleScrollView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66) dataSourceArray:self.dataSource showLabelCount:1];
            // 水平方向
            cycleScrollLabelView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
    } else if ([self.title containsString:@"二"]){
        if ([self.title containsString:@"竖"]) {
            cycleScrollLabelView = [CFCycleScrollView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66*2) dataSourceArray:self.dataSource showLabelCount:2];
        } else {
            cycleScrollLabelView = [CFCycleScrollView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66*2) dataSourceArray:self.dataSource showLabelCount:2];
            // 水平方向
            cycleScrollLabelView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
    } else if ([self.title containsString:@"三"]) {
        if ([self.title containsString:@"竖"]) {
            cycleScrollLabelView = [CFCycleScrollView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66*3) dataSourceArray:self.dataSource showLabelCount:3];
        } else {
            cycleScrollLabelView = [CFCycleScrollView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66*3) dataSourceArray:self.dataSource showLabelCount:3];
            // 水平方向
            cycleScrollLabelView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
    }
    
    
    
    [self.view addSubview:cycleScrollLabelView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
