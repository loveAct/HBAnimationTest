//
//  HBBaseViewController.m
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBBaseViewController.h"
#import "GooeySlideMenu.h"
#import "UIView+HBRespondVC.h"
@interface HBBaseViewController ()

@end

@implementation HBBaseViewController{
    GooeySlideMenu *menu;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    menu = [[GooeySlideMenu alloc]initWithTitles:@[@"首页",@"消息",@"商店",@"我的"]];
    __weak typeof(self) weakSelf = self;
    
    menu.menuClickBlock = ^(NSInteger index,NSString *title,NSInteger titleCounts){
        
        UITabBarController *tabBar = [weakSelf.view getTabBarController];
        tabBar.selectedIndex = index;
    };
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"leftView" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftViewBtn:)];

    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)clickLeftViewBtn:(UIBarButtonItem*)btn{
    [menu trigger];
}


@end
