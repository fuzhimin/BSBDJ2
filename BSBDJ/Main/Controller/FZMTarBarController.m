//
//  FZMTarBarController.m
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import "FZMTarBarController.h"
#import "FZMMeViewController.h"
#import "FZMNewViewController.h"
//#import "FZMPublishViewController.h"
#import "FZMEssenceViewController.h"
#import "FZMFriendTrendViewController.h"
#import "UIImage+FZMExtession.h"
#import "FZMTarBar.h"

@interface FZMTarBarController ()

@end

@implementation FZMTarBarController


//问题:
/** 
 1.选中的图片被渲染.用代码解决
 2.标题颜色 
 3.标题的字体设置 富文本 normal情况下设置字体
 4.发布按钮显示不出来 
 
     图片尺寸太大 系统帮我们显示 但是图片的位置不对,高亮状态也不对.
     解决:图片大小修改不了,效果:让发布图片居中
     这里我们需要自定义tarBar
 
 */

//整个程序只调用一次
+ (void)load
{
    //获取整个程序的tarbar
    //这里用appearance会直接影响到手机系统内部的导航栏 tabr标签栏
    //UITabBarItem *item = [UITabBarItem appearance];
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    //设置标题显示的颜色 这里我们用富文本来设置 字体颜色 大小 阴影 空心 图文混排
    //创建一个文本属性字典 选择状态
    NSMutableDictionary *selectedAttribute = [NSMutableDictionary dictionary];
    selectedAttribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:selectedAttribute forState:UIControlStateSelected];
    
    //创建一个文本属性字典 正常状态 才能设置字体大小
    NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self setupAllChildController];
    //设置tarBar上的内容
    [self setupAllTitleButton];
    //自定义TarBar
    [self setTarBar];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%@",self.tabBar.subviews);
}

- (void)setTarBar{
    
    FZMTarBar *tarBarVC = [[FZMTarBar alloc] init];
    [self setValue:tarBarVC forKey:@"tabBar"];
}

- (void)setupAllChildController
{
    //精华
    FZMEssenceViewController *essenceVC = [[FZMEssenceViewController alloc] init];
    UINavigationController *essenceNav = [[UINavigationController alloc] initWithRootViewController:essenceVC];
    [self addChildViewController:essenceNav];
    
    //新帖
    FZMNewViewController *newVC = [[FZMNewViewController alloc] init];
    UINavigationController *newNav = [[UINavigationController alloc] initWithRootViewController:newVC];
    [self addChildViewController:newNav];
    
//    //发布
//    FZMPublishViewController *publishVC = [[FZMPublishViewController alloc] init];
//    UINavigationController *publishNav = [[UINavigationController alloc] initWithRootViewController:publishVC];
//    [self addChildViewController:publishNav];
    
    //关注
    FZMFriendTrendViewController *friendTrendVC = [[FZMFriendTrendViewController alloc] init];
    UINavigationController *friendTrendNav = [[UINavigationController alloc] initWithRootViewController:friendTrendVC];
    [self addChildViewController:friendTrendNav];
    
    //我
    FZMMeViewController *meVC = [[FZMMeViewController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meVC];
    [self addChildViewController:meNav];
}

- (void)setupAllTitleButton
{
    //精华
    UINavigationController *essenceNav = self.childViewControllers[0];
    essenceNav.tabBarItem.title = @"精华";
    essenceNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    essenceNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    //新帖
    UINavigationController *newNav = self.childViewControllers[1];
    newNav.tabBarItem.title = @"新帖";
    newNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    newNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
//    //发布
//    UINavigationController *publishNav = self.childViewControllers[2];
//    publishNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_icon"];
//    publishNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_publish_click_icon"];
    
    //关注
    UINavigationController *friendTrendNav = self.childViewControllers[2];
    friendTrendNav.tabBarItem.title = @"关注";
    friendTrendNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendTrendNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    //我
    UINavigationController *meNav = self.childViewControllers[3];
    meNav.tabBarItem.title = @"我";
    meNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    meNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
}
@end
