//
//  NSString+XSTextSize.m
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import "NSString+XSTextSize.h"

@implementation NSString (XSTextSize)

/**
 计算文本尺寸
 
 @param text 目标文本
 @param maxSize 最大的尺寸范围
 @param font 文本字体
 @return 计算出的尺寸
 */
+ (CGSize)sizeOfText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
