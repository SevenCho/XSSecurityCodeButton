//
//  UIColor+XSColor.h
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XSColor)

/**
 判断目标颜色是否是深色

 @param targetColor 目标颜色
 @return 是否是深色
 */
+ (BOOL)isDarkColor:(UIColor *)targetColor;

/**
 获取目标颜色中的高亮颜色

 @param targetColor 原始颜色
 @return 高亮颜色
 */
+ (UIColor *)highlightedOfColor:(UIColor *)targetColor;

/**
 获取目标颜色中的alpha

 @param targetColor 目标颜色
 @return alpha值
 */
+ (CGFloat)alphaOfColor:(UIColor *)targetColor;

@end

NS_ASSUME_NONNULL_END
