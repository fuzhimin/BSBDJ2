//
//  UIImage+FZMExtession.h
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FZMExtession)
//快速生成一个没有渲染的图片
+ (UIImage *)imageOriginalWithName:(NSString *)imageName;

// 在周边加一个边框为1的透明像素
- (UIImage *)imageAntialias;
@end
