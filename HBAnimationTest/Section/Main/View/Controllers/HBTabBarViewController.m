//
//  HBTabBarViewController.m
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBTabBarViewController.h"
#import "HBNavViewController.h"
@interface HBTabBarViewController ()

@end

@implementation HBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
}

//1.添加子控制器
- (void)addChildViewControllers
{

    UINavigationController *homeNav = [self creatChildControlWithVCName:@"HBHomeViewController" withTitle:@"首页" withImageName:@"tab_buddy_nor"];

    
    UINavigationController *messageNav = [self creatChildControlWithVCName:@"HBMessageViewController" withTitle:@"消息" withImageName:@"tab_recent_nor"];
    
    
    UINavigationController *shopNav = [self creatChildControlWithVCName:@"HBShopViewController" withTitle:@"商店" withImageName:@"tab_qworld_nor"];
    
    UINavigationController *mineNav = [self creatChildControlWithVCName:@"HBMineViewController" withTitle:@"我的" withImageName:@"tab_me_nor"];
    
    
    
    //4.添加
    self.viewControllers = @[homeNav,messageNav,shopNav,mineNav];
    
}

#pragma mark - 创建子控制器的方法
- (UINavigationController *)creatChildControlWithVCName:(NSString *)vcName withTitle:(NSString *)title withImageName:(NSString *)imageName
{
    
    //1.创建子控制器
    
    //1.根据字符转换成 类 class
    Class class = NSClassFromString(vcName);
    
    //2.根据类 生成 控制器
    UIViewController *targetVc = [[class alloc]init];
    
    //断言 抛出异常
    NSAssert([targetVc isKindOfClass:[UIViewController class]], @"%@控制器的名字错了 ",vcName);
    
    
    
    //2.设置TabBarItem
    targetVc.title = title;// 导航栏 和 tabBar的标题一次性设置
    targetVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //3.嵌套NavVc
    HBNavViewController *nav = [[HBNavViewController alloc]initWithRootViewController:targetVc];
    
    
    return nav;
    
    
}


@end
