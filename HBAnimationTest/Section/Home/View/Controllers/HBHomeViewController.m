//
//  HBHomeViewController.m
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBHomeViewController.h"
#import "InteractiveView.h"

@interface HBHomeViewController ()

@end

@implementation HBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];

    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -20);
    snowEmitter.emitterSize  = CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    snowEmitter.emitterMode  = kCAEmitterLayerOutline;
    
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    snowflake.birthRate	= 1.0;
    snowflake.lifetime	= 120.0;
    snowflake.velocity	= -10;
    snowflake.velocityRange = 10;
    snowflake.yAcceleration = 2;
    snowflake.emissionRange = 0.5 * M_PI;
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents  = (id) [[UIImage imageNamed:@"snow"] CGImage];
    snowflake.color	= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
    
}



@end
