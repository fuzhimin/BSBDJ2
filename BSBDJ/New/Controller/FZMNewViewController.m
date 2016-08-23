//
//  FZMNewViewController.m
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import "FZMNewViewController.h"

@interface FZMNewViewController ()

@end

@implementation FZMNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self setupNavBar];
}

#pragma mark - 设置导航条
- (void)setupNavBar
{
    
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagClick)];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}

#pragma mark - 点击订阅标签调用
- (void)tagClick
{
    
}

@end
