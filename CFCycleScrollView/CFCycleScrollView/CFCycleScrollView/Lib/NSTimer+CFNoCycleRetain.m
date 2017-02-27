//
//  NSTimer+CFNoCycleRetain.m
//  CFCycleScrollView
//
//  Created by Peak on 17/2/27.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "NSTimer+CFNoCycleRetain.h"



@implementation NSTimer (CFNoCycleRetain)

+ (void)cf_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)cf_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(cf_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)cf_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(cf_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

@end
