//
//  UIBarButtonItem+FZMExtension.h
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FZMExtension)

/** 添加导航栏按钮 高亮图片*/
+ (UIBarButtonItem *)itemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

/** 添加导航栏按钮 选择图片*/
+ (UIBarButtonItem *)backItemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;

/** 添加导航栏返回按钮 图片 标题*/
+ (UIBarButtonItem *)itemWithimage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

@end
