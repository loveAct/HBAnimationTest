//
//  HBSliderViewController.h
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBSliderViewController : UIViewController

- (instancetype)initWithLeftViewController:(UIViewController *)leftVc  withRightViewController:(UIViewController *)rightVc;

@property (nonatomic, strong) UIViewController  *rightVc;

- (void)close;

@end
