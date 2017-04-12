//
//  HBShopViewController.m
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBShopViewController.h"

#import <CoreMotion/CoreMotion.h>

@interface HBShopViewController ()
//运动 动画
@property(nonatomic,strong) UIDynamicAnimator *animator;
//重力行为
@property(nonatomic,strong) UIGravityBehavior *gravity;
//碰撞行为  Boundary
@property(nonatomic,strong) UICollisionBehavior *collision;
@property(nonatomic,strong) NSMutableArray *starArr;
//运动管理器，提供方向
@property(nonatomic,strong) CMMotionManager *motionManager;
//粘行为
@property(nonatomic,strong) UISnapBehavior *snapBehavior;
@property(nonatomic,strong) UIView *redView;

@end

@implementation HBShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self setupAnimation];
}
-(void)setupAnimation{
    self.motionManager = [[CMMotionManager alloc]init];
    self.starArr = [NSMutableArray array];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizer:)];
    [self.view addGestureRecognizer:pan];
    [self startAnimation];
}
-(void)startAnimation{
    for (int i = 0; i < 4; i ++) {
        [self.starArr addObject:[self creatStartView]];
    }
    
    [self.starArr addObject:[self addRedView]];
    self.gravity = [[UIGravityBehavior alloc] initWithItems:self.starArr];
    self.gravity.magnitude = 0.8;
    
    self.collision = [[UICollisionBehavior alloc]initWithItems:self.starArr];
    
    [self setBoundaries];
    
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
    
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(setDynamicGravity) userInfo:nil repeats:YES];
    
}

-(void)setBoundaries{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 100, 300, 300) cornerRadius:100];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer setMask:shapeLayer];
    
    [_collision addBoundaryWithIdentifier:@"xx" forPath:bezierPath];
}
#pragma mark
#pragma mark - 创建星星视图
-(UIView *)creatStartView{
    UIImageView *star = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MSRInfo_Main_star_01"]];
    CGFloat x = arc4random_uniform(50) + 7;
    star.frame = CGRectMake(x, 200, 24, 24);
    [self.view addSubview:star];
    return star;
}
-(UIView*)addRedView{
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 50, 50)];
    [self.view addSubview:redView];
    _redView = redView;
    redView.backgroundColor = [UIColor redColor];
    return redView;
}

#pragma mark
#pragma mark - 动态改变重力   需要不断的调用这个方法
-(void)setDynamicGravity{
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        double rotation = atan2(motion.gravity.x, motion.gravity.y) - (M_PI/2);
        [self.gravity setAngle:rotation magnitude:0.8];
    }];
}

#pragma mark
#pragma mark - 使物体粘着手指滑动，，，和手势滑动

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture
{
    CGPoint tapPoint = [gesture locationInView:self.view];
    if (_snapBehavior) {
        [self.animator removeBehavior:_snapBehavior];
        _snapBehavior = nil;
    }
    _snapBehavior = [[UISnapBehavior alloc]initWithItem:self.redView snapToPoint:tapPoint];
    _snapBehavior.action = ^(){
        NSLog(@"UISnapBehavior 在执行");
    };
    _snapBehavior.damping = 0.8;//弹性
    [self.animator addBehavior:_snapBehavior];
    if (gesture.state == UIGestureRecognizerStateEnded) {
        //        移除运动
        [self.animator removeBehavior:_snapBehavior];
    }
    
}
@end
