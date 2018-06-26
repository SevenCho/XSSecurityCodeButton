//
//  UIImage+XSImage.h
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (XSImage)

/**
 根据颜色生成一张图片

 @param originColor 原始颜色
 @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)originColor;

@end

NS_ASSUME_NONNULL_END
