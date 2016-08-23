//
//  FZMTarBar.m
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import "FZMTarBar.h"

@interface FZMTarBar()

/** 发布按钮*/
@property (nonatomic, weak) UIButton *publishButton;

@end

@implementation FZMTarBar

- (UIButton *)publishButton
{
    if (!_publishButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        [self addSubview:btn];
        
        _publishButton = btn;
        
    }
    
    return _publishButton;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //跳转tarBarButton的位置 普通bartem的位置
    NSUInteger count = self.items.count;
    CGFloat btnW = self.bounds.size.width / (count + 1);
    CGFloat btnH = self.bounds.size.height;
    CGFloat x = 0;
    int i = 0;
    
    for (UIView *tarBarButton in self.subviews) {
        
        if ([tarBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (i == 2) {
                i += 1;
            }
            
            x = i * btnW;
            
            tarBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            
            i++;
        }
    }
    
    //发布按钮位置跳整
    self.publishButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
}
@end
