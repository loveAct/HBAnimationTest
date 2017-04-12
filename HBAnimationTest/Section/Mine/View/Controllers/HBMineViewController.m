//
//  HBMineViewController.m
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBMineViewController.h"
#import "InteractiveView.h"

@interface HBMineViewController ()

@end

@implementation HBMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
  
    InteractiveView *interactiveView = [[InteractiveView alloc]initWithImage:[UIImage imageNamed:@"pic01"]];
    interactiveView.center = self.view.center;
    interactiveView.bounds = CGRectMake(0, 0, 200, 150);
    interactiveView.gestureView = self.view;
    
    //模糊图层
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    blurView.frame = self.view.bounds;
    [self.view addSubview:blurView];
    interactiveView.dimmingView = blurView;
    
    //interactiveView 的父视图。注意：interactiveView 和 blurView 不能添加到同一个父视图。否则透视效果会使 interactiveView 穿过 blurView
    UIView *backView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:backView];
    
    [backView addSubview:interactiveView];

}




@end
