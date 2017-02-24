# CFCycleScrollLabelView (交流QQ 545486205)
### 为数不多的, 简单好用的, 走马灯效果, 自动循环(水平/竖直方向)逐条无限循环滚动的label

##### 暂未支持pod导入 - 仅为最简单样式label轮播
##### 因为此需求通常定制性较强, 为了迎合不同公司的不同需求, 建议拖入项目中使用

### demo展示 - 由于网络原因, 可能gif效果图会展示的比较卡, 可以下载运行查看demo---简单使用代码

### 使用
- 创建使用仅需几行代码即可

```
    // 提供的数据源 - 通常为网络请求到的数据
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"显示一行 展示demo数据---%zd", i]];
    }
   // 创建  需提供 frame/数据源/展示的行数
   CFCycleScrollLabelView *cycleScrollLabelView = [CFCycleScrollLabelView cycleScrollLabelViewWithFrame:CGRectMake(0, 230, CFScreenWidth, 66) dataSourceArray:self.dataSource showLabelCount:1];
    // 水平方向 (不设置 默认竖直方向滚动)
   cycleScrollLabelView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
   [self.view addSubview:cycleScrollLabelView];
        
```

### 效果图集

![](/竖直-一行循环轮播.gif) 

![](/竖直-二行循环轮播.gif) 

![](/竖直-三行循环轮播.gif) 

![](/水平-一行循环轮播.gif) 

![](/水平-二行循环轮播.gif) 

![](/水平-三行循环轮播.gif) 
