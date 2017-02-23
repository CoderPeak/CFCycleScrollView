//
//  CFDemoViewController.m
//  CFCycleScrollLabelView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "CFDemoViewController.h"
#import "CFCycleScrollLabelView.h"
#import "CFMacro.h"

@interface CFDemoViewController ()

@end

@implementation CFDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CFCycleScrollLabelView *cycleScrollLabelView = nil;
    if ([self.title containsString:@"一"]) {
        cycleScrollLabelView = [CFCycleScrollLabelView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66) dataSourceArray:self.dataSource showLabelCount:1];
    } else if ([self.title containsString:@"二"]) {
        cycleScrollLabelView = [CFCycleScrollLabelView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66*2) dataSourceArray:self.dataSource showLabelCount:2];
    } else if ([self.title containsString:@"三"]) {
        cycleScrollLabelView = [CFCycleScrollLabelView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66*3) dataSourceArray:self.dataSource showLabelCount:3];
    }
    [self.view addSubview:cycleScrollLabelView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
