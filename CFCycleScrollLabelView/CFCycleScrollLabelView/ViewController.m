//
//  ViewController.m
//  CFCycleScrollLabelView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "ViewController.h"
#import "CFCycleScrollLabelView.h"
#import "CFMacro.h"
#import "UIView+CFFrame.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sutupSubViews];
    
}

#pragma mark 布局子控件
- (void)sutupSubViews
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示一行 展示demo数据---%zd", i]];
    }
    CFCycleScrollLabelView *cycleScrollLabelView0 = [CFCycleScrollLabelView cycleScrollLabelViewWithFrame:CGRectMake(0, 30, CFScreenWidth, 44) dataSourceArray:dataSource showLabelCount:1];
    [self.view addSubview:cycleScrollLabelView0];
    
    CFCycleScrollLabelView *cycleScrollLabelView1 = [CFCycleScrollLabelView cycleScrollLabelViewWithFrame:CGRectMake(0, cycleScrollLabelView0.cf_maxY+20, CFScreenWidth, 44*2) dataSourceArray:dataSource showLabelCount:2];
    [self.view addSubview:cycleScrollLabelView1];
    
    CFCycleScrollLabelView *cycleScrollLabelView2 = [CFCycleScrollLabelView cycleScrollLabelViewWithFrame:CGRectMake(0, cycleScrollLabelView1.cf_maxY+20, CFScreenWidth, 44*3) dataSourceArray:dataSource showLabelCount:3];
    [self.view addSubview:cycleScrollLabelView2];
    
        // QQ交流
    UILabel *qqLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cycleScrollLabelView2.cf_maxY + 60, CFScreenWidth, 50)];
    qqLabel.text = @"交流QQ 545486205";
    qqLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:qqLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
