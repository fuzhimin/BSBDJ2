//
//  FZMADViewController.m
//  BSBDJ
//
//  Created by 付志敏 on 16/8/23.
//  Copyright © 2016年 付志敏. All rights reserved.
//

#import "FZMADViewController.h"
#import "FZMTarBarController.h"

#import <AFNetworking/AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJExtension/MJExtension.h>
#import "XMGADItem.h"

@interface FZMADViewController ()
/** 导航视图*/
@property (weak, nonatomic) IBOutlet UIImageView *LaunchImageView;
/** 广告视图容器*/
@property (weak, nonatomic) IBOutlet UIView *adContainView;
/** 时间跳转按钮*/
@property (weak, nonatomic) IBOutlet UIButton *skipButton;

@property (nonatomic, strong) XMGADItem *item;

/** 定时器*/
@property (nonatomic, weak) NSTimer *timer;
/** 广告视图*/
@property (nonatomic, weak) UIImageView *adView;

@end

@implementation FZMADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置启动图片
    [self setupLaunchImage];
    
    // 加载广告数据 => 拿到活时间 => 服务器 => 查看接口文档 1.判断接口对不对 2.解析数据(w_picurl,ori_curl:跳转到广告界面,w,h) => 请求数据(AFN)
    [self loadAdData];
    
    //设置定时器
    _timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

- (UIImageView *)adView
{
    if (!_adView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.adContainView addSubview:imageView];
        [self.adContainView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tap];
        
        imageView.userInteractionEnabled = YES;
        
        _adView = imageView;
    }
    
    return _adView;
}

- (void)timeChange
{
    //static 每次都访问i
    static int i = 3;
    
    if (i == 0) {
        [self skipAction:nil];
        
    }
    
    i--;
    
    // 设置跳转按钮文字
    [_skipButton setTitle:[NSString stringWithFormat:@"跳转 (%d)",i] forState:UIControlStateNormal];
}
// 点击广告界面调用
- (void)tap
{
    // 跳转到界面 => safari
    NSURL *url = [NSURL URLWithString:_item.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }
}

- (IBAction)skipAction:(id)sender {
    
    //1.销毁广告界面 进入主框架
    FZMTarBarController *tabBarVC= [[FZMTarBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
    //2.销毁定时器
    [self.timer invalidate];
}

#pragma mark - 加载广告数据
- (void)loadAdData
{
    // unacceptable content-type: text/html"  响应头
    
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = adUrl;
    
    // 3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
        [responseObject writeToFile:@"/Users/fuzhimin/Desktop/ad.plist" atomically:YES];
        // 请求数据 -> 解析数据(写成plist文件) -> 设计模型 -> 字典转模型 -> 展示数据
        // 获取字典
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        
        // 字典转模型
        _item = [XMGADItem mj_objectWithKeyValues:adDict];
        
        // 创建UIImageView展示图片 =>
        CGFloat h = XMGScreenW / _item.w * _item.h;
        
        self.adView.frame = CGRectMake(0, 0, XMGScreenW, h);
        // 加载广告网页
        [self.adView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

// 设置启动图片
- (void)setupLaunchImage
{
    if (iphone6P) { // 6p
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iphone6) { // 6
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iphone5) { // 5
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"];
        
    } else if (iphone4) { // 4
        
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    
}


@end
