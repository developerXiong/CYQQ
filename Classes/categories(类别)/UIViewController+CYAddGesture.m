//
//  UIViewController+CYAddGesture.m
//  CYQQ
//
//  Created by jeader on 16/5/26.
//  Copyright © 2016年 jeader. All rights reserved.
//  添加左滑的手势

#import "UIViewController+CYAddGesture.h"

#import "Header.h"

#define WINDOWX Width-50

static UITapGestureRecognizer *_tap;
static UIView *_view;

@implementation UIViewController (CYAddGesture)

-(void)addGesture
{
    // 手势存在的视图
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, self.view.bounds.size.height)];
    _view = view;
    [self.view addSubview:view];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [view addGestureRecognizer:pan];
    
    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
}

// 拖动手势
-(void)handleSwipeFrom:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 向右滑
    if (translation.x>0&&-1<window.x&&window.x<WINDOWX) {
        window.x = translation.x;
        if (translation.x>=WINDOWX) { // 到头了
            window.x = WINDOWX;
            [_view addGestureRecognizer:_tap]; // 添加点击手势
        }else{
            if (recognizer.state==UIGestureRecognizerStateEnded) {  // 拖动结束
                
                if (window.x>Width/3) { // 大于三分之一的屏幕
                    window.x = WINDOWX;
                    [_view addGestureRecognizer:_tap]; // 添加点击手势
                }else{
                    window.x = 0;
                }
                
            }
        }
    }
    
    // 向左滑
    if (translation.x<0&&0<window.x&&window.x<=WINDOWX){
        
        window.x = WINDOWX+translation.x;
        
        if (translation.x<=-WINDOWX) { // 到头了
            window.x = 0;
            [_view removeGestureRecognizer:_tap]; // 移除点击手势
        }else{
            if (recognizer.state==UIGestureRecognizerStateEnded) {  // 拖动结束
                
                if (window.x<Width*2/3) { // 大于三分之一的屏幕
                    window.x = 0;
                    [_view removeGestureRecognizer:_tap]; // 移除点击手势
                }else{
                    window.x = WINDOWX;
                }
                
            }
        }
    }
    
}

// 点击手势
-(void)handleTap:(UITapGestureRecognizer *)tap
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [UIView animateWithDuration:0.3 animations:^{
       
        window.x = 0;
        
    }];
}

@end
