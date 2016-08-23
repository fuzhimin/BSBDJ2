//
//  UIColor+FZMExtension.h
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FZMExtension)

/**从十六进制字符串获取颜色 默认alpha为1*/
+ (UIColor *)colorWithHexString:(NSString *)color;

/** 从十六进制字符串获取颜色*/
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
