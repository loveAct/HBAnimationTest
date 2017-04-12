//
//  UIView+LXFRespondVC.m
//  LoveXianFeng
//
//  Created by apple on 2016/12/26.
//  Copyright © 2016年 WangChen. All rights reserved.
//

#import "UIView+HBRespondVC.h"

@implementation UIView (HBRespondVC)

-(UITabBarController *)getTabBarController{
    
    UIResponder *v = self.nextResponder;
    while (v != nil) {
        
        if ([v isKindOfClass:[UITabBarController class]]){
            UITabBarController *nv = (UITabBarController*)v;
            
            return nv;
        }
        v = v.nextResponder;
        
    }
    return nil;
}

-(UINavigationController *)getNaviController{
    
    UIResponder *v = self.nextResponder;
    while (v != nil) {
        
        if ([v isKindOfClass:[UINavigationController class]]){
            UINavigationController *nv = (UINavigationController*)v;
            
            return nv;
        }
        v = v.nextResponder;
        
    }
    return nil;
}



@end
