//
//  HBSliderViewController.m
//  HBAnimationTest
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBSliderViewController.h"

#define kWidth    self.view.bounds.size.width
#define kMargin 64
@interface HBSliderViewController ()



@property (nonatomic, weak) UITapGestureRecognizer *tapTap;
@end

@implementation HBSliderViewController

- (instancetype)initWithLeftViewController:(UIViewController *)leftVc withRightViewController:(UIViewController *)rightVc
{
    if (self = [super init]) {
        
        //纯代码
        
        //1.添加子控制器
        [self addChildViewController:leftVc];
        [self addChildViewController:rightVc];
        
        
        //2.添加子VIew
        [self.view addSubview:leftVc.view];
        [self.view addSubview:rightVc.view];
        
        
        //3.didmoveParentController
        [leftVc didMoveToParentViewController:self];
        [rightVc didMoveToParentViewController:self];
        
        
        //添加拖拽手势
        [self setupUI];
        
        //关联
        _rightVc = rightVc;
        
    }
    
    return self;
    
    
}

- (void)setupUI
{
    //1.创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    //2.添加
    [self.view addGestureRecognizer:pan];
    
}

//监听拖拽手势
- (void)pan:(UIPanGestureRecognizer *)sender
{
    //1.偏移
    CGPoint offset = [sender translationInView:sender.view];
    //2.归零
    
    [sender setTranslation:CGPointZero inView:sender.view];
    
    
    //避免 左穿透
    if(offset.x + _rightVc.view.frame.origin.x < 0){
        
        return;
        
    }
    
    
    
    //手势的阶段
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
            
            //3.设置形变属性
            _rightVc.view.transform = CGAffineTransformTranslate(_rightVc.view.transform, offset.x, 0);
            _rightVc.view.transform = CGAffineTransformTranslate(_rightVc.view.transform, offset.y/10, 0);

            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateEnded:
            
            if (_rightVc.view.frame.origin.x > kWidth * 0.5) {
                
                [self open];
            }else{
                
                [self close];
                
            }
            
            
            break;
            
        default:
            break;
    }
    
}

//打开
- (void)open
{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _rightVc.view.transform = CGAffineTransformMakeTranslation(kWidth - kMargin, 0);
    }];
    
    //避免重复添加 tap手势
    
    //    if(![_rightVc.view.gestureRecognizers containsObject:_tapTap]){
    //
    
    if (!_tapTap) {
        
        //添加 tap手势
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        
        [_rightVc.view addGestureRecognizer:tap];
        
        _tapTap = tap;
        
    }
    
    
}

- (void)tap:(UITapGestureRecognizer *)sender
{
    //关闭
    [self close];
    
    
    
}

//关闭
- (void)close
{
    [UIView animateWithDuration:0.5 animations:^{
        
        _rightVc.view.transform = CGAffineTransformIdentity;
    }];
    //用完了删除
    [_rightVc.view removeGestureRecognizer:_tapTap];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
