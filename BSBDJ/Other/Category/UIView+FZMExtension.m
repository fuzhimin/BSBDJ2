//
//  UIView+FZMExtension.m
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import "UIView+FZMExtension.h"


@implementation UIView (FZMExtension)

- (void)setFzm_height:(CGFloat)fzm_height
{
    CGRect rect = self.frame;
    rect.size.height = fzm_height;
    self.frame = rect;
}

- (CGFloat)fzm_height
{
    return self.frame.size.height;
}

- (CGFloat)fzm_width
{
    return self.frame.size.width;
}
- (void)setFzm_width:(CGFloat)fzm_width
{
    CGRect rect = self.frame;
    rect.size.width = fzm_width;
    self.frame = rect;
}

- (CGFloat)fzm_x
{
    return self.frame.origin.x;
    
}

- (void)setFzm_x:(CGFloat)fzm_x
{
    CGRect rect = self.frame;
    rect.origin.x = fzm_x;
    self.frame = rect;
}

- (void)setFzm_y:(CGFloat)fzm_y
{
    CGRect rect = self.frame;
    rect.origin.y = fzm_y;
    self.frame = rect;
}

- (CGFloat)fzm_y
{
    
    return self.frame.origin.y;
}


@end
