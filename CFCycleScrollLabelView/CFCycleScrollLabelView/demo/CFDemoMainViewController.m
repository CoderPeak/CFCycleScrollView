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
    
    
    
    UIButton *btn00 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn00 setTitle:@"点此进入--> 竖直-一行循环轮播 >>>" forState:UIControlStateNormal];
    [btn00 addTarget:self action:@selector(toVC00) forControlEvents:UIControlEventTouchUpInside];
    btn00.frame = CGRectMake(0, 180, self.view.cf_width, 50);
    [btn00 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn00.backgroundColor = CFRandomColor;
    [self.view addSubview:btn00];
    UIButton *btn01 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn01 setTitle:@"点此进入--> 水平-一行循环轮播 >>>" forState:UIControlStateNormal];
    [btn01 addTarget:self action:@selector(toVC01) forControlEvents:UIControlEventTouchUpInside];
    btn01.frame = CGRectMake(0, 230, self.view.cf_width, 50);
    [btn01 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn01.backgroundColor = CFRandomColor;
    [self.view addSubview:btn01];
    
    
    UIButton *btn10 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn10 setTitle:@"点此进入--> 竖直-二行循环轮播 >>>" forState:UIControlStateNormal];
    [btn10 addTarget:self action:@selector(toVC10) forControlEvents:UIControlEventTouchUpInside];
    btn10.frame = CGRectMake(0, 300, self.view.cf_width, 50);
    [btn10 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn10.titleLabel.numberOfLines = 0;
    btn10.backgroundColor = CFRandomColor;
    [self.view addSubview:btn10];
    
    UIButton *btn11 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn11 setTitle:@"点此进入--> 水平-二行循环轮播 >>>" forState:UIControlStateNormal];
    [btn11 addTarget:self action:@selector(toVC11) forControlEvents:UIControlEventTouchUpInside];
    btn11.frame = CGRectMake(0, 350, self.view.cf_width, 50);
    [btn11 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn11.titleLabel.numberOfLines = 0;
    btn11.backgroundColor = CFRandomColor;
    [self.view addSubview:btn11];
    
    
    UIButton *btn20 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn20.titleLabel.numberOfLines = 0;
    [btn20 setTitle:@"点此进入--> 竖直-三行循环轮播 >>>" forState:UIControlStateNormal];
    [btn20 addTarget:self action:@selector(toVC20) forControlEvents:UIControlEventTouchUpInside];
    btn20.frame = CGRectMake(0, 420, self.view.cf_width, 50);
    [btn20 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn20.backgroundColor = CFRandomColor;
    [self.view addSubview:btn20];
    
    UIButton *btn21 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn21.titleLabel.numberOfLines = 0;
    [btn21 setTitle:@"点此进入--> 水平-三行循环轮播 >>>" forState:UIControlStateNormal];
    [btn21 addTarget:self action:@selector(toVC21) forControlEvents:UIControlEventTouchUpInside];
    btn21.frame = CGRectMake(0, 470, self.view.cf_width, 50);
    [btn21 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn21.backgroundColor = CFRandomColor;
    [self.view addSubview:btn21];

}


- (void)toVC00
{
    // 提供的数据源
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示一行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"竖直-一行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toVC01
{
    // 提供的数据源
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示一行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"水平-一行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toVC10
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示二行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"竖直-二行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toVC11
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示二行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"水平-二行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)toVC20
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示三行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"竖直-三行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toVC21
{
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示三行 展示demo数据---%zd", i]];
    }
    CFDemoViewController *vc = [[CFDemoViewController alloc] init];
    vc.title = @"水平-三行循环轮播";
    vc.dataSource = dataSource;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
