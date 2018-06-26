//
//  UIImage+XSImage.m
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import "UIImage+XSImage.h"

@implementation UIImage (XSImage)

/**
 根据颜色生成一张图片
 
 @param originColor 原始颜色
 @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)originColor
{
    CGRect rect = CGRectMake(0, 0, 5, 5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, originColor.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
