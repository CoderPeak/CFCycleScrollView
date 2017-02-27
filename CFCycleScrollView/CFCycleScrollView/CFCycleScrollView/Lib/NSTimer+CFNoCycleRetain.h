//
//  NSTimer+CFNoCycleRetain.h
//  CFCycleScrollView
//
//  Created by Peak on 17/2/27.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define WeakSelf  __weak typeof(self) weakSelf = self;
#define StrongSelf  __strong typeof(self) strongSelf = weakSelf;

@interface NSTimer (CFNoCycleRetain)

+ (NSTimer *)cf_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

+ (NSTimer *)cf_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
