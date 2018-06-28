//
//  XSSecurityCodeButton.m
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import "XSSecurityCodeButton.h"
#import "UIColor+XSColor.h"
#import "UIImage+XSImage.h"
#import "NSString+XSTextSize.h"
#import "NSTimer+XSTimer.h"

#define XSSecurityCodeButtonFont [UIFont boldSystemFontOfSize:12]
#define XSSecurityCodeButtonTitleColorDark XSColor(50, 50, 50, 1)

@interface XSSecurityCodeButton () {
    struct {
        unsigned int didClickedSecurityCodeButton : 1;
        unsigned int timingEndedOfSecurityCodeButton : 1;
    } _delegateFlags;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval tempTimeDuration;

@end

static NSInteger const kSecurityCodeButtonCornerRadius = 5;
static NSTimeInterval const kSecurityCodeButtonTimeInterval = 1.0;
static NSInteger const kSecurityCodeButtonTimingDurationDefault = 60;

static NSString * const kNormalTitleDefault = @"发送验证码";
static NSString * const kDisabledTitleDefault = @"重新发送";

@implementation XSSecurityCodeButton

/**
 通过颜色创建XSSecurityCodeButton
 
 @param buttonColor 主题颜色
 @return securityCodeButton
 */
- (instancetype)initWithColor:(UIColor *)buttonColor
{
    return [self initWithColor:buttonColor normalTitle:kNormalTitleDefault disabledTitle:kDisabledTitleDefault timeDuration:kSecurityCodeButtonTimingDurationDefault];
}

/**
 创建XSSecurityCodeButton
 
 @param buttonColor 主题颜色
 @param normalTitle 正常状态显示文字
 @param disabledTitle 点击后显示文字
 @return XSSecurityCodeButton实例
 */
- (instancetype)initWithColor:(UIColor *)buttonColor normalTitle:(nullable NSString *)normalTitle disabledTitle:(nullable NSString *)disabledTitle
{
    return [self initWithColor:buttonColor normalTitle:normalTitle disabledTitle:disabledTitle timeDuration:kSecurityCodeButtonTimingDurationDefault];
}

/**
 创建XSSecurityCodeButton实例
 
 @param buttonColor 主题颜色
 @param normalTitle 正常状态显示文字
 @param disabledTitle 点击后显示文字
 @param timeDuration 倒计时时间
 @return XSSecurityCodeButton实例
 */
- (instancetype)initWithColor:(UIColor *)buttonColor normalTitle:(nullable NSString *)normalTitle disabledTitle:(nullable NSString *)disabledTitle timeDuration:(NSTimeInterval)timeDuration
{
    if (self = [super init]) {
        [self setTitleColor:XSSecurityCodeButtonTitleColorDark forState:UIControlStateNormal];
        [self.titleLabel setFont:XSSecurityCodeButtonFont];
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:kSecurityCodeButtonCornerRadius];
        UIColor *normalColor = buttonColor;
        UIColor *highlightedColor = [UIColor highlightedOfColor:normalColor];
        [self setBackgroundImage:[UIImage imageWithColor:normalColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:highlightedColor] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        self.color = buttonColor;
        self.normalTitle = normalTitle.length ? normalTitle : kNormalTitleDefault;
        self.disabledTitle = disabledTitle.length ? disabledTitle : kDisabledTitleDefault;
        self.timeDuration = timeDuration ?: kSecurityCodeButtonTimingDurationDefault;
        self.tempTimeDuration = timeDuration?: kSecurityCodeButtonTimingDurationDefault;;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置frame
    CGFloat margin = 10;
    CGFloat height = 30;
    CGSize maxSize = CGSizeMake(0, height);
    NSString *disabledTitle = [NSString stringWithFormat:@"%@(%ld)", self.disabledTitle, (NSInteger)self.timeDuration];
    CGFloat normalTitleW = [NSString sizeOfText:self.normalTitle maxSize:maxSize font:XSSecurityCodeButtonFont].width;
    CGFloat disabledTitleW = [NSString sizeOfText:disabledTitle maxSize:maxSize font:XSSecurityCodeButtonFont].width;
    CGFloat w = (normalTitleW >= disabledTitleW ? normalTitleW : disabledTitleW) + margin;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, w, height);
    // 标题文字及颜色
    [self setTitle:self.normalTitle forState:UIControlStateNormal];
    [self setTitleColor:[UIColor isDarkColor:self.color] ? [UIColor whiteColor] : [UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setDelegate:(id<XSSecurityCodeButtonDeletate>)delegate
{
    _delegate = delegate;
    _delegateFlags.didClickedSecurityCodeButton = [self.delegate respondsToSelector:@selector(didClickedSecurityCodeButton:)];
    _delegateFlags.timingEndedOfSecurityCodeButton = [self.delegate respondsToSelector:@selector(timingEndedOfSecurityCodeButton:)];
}

- (void)buttonClicked
{
    [self startTiming];
    if (_delegateFlags.didClickedSecurityCodeButton) {
        [self.delegate didClickedSecurityCodeButton:self];
    }
}

#pragma mark - Timer
- (void)startTiming
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kSecurityCodeButtonTimeInterval
                                                 repeats:YES
                                            handlerBlock:^() {
        [self timing];
    }];
    self.enabled = NO;
    self.tempTimeDuration = self.timeDuration;
}

- (void)stopTiming
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)timing
{
    if (self.tempTimeDuration == 0) {
        [self stopTiming];
        self.enabled = YES;
        self.tempTimeDuration = self.timeDuration;
        if (_delegateFlags.timingEndedOfSecurityCodeButton) {
            [self.delegate timingEndedOfSecurityCodeButton:self];
        }
    }
    [self setTitle:[NSString stringWithFormat:@"%@(%ld)", self.disabledTitle, (NSInteger)self.tempTimeDuration] forState:UIControlStateDisabled];
    self.tempTimeDuration--;
}

@end
