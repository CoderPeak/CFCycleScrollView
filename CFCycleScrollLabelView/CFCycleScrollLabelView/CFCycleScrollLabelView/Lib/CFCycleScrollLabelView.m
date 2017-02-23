//
//  CFCycleScrollLabelView.m
//  CFCycleScrollLabelView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "CFCycleScrollLabelView.h"
#import "CFCycleScrollLabelViewCell.h"
#import "CFMacro.h"
#import "UIView+CFFrame.h"

static NSString *cellIdentify = @"CFCycleScrollLabelViewCell";

@interface CFCycleScrollLabelView () <UICollectionViewDelegate, UICollectionViewDataSource>

/* 主要显示的view */
@property (nonatomic, strong) UICollectionView *mainView;
/* 布局 */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
/* 布局 */
@property (nonatomic, strong) NSTimer *timer;
/* 当前展示的位置 */
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

/* 展示的label行数 */
@property (nonatomic, assign) NSInteger showLabelCount;

/* 当前索引 */
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation CFCycleScrollLabelView

#pragma mark - 创建
- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray showLabelCount:(NSInteger)showLabelCount
{
    if (self = [super initWithFrame:frame]) {
        
        
        self.dataSourceArray = dataSourceArray;
        self.showLabelCount = showLabelCount;
        self.currentIndex = 0;
        
        [self setupMainView];
        
//        [self nextPage];
        
        // 添加定时器
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addTimer];
        });
        
    }
    return self;
}

+ (instancetype)cycleScrollLabelViewWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray showLabelCount:(NSInteger)showLabelCount
{
    
    CFCycleScrollLabelView *view = [[CFCycleScrollLabelView alloc] initWithFrame:frame dataSourceArray:dataSourceArray showLabelCount:showLabelCount];
    
    return view;
}

#pragma mark ---
/**
 *  添加定时器
 */
- (void)addTimer
{
    if (self.dataSourceArray && self.dataSourceArray.count!=0) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        self.timer = timer;
    }
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    // 停止定时器
    [self.timer invalidate];
    self.timer = nil;
}

/**
 *  重新定位位置
 */
- (NSIndexPath *)resetIndexPath
{
    if (self.currentIndex+1 == self.dataSourceArray.count) {
        self.currentIndex = -1;
    }
    self.currentIndexPath = [NSIndexPath indexPathForItem:self.currentIndex++ inSection:1];
    
   
    // 马上显示回 最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:self.currentIndexPath.item inSection:1];
    

    
    [self.mainView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
    return currentIndexPathReset;
}
/**
 *  下一页
 */
- (void)nextPage
{
    
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
    
    // 2.计算出下一个需要展示的位置
    NSInteger nextItem = currentIndexPathReset.item + 1;
   
    
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:1];
    
    // 3.通过动画滚动到下一个位置
    [self.mainView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}
#pragma mark - 主视图
- (void)setupMainView
{
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
  
    [mainView registerClass:[CFCycleScrollLabelViewCell class] forCellWithReuseIdentifier:cellIdentify];
    mainView.backgroundColor = [UIColor blueColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    mainView.dataSource = self;
    mainView.delegate = self;
    [self addSubview:mainView];
    
    _mainView = mainView;
}

/* 布局 */
- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0.1;
        NSInteger count = self.showLabelCount;
        CGFloat h = self.cf_height / count;
        _flowLayout.itemSize = CGSizeMake(CFScreenWidth, h);
       
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}




#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CFCycleScrollLabelViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    
    
    cell.titleLabel.text = self.dataSourceArray[indexPath.row];
    
    
    return cell;
}


#pragma mark - UIScrollViewDelegate
/**
 *  当用户即将开始拖拽的时候就调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

/**
 *  当用户停止拖拽的时候就调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
   
    [self addTimer];
    
}

- (void)dealloc
{
    [self removeTimer];
}

@end
