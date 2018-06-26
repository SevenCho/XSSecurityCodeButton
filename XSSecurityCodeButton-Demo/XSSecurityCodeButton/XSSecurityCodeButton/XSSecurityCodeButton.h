//
//  XSSecurityCodeButton.h
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XSSecurityCodeButton;

NS_ASSUME_NONNULL_BEGIN

#define XSColorCoral XSColor(255, 128, 135, 1)
#define XSColorDodgerBlue XSColor(30, 144, 255, 1)
#define XSColorDeepSkyBlue XSColor(0, 191, 255, 1)
#define XSColorTurquoise XSColor(64, 224, 208, 1)
#define XSColorWarmYellow XSColor(255, 239, 148, 1)
#define XSColorMediumPurple XSColor(147, 112, 219, 1)
#define XSColorSeaGreen XSColor(0, 160, 130, 1)

#define XSColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@protocol XSSecurityCodeButtonDeletate <NSObject>

@optional
- (void)didClickedSecurityCodeButton:(XSSecurityCodeButton *)SecurityCodeButton;
- (void)timingEndedOfSecurityCodeButton:(XSSecurityCodeButton *)SecurityCodeButton;

@end

@interface XSSecurityCodeButton : UIButton

@property (nonatomic, copy) NSString *normalTitle; /**< 正常状态文字 */
@property (nonatomic, copy) NSString *disabledTitle; /**< 禁用状态文字 */
@property (nonatomic, assign) NSTimeInterval timeDuration; /**< 定时器持续时间 （单位秒） */

@property (nonatomic, weak) id<XSSecurityCodeButtonDeletate> delegate;

/**
 通过颜色创建XSSecurityCodeButton

 @param buttonColor 主题颜色(用于控制)
 @return securityCodeButton
 */
- (instancetype)initWithColor:(UIColor *)buttonColor;

/** 停止定时器
 */
- (void)stopTiming;

@end

NS_ASSUME_NONNULL_END
