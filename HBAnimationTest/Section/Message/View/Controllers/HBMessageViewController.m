//
//  HBMessageViewController.m
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBMessageViewController.h"
#import "DownloadButton.h"

@interface HBMessageViewController ()
@property(nonatomic,strong) DownloadButton *downloadButton;
@end

@implementation HBMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.button = [UIButton buttonWithType:0];
    [self.button setBackgroundColor:[UIColor greenColor]];
    self.button.frame = CGRectMake(0, 0, 50, 50);
    self.button.center = CGPointMake(self.view.bounds.size.width-50, 25);
    [self.view addSubview:self.button];
    
    //添加了一行注释 15-11-15
    //又添加了一行注释 15-11-16
    self.downloadButton = [[DownloadButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.downloadButton.backgroundColor = [UIColor blueColor];
    self.downloadButton.center = self.view.center;
    self.downloadButton.progressBarWidth  = 200;
    self.downloadButton.progressBarHeight = 30;
    self.downloadButton.layer.cornerRadius = self.downloadButton.bounds.size.width/2;
    self.downloadButton.layer.masksToBounds = YES;
    [self.view addSubview:self.downloadButton];
}


@end
