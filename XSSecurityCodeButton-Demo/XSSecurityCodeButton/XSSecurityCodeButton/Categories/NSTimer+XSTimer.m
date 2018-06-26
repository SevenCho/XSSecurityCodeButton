//
//  NSTimer+XSTimer.m
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import "NSTimer+XSTimer.h"

@implementation NSTimer (XSTimer)

/**
 初始化一个定时器
 
 @param interval 定时器间隔
 @param repeats 是否重复
 @param handlerBlock 回调
 @return 定时器实例
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    repeats:(BOOL)repeats
                               handlerBlock:(void (^)(void))handlerBlock
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(handlerBlockInvoked:)
                                       userInfo:[handlerBlock copy]
                                        repeats:YES];
}

+ (void)handlerBlockInvoked:(NSTimer *)timer
{
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
