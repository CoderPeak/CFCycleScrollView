//
//  CFCycleScrollView.m
//  CFCycleScrollView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "CFCycleScrollView.h"
#import "CFCycleScrollViewCell.h"
#import "CFMacro.h"
#import "UIView+CFFrame.h"
#import "NSTimer+CFNoCycleRetain.h"

static NSString *cellIdentify = @"CFCycleScrollViewCell";

@interface CFCycleScrollView () <UICollectionViewDelegate, UICollectionViewDataSource>

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

@implementation CFCycleScrollView

#pragma mark - 创建
- (instancetype)initWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray showLabelCount:(NSInteger)showLabelCount
{
    if (self = [super initWithFrame:frame]) {
        
        self.dataSourceArray = dataSourceArray;
        self.showLabelCount = showLabelCount;
        self.currentIndex = 0;
        
        [self setupMainView];
        
        // 添加定时器
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addTimer];
        });
        
    }
    return self;
}

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame dataSourceArray:(NSArray *)dataSourceArray showLabelCount:(NSInteger)showLabelCount
{
    
    CFCycleScrollView *view = [[CFCycleScrollView alloc] initWithFrame:frame dataSourceArray:dataSourceArray showLabelCount:showLabelCount];
    
    return view;
}

#pragma mark ---
/**
 *  添加定时器
 */
- (void)addTimer
{
    if (self.dataSourceArray && self.dataSourceArray.count!=0) {
        // 循环引用 将导致内存泄漏
//        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval?:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//        self.timer = timer;
        
        // 解决循环引用导致的内存泄漏
        WeakSelf
        _timer = [NSTimer cf_scheduledTimerWithTimeInterval:self.timeInterval?:2 block:^(NSTimer * _Nonnull timer) {
            StrongSelf
            [strongSelf nextPage];
        } repeats:YES];
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
    NSIndexPath *currentIndexPathReset = nil;
    if (!self.scrollDirection || self.scrollDirection==UICollectionViewScrollDirectionVertical) {
        // 竖直方向
        if (self.currentIndex+1 == self.dataSourceArray.count) {
            self.currentIndex = -1;
        }
        self.currentIndexPath = [NSIndexPath indexPathForItem:self.currentIndex++ inSection:1];
        // 马上显示回 最中间那组的数据
        currentIndexPathReset = [NSIndexPath indexPathForItem:self.currentIndexPath.item inSection:1];
        [self.mainView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
    } else {
        // 水平方向
        self.currentIndexPath = [self.mainView indexPathsForVisibleItems].firstObject;
        // 马上显示回 最中间那组的数据
        currentIndexPathReset = [NSIndexPath indexPathForItem:self.currentIndexPath.item inSection:1];

       
        [self.mainView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    
    

    
    
    return currentIndexPathReset;
}
/**
 *  下一页
 */
- (void)nextPage
{
 
    NSIndexPath *nextIndexPath = nil;
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
//    NSLog(@"currentIndexPathReset.item--%zd", currentIndexPathReset.item);
    if (!self.scrollDirection || self.scrollDirection==UICollectionViewScrollDirectionVertical) {
        // 竖直方向
        
        // 下一个需要展示的位置
        NSInteger nextItem = currentIndexPathReset.item + 1;
        nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:1];
        // 通过动画滚动到下一个位置
        [self.mainView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    } else {
        // 水平方向
      
        // 下一个需要展示的位置
        NSInteger nextItem = currentIndexPathReset.item + self.showLabelCount;
        
        NSInteger nextSection = currentIndexPathReset.section;
        // 水平方向滚动时  最后没法除尽(即最后一组数据缺失  不展示为一组 跳过最后一组滚动 )
        // 最好是对数据源进行截取操作 使其 整除
//        if (nextItem >= self.dataSourceArray.count-self.showLabelCount) {
        // 水平方向滚动时  最后没法除尽(即最后一组数据缺失  也展示为一组 滚动)
        if (nextItem >= self.dataSourceArray.count) {
            nextItem = 0;
            nextSection++;
        }
        nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
        // 通过动画滚动到下一个位置
        [self.mainView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    
}
#pragma mark - 主视图
- (void)setupMainView
{
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
  
    [mainView registerClass:[CFCycleScrollViewCell class] forCellWithReuseIdentifier:cellIdentify];
    mainView.backgroundColor = [UIColor whiteColor];
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
       
        
    }
    return _flowLayout;
}

#pragma mark - setter
- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
    _scrollDirection = scrollDirection;
    
    if (!self.scrollDirection || self.scrollDirection==UICollectionViewScrollDirectionVertical) {
        // 竖直方向
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    } else {
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CFCycleScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    
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
    NSLog(@"%@------dealloc", [self class]);
}

@end
