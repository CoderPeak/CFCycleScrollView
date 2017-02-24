//
//  CFDemoMainViewController.m
//  CFCycleScrollLabelView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "CFDemoMainViewController.h"
#import "CFMacro.h"
#import "UIView+CFFrame.h"
#import "CFCycleScrollLabelView.h"
#import "CFDemoViewController.h"

@interface CFDemoMainViewController ()

@end

@implementation CFDemoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"DEMO入口";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.cf_width, 50)];
    titleL.numberOfLines = 0;
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = CFRandomColor;
    titleL.text = @"交流QQ 545486205\n个人github网址:https://github.com/CoderPeak";
    [self.view addSubview:titleL];
    
    
    
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn0 setTitle:@"点此进入--> 一行循环轮播 >>>" forState:UIControlStateNormal];
    [btn0 addTarget:self action:@selector(toVC0) forControlEvents:UIControlEventTouchUpInside];
    btn0.frame = CGRectMake(0, 180, self.view.cf_width, 50);
    [btn0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn0.backgroundColor = CFRandomColor;
    [self.view addSubview:btn0];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"点此进入--> 二行循环轮播 >>>" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(toVC1) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(0, 280, self.view.cf_width, 50);
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.titleLabel.numberOfLines = 0;
    btn1.backgroundColor = CFRandomColor;
    [self.view addSubview:btn1];
    

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.titleLabel.numberOfLines = 0;
    [btn2 setTitle:@"点此进入--> 三行循环轮播 >>>" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(toVC2) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(0, 380, self.view.cf_width, 50);
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.backgroundColor = CFRandomColor;
    [self.view addSubview:btn2];

}

- (void)toVC0
{
    // 提供的数据源
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示一行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"一行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)toVC1
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示二行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"二行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)toVC2
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示三行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"三行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
