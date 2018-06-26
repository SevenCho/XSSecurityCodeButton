//
//  UIColor+XSColor.m
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import "UIColor+XSColor.h"

@implementation UIColor (XSColor)

/**
 判断目标颜色是否是深色
 
 @param targetColor 目标颜色
 @return 是否是深色
 */
+ (BOOL)isDarkColor:(UIColor *)targetColor
{
    const CGFloat *components = CGColorGetComponents(targetColor.CGColor);
    double g = components[0] * 255 * 0.299 + components[1] * 255 * 0.578 + components[2] * 255 * 0.114;
    if (g < 192) {
        return YES;
    }
    return NO;
}

/**
 获取目标颜色中的高亮颜色
 
 @param targetColor 原始颜色
 @return 高亮颜色
 */
+ (UIColor *)highlightedOfColor:(UIColor *)targetColor
{
    const CGFloat *components = CGColorGetComponents(targetColor.CGColor);
    return [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:0.6];
}

/**
 获取目标颜色中的alpha
 
 @param targetColor 目标颜色
 @return alpha值
 */
+ (CGFloat)alphaOfColor:(UIColor *)targetColor
{
    CGFloat r, g, b, a, w, h, s, l;
    BOOL compatible = [targetColor getWhite:&w alpha:&a];
    if (compatible) {
        return a;
    }
    compatible = [targetColor getRed:&r green:&g blue:&b alpha:&a]; // RGB颜色空间
    if (compatible) {
        return a;
    }
    [targetColor getHue:&h saturation:&s brightness:&l alpha:&a]; // HSB 颜色空间
    return a;
}

@end
